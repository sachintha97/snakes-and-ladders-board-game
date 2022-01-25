/* SnakesAndLaddersGame
 * Author: Sachintha
 * Creation date: 1/20/2022
 */
MACHINE
    SnakesAndLaddersGame

SETS
    REPORT = {NEW_GAME_HAS_STARTED, LANDED_ON_A_NORMAL_SQUARE, WENT_DOWN_A_SNAKE, GO_UP_A_LADDER, THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH, GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME}
    
CONSTANTS
    boardSquare,
    snakesPositions,
    laddersPositions,
    diceValues,
    lastSqure
    
PROPERTIES
    boardSquare <: NAT1 & boardSquare = 1..100 &
    snakesPositions : POW(NAT1 * NAT1) & 
    snakesPositions = {(16|->13), (31|->4), (47|->25), (63|->60), (66|->52), (97|->75)} &
    laddersPositions : POW(NAT1 * NAT1) & 
    laddersPositions = {(3|->39), (10|->12), (27|->53), (56|->84), (61|->99), (72|->90)} &
    diceValues = {1,2,3,4,5,6} &
    lastSqure = 100
    
DEFINITIONS
    isInsideBoard(position1) == (position1:boardSquare);
    isDiceRoll == (dice_value >= 1) & (dice_value <= 6);
    isGameOver == (current_position = lastSqure)
    
VARIABLES
    current_position,
    next_position,
    visited_square,
    number_moves,
    snake_gone_down,
    ladder_gone_up,
    dice_value_lastthrown,
    dice_value
    
INVARIANT
    current_position : boardSquare &
    next_position : NAT &
    visited_square : seq(boardSquare) &
    number_moves : NAT &
    snake_gone_down : NAT &
    ladder_gone_up : NAT &
    dice_value_lastthrown : diceValues &
    dice_value : diceValues
 
 
INITIALISATION
    current_position := 0 ||
    next_position := 0 ||
    visited_square := [] ||
    number_moves := 0 ||
    snake_gone_down := 0 ||
    ladder_gone_up := 0 ||
    dice_value_lastthrown := 0 ||
    dice_value := 0
    
OPERATIONS
    // Operation for dice roll
    DiceRollValue(rollValue) =
    PRE
        rollValue:diceValues & not(isGameOver)
    THEN
        dice_value_lastthrown := rollValue ||
        dice_value := rollValue ||
        next_position := current_position + rollValue 
       
    END;    
    
    // Operation for move
    report <-- Move =
    PRE
        report : REPORT & isDiceRoll & not(isGameOver)
    THEN
        // Check whether landed on the snakes head 
        IF
            (next_position : dom(snakesPositions))
        THEN
            current_position := snakesPositions(next_position) ||
            visited_square := visited_square <- next_position \/ visited_square <- snakesPositions(next_position)||
            number_moves := succ( number_moves ) ||
            snake_gone_down := succ(snake_gone_down) ||
            dice_value := 0 ||
            next_position := snakesPositions(next_position) ||
            report := WENT_DOWN_A_SNAKE
        // Check whether landed on the ladder's bottom 
        ELSIF
            (next_position : dom(laddersPositions))
        THEN
            current_position := laddersPositions(next_position) ||
            visited_square := visited_square <- next_position \/ visited_square <- laddersPositions(next_position)||
            number_moves := succ( number_moves ) ||
            ladder_gone_up := succ(ladder_gone_up) ||
            dice_value := 0 ||
            next_position := laddersPositions(next_position) ||
            report := GO_UP_A_LADDER
        // Check whether the player is inside the board or not     
        ELSIF
            not(isInsideBoard(next_position))
        THEN
            dice_value := 0 ||
            report := THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH
        // Check whether landed on the last square     
        ELSIF
            (next_position = lastSqure)
        THEN
            current_position := next_position ||
            visited_square := visited_square <- next_position ||
            number_moves := succ( number_moves ) ||
            dice_value := 0 ||
            report := GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME
        // Landed on normal square    
        ELSE
            current_position := next_position ||
            visited_square := visited_square <- next_position ||
            number_moves := succ( number_moves ) ||
            dice_value := 0 ||
            report := LANDED_ON_A_NORMAL_SQUARE
        END
    END;
    
    // Outputs the current statistics for the game (current position on the board, the number of snakes and ladders encountered, number of turns taken)
    currentPosition, encounteredSnakes, encounteredLadders, numTurnsTaken <-- GameStatistics =
    BEGIN
        currentPosition := current_position ||
        encounteredSnakes := snake_gone_down ||
        encounteredLadders := ladder_gone_up ||
        numTurnsTaken := number_moves
    END;
    
    // Reports the list of squares that have been visited in the order visited
    visitedSquare <-- VisitedSquares =
    BEGIN
        visitedSquare := visited_square
    END;
    
    // Operation for reinitialize the game
    report <-- NewGame =
    PRE
        report : REPORT
    THEN
        current_position := 0 ||
        next_position := 0 ||
        visited_square := [] ||
        number_moves := 0 ||
        snake_gone_down := 0 ||
        ladder_gone_up := 0 ||
        dice_value_lastthrown := 0 ||
        dice_value := 0 ||
        report := NEW_GAME_HAS_STARTED
    END
 
END