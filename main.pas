program boardTest;

uses
	GBOARD;
	
var
   board1: GameBoard;
   ptrBoard: ^GameBoard;
begin
	board1.init;
	board1.move(3,3);
	board1.printBoard;
  
end.