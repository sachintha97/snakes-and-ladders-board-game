Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(SnakesAndLaddersGame))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(SnakesAndLaddersGame))==(Machine(SnakesAndLaddersGame));
  Level(Machine(SnakesAndLaddersGame))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(SnakesAndLaddersGame)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(SnakesAndLaddersGame))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(SnakesAndLaddersGame))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(SnakesAndLaddersGame))==(?);
  List_Includes(Machine(SnakesAndLaddersGame))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(SnakesAndLaddersGame))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(SnakesAndLaddersGame))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(SnakesAndLaddersGame))==(?);
  Context_List_Variables(Machine(SnakesAndLaddersGame))==(?);
  Abstract_List_Variables(Machine(SnakesAndLaddersGame))==(?);
  Local_List_Variables(Machine(SnakesAndLaddersGame))==(dice_value,dice_value_lastthrown,ladder_gone_up,snake_gone_down,number_moves,visited_square,next_position,current_position);
  List_Variables(Machine(SnakesAndLaddersGame))==(dice_value,dice_value_lastthrown,ladder_gone_up,snake_gone_down,number_moves,visited_square,next_position,current_position);
  External_List_Variables(Machine(SnakesAndLaddersGame))==(dice_value,dice_value_lastthrown,ladder_gone_up,snake_gone_down,number_moves,visited_square,next_position,current_position)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(SnakesAndLaddersGame))==(?);
  Abstract_List_VisibleVariables(Machine(SnakesAndLaddersGame))==(?);
  External_List_VisibleVariables(Machine(SnakesAndLaddersGame))==(?);
  Expanded_List_VisibleVariables(Machine(SnakesAndLaddersGame))==(?);
  List_VisibleVariables(Machine(SnakesAndLaddersGame))==(?);
  Internal_List_VisibleVariables(Machine(SnakesAndLaddersGame))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(SnakesAndLaddersGame))==(btrue);
  Gluing_List_Invariant(Machine(SnakesAndLaddersGame))==(btrue);
  Expanded_List_Invariant(Machine(SnakesAndLaddersGame))==(btrue);
  Abstract_List_Invariant(Machine(SnakesAndLaddersGame))==(btrue);
  Context_List_Invariant(Machine(SnakesAndLaddersGame))==(btrue);
  List_Invariant(Machine(SnakesAndLaddersGame))==(current_position: boardSquare & next_position: NAT & visited_square: seq(boardSquare) & number_moves: NAT & snake_gone_down: NAT & ladder_gone_up: NAT & dice_value_lastthrown: diceValues & dice_value: diceValues)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(SnakesAndLaddersGame))==(btrue);
  Abstract_List_Assertions(Machine(SnakesAndLaddersGame))==(btrue);
  Context_List_Assertions(Machine(SnakesAndLaddersGame))==(btrue);
  List_Assertions(Machine(SnakesAndLaddersGame))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(SnakesAndLaddersGame))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(SnakesAndLaddersGame))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(SnakesAndLaddersGame))==(current_position,next_position,visited_square,number_moves,snake_gone_down,ladder_gone_up,dice_value_lastthrown,dice_value:=0,0,<>,0,0,0,0,0);
  Context_List_Initialisation(Machine(SnakesAndLaddersGame))==(skip);
  List_Initialisation(Machine(SnakesAndLaddersGame))==(current_position:=0 || next_position:=0 || visited_square:=<> || number_moves:=0 || snake_gone_down:=0 || ladder_gone_up:=0 || dice_value_lastthrown:=0 || dice_value:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(SnakesAndLaddersGame))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(SnakesAndLaddersGame))==(btrue);
  List_Constraints(Machine(SnakesAndLaddersGame))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(SnakesAndLaddersGame))==(DiceRollValue,Move,GameStatistics,VisitedSquares,NewGame);
  List_Operations(Machine(SnakesAndLaddersGame))==(DiceRollValue,Move,GameStatistics,VisitedSquares,NewGame)
END
&
THEORY ListInputX IS
  List_Input(Machine(SnakesAndLaddersGame),DiceRollValue)==(rollValue);
  List_Input(Machine(SnakesAndLaddersGame),Move)==(?);
  List_Input(Machine(SnakesAndLaddersGame),GameStatistics)==(?);
  List_Input(Machine(SnakesAndLaddersGame),VisitedSquares)==(?);
  List_Input(Machine(SnakesAndLaddersGame),NewGame)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(SnakesAndLaddersGame),DiceRollValue)==(?);
  List_Output(Machine(SnakesAndLaddersGame),Move)==(report);
  List_Output(Machine(SnakesAndLaddersGame),GameStatistics)==(currentPosition,encounteredSnakes,encounteredLadders,numTurnsTaken);
  List_Output(Machine(SnakesAndLaddersGame),VisitedSquares)==(visitedSquare);
  List_Output(Machine(SnakesAndLaddersGame),NewGame)==(report)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(SnakesAndLaddersGame),DiceRollValue)==(DiceRollValue(rollValue));
  List_Header(Machine(SnakesAndLaddersGame),Move)==(report <-- Move);
  List_Header(Machine(SnakesAndLaddersGame),GameStatistics)==(currentPosition,encounteredSnakes,encounteredLadders,numTurnsTaken <-- GameStatistics);
  List_Header(Machine(SnakesAndLaddersGame),VisitedSquares)==(visitedSquare <-- VisitedSquares);
  List_Header(Machine(SnakesAndLaddersGame),NewGame)==(report <-- NewGame)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(SnakesAndLaddersGame),DiceRollValue)==(rollValue: diceValues & not(current_position = lastSqure));
  List_Precondition(Machine(SnakesAndLaddersGame),Move)==(report: REPORT & dice_value>=1 & dice_value<=6 & not(current_position = lastSqure));
  List_Precondition(Machine(SnakesAndLaddersGame),GameStatistics)==(btrue);
  List_Precondition(Machine(SnakesAndLaddersGame),VisitedSquares)==(btrue);
  List_Precondition(Machine(SnakesAndLaddersGame),NewGame)==(report: REPORT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(SnakesAndLaddersGame),NewGame)==(report: REPORT | current_position,next_position,visited_square,number_moves,snake_gone_down,ladder_gone_up,dice_value_lastthrown,dice_value,report:=0,0,<>,0,0,0,0,0,NEW_GAME_HAS_STARTED);
  Expanded_List_Substitution(Machine(SnakesAndLaddersGame),VisitedSquares)==(btrue | visitedSquare:=visited_square);
  Expanded_List_Substitution(Machine(SnakesAndLaddersGame),GameStatistics)==(btrue | currentPosition,encounteredSnakes,encounteredLadders,numTurnsTaken:=current_position,snake_gone_down,ladder_gone_up,number_moves);
  Expanded_List_Substitution(Machine(SnakesAndLaddersGame),Move)==(report: REPORT & dice_value>=1 & dice_value<=6 & not(current_position = lastSqure) | next_position: dom(snakesPositions) ==> current_position,visited_square,number_moves,snake_gone_down,dice_value,next_position,report:=snakesPositions(next_position),visited_square<-next_position\/visited_square<-snakesPositions(next_position),succ(number_moves),succ(snake_gone_down),0,snakesPositions(next_position),WENT_DOWN_A_SNAKE [] not(next_position: dom(snakesPositions)) ==> (next_position: dom(laddersPositions) ==> current_position,visited_square,number_moves,ladder_gone_up,dice_value,next_position,report:=laddersPositions(next_position),visited_square<-next_position\/visited_square<-laddersPositions(next_position),succ(number_moves),succ(ladder_gone_up),0,laddersPositions(next_position),GO_UP_A_LADDER [] not(next_position: dom(laddersPositions)) ==> (not(next_position: boardSquare) ==> dice_value,report:=0,THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH [] not(not(next_position: boardSquare)) ==> (next_position = lastSqure ==> current_position,visited_square,number_moves,dice_value,report:=next_position,visited_square<-next_position,succ(number_moves),0,GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME [] not(next_position = lastSqure) ==> current_position,visited_square,number_moves,dice_value,report:=next_position,visited_square<-next_position,succ(number_moves),0,LANDED_ON_A_NORMAL_SQUARE))));
  Expanded_List_Substitution(Machine(SnakesAndLaddersGame),DiceRollValue)==(rollValue: diceValues & not(current_position = lastSqure) | dice_value_lastthrown,dice_value,next_position:=rollValue,rollValue,current_position+rollValue);
  List_Substitution(Machine(SnakesAndLaddersGame),DiceRollValue)==(dice_value_lastthrown:=rollValue || dice_value:=rollValue || next_position:=current_position+rollValue);
  List_Substitution(Machine(SnakesAndLaddersGame),Move)==(IF next_position: dom(snakesPositions) THEN current_position:=snakesPositions(next_position) || visited_square:=visited_square<-next_position\/visited_square<-snakesPositions(next_position) || number_moves:=succ(number_moves) || snake_gone_down:=succ(snake_gone_down) || dice_value:=0 || next_position:=snakesPositions(next_position) || report:=WENT_DOWN_A_SNAKE ELSIF next_position: dom(laddersPositions) THEN current_position:=laddersPositions(next_position) || visited_square:=visited_square<-next_position\/visited_square<-laddersPositions(next_position) || number_moves:=succ(number_moves) || ladder_gone_up:=succ(ladder_gone_up) || dice_value:=0 || next_position:=laddersPositions(next_position) || report:=GO_UP_A_LADDER ELSIF not(next_position: boardSquare) THEN dice_value:=0 || report:=THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH ELSIF next_position = lastSqure THEN current_position:=next_position || visited_square:=visited_square<-next_position || number_moves:=succ(number_moves) || dice_value:=0 || report:=GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME ELSE current_position:=next_position || visited_square:=visited_square<-next_position || number_moves:=succ(number_moves) || dice_value:=0 || report:=LANDED_ON_A_NORMAL_SQUARE END);
  List_Substitution(Machine(SnakesAndLaddersGame),GameStatistics)==(currentPosition:=current_position || encounteredSnakes:=snake_gone_down || encounteredLadders:=ladder_gone_up || numTurnsTaken:=number_moves);
  List_Substitution(Machine(SnakesAndLaddersGame),VisitedSquares)==(visitedSquare:=visited_square);
  List_Substitution(Machine(SnakesAndLaddersGame),NewGame)==(current_position:=0 || next_position:=0 || visited_square:=<> || number_moves:=0 || snake_gone_down:=0 || ladder_gone_up:=0 || dice_value_lastthrown:=0 || dice_value:=0 || report:=NEW_GAME_HAS_STARTED)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(SnakesAndLaddersGame))==(boardSquare,snakesPositions,laddersPositions,diceValues,lastSqure);
  Inherited_List_Constants(Machine(SnakesAndLaddersGame))==(?);
  List_Constants(Machine(SnakesAndLaddersGame))==(boardSquare,snakesPositions,laddersPositions,diceValues,lastSqure)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(SnakesAndLaddersGame),REPORT)==({NEW_GAME_HAS_STARTED,LANDED_ON_A_NORMAL_SQUARE,WENT_DOWN_A_SNAKE,GO_UP_A_LADDER,THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH,GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME});
  Context_List_Enumerated(Machine(SnakesAndLaddersGame))==(?);
  Context_List_Defered(Machine(SnakesAndLaddersGame))==(?);
  Context_List_Sets(Machine(SnakesAndLaddersGame))==(?);
  List_Valuable_Sets(Machine(SnakesAndLaddersGame))==(?);
  Inherited_List_Enumerated(Machine(SnakesAndLaddersGame))==(?);
  Inherited_List_Defered(Machine(SnakesAndLaddersGame))==(?);
  Inherited_List_Sets(Machine(SnakesAndLaddersGame))==(?);
  List_Enumerated(Machine(SnakesAndLaddersGame))==(REPORT);
  List_Defered(Machine(SnakesAndLaddersGame))==(?);
  List_Sets(Machine(SnakesAndLaddersGame))==(REPORT)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(SnakesAndLaddersGame))==(?);
  Expanded_List_HiddenConstants(Machine(SnakesAndLaddersGame))==(?);
  List_HiddenConstants(Machine(SnakesAndLaddersGame))==(?);
  External_List_HiddenConstants(Machine(SnakesAndLaddersGame))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(SnakesAndLaddersGame))==(btrue);
  Context_List_Properties(Machine(SnakesAndLaddersGame))==(btrue);
  Inherited_List_Properties(Machine(SnakesAndLaddersGame))==(btrue);
  List_Properties(Machine(SnakesAndLaddersGame))==(boardSquare <: NAT1 & boardSquare = 1..100 & snakesPositions: POW(NAT1*NAT1) & snakesPositions = {16|->13,31|->4,47|->25,63|->60,66|->52,97|->75} & laddersPositions: POW(NAT1*NAT1) & laddersPositions = {3|->39,10|->12,27|->53,56|->84,61|->99,72|->90} & diceValues = {1,2,3,4,5,6} & lastSqure = 100 & REPORT: FIN(INTEGER) & not(REPORT = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(SnakesAndLaddersGame),DiceRollValue)==(?);
  List_ANY_Var(Machine(SnakesAndLaddersGame),Move)==(?);
  List_ANY_Var(Machine(SnakesAndLaddersGame),GameStatistics)==(?);
  List_ANY_Var(Machine(SnakesAndLaddersGame),VisitedSquares)==(?);
  List_ANY_Var(Machine(SnakesAndLaddersGame),NewGame)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(SnakesAndLaddersGame)) == (boardSquare,snakesPositions,laddersPositions,diceValues,lastSqure,REPORT,NEW_GAME_HAS_STARTED,LANDED_ON_A_NORMAL_SQUARE,WENT_DOWN_A_SNAKE,GO_UP_A_LADDER,THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH,GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME | ? | dice_value,dice_value_lastthrown,ladder_gone_up,snake_gone_down,number_moves,visited_square,next_position,current_position | ? | DiceRollValue,Move,GameStatistics,VisitedSquares,NewGame | ? | ? | ? | SnakesAndLaddersGame);
  List_Of_HiddenCst_Ids(Machine(SnakesAndLaddersGame)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(SnakesAndLaddersGame)) == (boardSquare,snakesPositions,laddersPositions,diceValues,lastSqure);
  List_Of_VisibleVar_Ids(Machine(SnakesAndLaddersGame)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(SnakesAndLaddersGame)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(SnakesAndLaddersGame)) == (Type(REPORT) == Cst(SetOf(etype(REPORT,0,5))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(SnakesAndLaddersGame)) == (Type(NEW_GAME_HAS_STARTED) == Cst(etype(REPORT,0,5));Type(LANDED_ON_A_NORMAL_SQUARE) == Cst(etype(REPORT,0,5));Type(WENT_DOWN_A_SNAKE) == Cst(etype(REPORT,0,5));Type(GO_UP_A_LADDER) == Cst(etype(REPORT,0,5));Type(THREW_TOO_HIGH_A_DEVICE_VALUE_TO_FINISH) == Cst(etype(REPORT,0,5));Type(GAME_FINISHED_AND_WON_PLEASE_START_A_NEW_GAME) == Cst(etype(REPORT,0,5));Type(boardSquare) == Cst(SetOf(btype(INTEGER,"[boardSquare","]boardSquare")));Type(snakesPositions) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(laddersPositions) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(diceValues) == Cst(SetOf(btype(INTEGER,"[diceValues","]diceValues")));Type(lastSqure) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(SnakesAndLaddersGame)) == (Type(dice_value) == Mvl(btype(INTEGER,?,?));Type(dice_value_lastthrown) == Mvl(btype(INTEGER,?,?));Type(ladder_gone_up) == Mvl(btype(INTEGER,?,?));Type(snake_gone_down) == Mvl(btype(INTEGER,?,?));Type(number_moves) == Mvl(btype(INTEGER,?,?));Type(visited_square) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(next_position) == Mvl(btype(INTEGER,?,?));Type(current_position) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(SnakesAndLaddersGame)) == (Type(NewGame) == Cst(etype(REPORT,?,?),No_type);Type(VisitedSquares) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(GameStatistics) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(Move) == Cst(etype(REPORT,?,?),No_type);Type(DiceRollValue) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(SnakesAndLaddersGame)) == (Type(VisitedSquares) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(GameStatistics) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
