/* SnakesAndLaddersGame
 * Author: Sachintha
 * Creation date: 1/20/2022
 */
MACHINE
    SnakesAndLaddersGame

SETS
    REPORT = { NEW_GAME_HAS_STARTED , LANDED_ON_A_NORMAL_SQUARE , WENT_DOWN_A_SNAKE , GO_UP_A_LADDER , THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH , GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME }

CONCRETE_CONSTANTS
    boardSquare ,
    snakesPositions ,
    laddersPositions ,
    diceValues ,
    lastSquare

PROPERTIES
    boardSquare <: NAT1 & boardSquare = 1 .. 100 &
    snakesPositions : boardSquare <-> boardSquare & snakesPositions = { ( 16 |-> 13 ) , ( 31 |-> 4 ) , ( 47 |-> 25 ) , ( 63 |-> 60 ) , ( 66 |-> 52 ) , ( 97 |-> 75 ) } &
    laddersPositions : boardSquare <-> boardSquare & laddersPositions = { ( 3 |-> 39 ) , ( 10 |-> 12 ) , ( 27 |-> 53 ) , ( 56 |-> 84 ) , ( 61 |-> 99 ) , ( 72 |-> 90 ) } &
    diceValues <: NAT & diceValues = 1 .. 6 &
    lastSquare = 100

DEFINITIONS
    isInsideBoard ( position1 ) == ( position1 : boardSquare ) ;
    isDiceRoll == ( dice_value >= 1 ) & ( dice_value <= 6 ) ;
    isGameOver == ( current_position = lastSquare )

ABSTRACT_VARIABLES
    current_position ,
    next_position ,
    visited_square ,
    number_moves ,
    number_snakes_encounter ,
    number_ladders_encounter ,
    dice_value_lastthrown ,
    dice_value

INVARIANT
    current_position : { 0 } \/ boardSquare &
    next_position : NAT &
    visited_square : seq ( boardSquare ) &
    number_moves : NAT &
    number_snakes_encounter : NAT &
    number_ladders_encounter : NAT &
    dice_value_lastthrown : { 0 } \/ diceValues &
    dice_value : { 0 } \/ diceValues


INITIALISATION
    current_position := 0 ||
    next_position := 0 ||
    visited_square := [] ||
    number_moves := 0 ||
    number_snakes_encounter := 0 ||
    number_ladders_encounter := 0 ||
    dice_value_lastthrown := 0 ||
    dice_value := 0

OPERATIONS
    // Operation for dice roll
    DiceRollValue ( rollValue ) =
    PRE
        rollValue : diceValues & not ( isGameOver )
    THEN
        dice_value_lastthrown := rollValue ||
        dice_value := rollValue ||
        next_position := current_position + rollValue

    END ;

    // Operation for move
    report , moveSquare <-- Move =
    PRE
        report : REPORT & isDiceRoll & not ( isGameOver )
    THEN
        // Check whether landed on the snakes head 
        IF
            ( next_position : dom ( snakesPositions ) )
        THEN
            current_position := snakesPositions ( next_position ) ||
            visited_square := visited_square <- next_position \/ visited_square <- snakesPositions ( next_position ) ||
            number_moves := succ ( number_moves ) ||
            number_snakes_encounter := succ ( number_snakes_encounter ) ||
            dice_value := 0 ||
            next_position := snakesPositions ( next_position ) ||
            moveSquare := snakesPositions ( next_position ) ||
            report := WENT_DOWN_A_SNAKE
        // Check whether landed on the ladder's bottom 
        ELSIF
            ( next_position : dom ( laddersPositions ) )
        THEN
            current_position := laddersPositions ( next_position ) ||
            visited_square := visited_square <- next_position \/ visited_square <- laddersPositions ( next_position ) ||
            number_moves := succ ( number_moves ) ||
            number_ladders_encounter := succ ( number_ladders_encounter ) ||
            dice_value := 0 ||
            next_position := laddersPositions ( next_position ) ||
            moveSquare := laddersPositions ( next_position ) ||
            report := GO_UP_A_LADDER
        // Check whether the player is inside the board or not     
        ELSIF
            ( next_position > 100 )
        THEN
            dice_value := 0 ||
            moveSquare := current_position ||
            report := THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH
        // Check whether landed on the last square     
        ELSIF
            ( next_position = lastSquare )
        THEN
            current_position := next_position ||
            visited_square := visited_square <- next_position ||
            number_moves := succ ( number_moves ) ||
            dice_value := 0 ||
            moveSquare := next_position ||
            report := GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME
        // Landed on normal square    
        ELSE
            current_position := next_position ||
            visited_square := visited_square <- next_position ||
            number_moves := succ ( number_moves ) ||
            dice_value := 0 ||
            moveSquare := next_position ||
            report := LANDED_ON_A_NORMAL_SQUARE
        END
    END ;

    // Outputs the current statistics for the game (current position on the board, the number of snakes and ladders encountered, number of turns taken)
    currentPosition , encounteredSnakes , encounteredLadders , numTurnsTaken <-- GameStatistics =
    BEGIN
        currentPosition := current_position ||
        encounteredSnakes := number_snakes_encounter ||
        encounteredLadders := number_ladders_encounter ||
        numTurnsTaken := number_moves
    END ;

    // Reports the list of squares that have been visited in the order visited
    visitedSquare <-- VisitedSquares =
    BEGIN
        visitedSquare := visited_square
    END ;

    // Operation for reinitialize the game
    report <-- NewGame =
    PRE
        report : REPORT
    THEN
        current_position := 0 ||
        next_position := 0 ||
        visited_square := [] ||
        number_moves := 0 ||
        number_snakes_encounter := 0 ||
        number_ladders_encounter := 0 ||
        dice_value_lastthrown := 0 ||
        dice_value := 0 ||
        report := NEW_GAME_HAS_STARTED
    END

END
