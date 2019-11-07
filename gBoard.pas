Unit gBoard;

Interface

	Type 
		board = array[1..5,1..5] of boolean;
		ptrBoard = ^board;
		GameBoard = object
			logicMatrix : board;
			boardStatus : boolean;
			Constructor init;
			Procedure setBoardStatus(pBoardStatus:boolean);
			Procedure initializeBoard;
			Procedure move(pRow, pColumn:integer);
			Procedure calculateBoardStatus;
			Procedure printBoard;
			Function getLogicMatrix : ptrBoard;
			Function getBoardStatus : boolean;
	end;

Implementation

	Constructor GameBoard.init;
	begin
		initializeBoard;
	end;
	
	Procedure GameBoard.setBoardStatus(pBoardStatus:boolean);
	begin
		boardStatus := pBoardStatus;
	end;
	
	Procedure GameBoard.initializeBoard;
	var
		row : integer;
		column : integer;
	begin
		for row := 1 to 5 do
		begin
			for column := 1 to 5 do
			begin
				logicMatrix[row,column] := false;
			end;
		end;
	end;
	
	Procedure GameBoard.move(pRow,pColumn:integer);
	begin
		logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn];
		if (pRow = 1) and (pColumn = 1) then
		begin
			logicMatrix[pRow,pColumn+1] := not logicMatrix[pRow,pColumn+1];
			logicMatrix[pRow+1,pColumn] := not logicMatrix[pRow+1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if (pRow = 5) and (pColumn = 5) then
		begin
			logicMatrix[pRow,pColumn-1] := not logicMatrix[pRow,pColumn-1];
			logicMatrix[pRow+1,pColumn] := not logicMatrix[pRow+1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if (pRow = 5) and (pColumn = 1) then
		begin
			logicMatrix[pRow,pColumn+1] := not logicMatrix[pRow,pColumn+1];
			logicMatrix[pRow-1,pColumn] := not logicMatrix[pRow-1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if (pRow = 5) and (pColumn = 1) then
		begin
			logicMatrix[pRow,pColumn-1] := not logicMatrix[pRow,pColumn-1];
			logicMatrix[pRow-1,pColumn] := not logicMatrix[pRow-1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if pRow = 5 then
		begin
			logicMatrix[pRow,pColumn-1] := not logicMatrix[pRow,pColumn-1];
			logicMatrix[pRow,pColumn+1] := not logicMatrix[pRow,pColumn+1];
			logicMatrix[pRow-1,pColumn] := not logicMatrix[pRow-1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if pColumn = 5 then
		begin
			logicMatrix[pRow,pColumn-1] := not logicMatrix[pRow,pColumn-1];
			logicMatrix[pRow+1,pColumn] := not logicMatrix[pRow+1,pColumn];
			logicMatrix[pRow-1,pColumn] := not logicMatrix[pRow-1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		logicMatrix[pRow,pColumn-1] := not logicMatrix[pRow,pColumn-1];
		logicMatrix[pRow,pColumn+1] := not logicMatrix[pRow,pColumn+1];
		logicMatrix[pRow-1,pColumn] := not logicMatrix[pRow-1,pColumn];
		logicMatrix[pRow+1,pColumn] := not logicMatrix[pRow+1,pColumn];
		calculateBoardStatus;
		
	end;
	
	Procedure GameBoard.calculateBoardStatus;
	var
		row : integer;
		column: integer;
	begin
		for row := 1 to 5 do
		begin
			for column := 1 to 5 do
			begin;
				if logicMatrix[row,column] = true then
				begin
					setBoardStatus(true);
					exit;
				end;
			end;
		end;
		setBoardStatus(true);
	end;
	
	Procedure GameBoard.printBoard;
	var
		row : integer;
		column: integer;
		S : String;
	begin
		S := #10#13;  
		for row := 1 to 5 do
		begin
			for column := 1 to 5 do
			begin
				write (logicMatrix[row,column],' ');
			end;
			writeln(S);
		end;
			
	end;
	
	Function GameBoard.getLogicMatrix : ptrBoard;
	begin
		getLogicMatrix := @logicMatrix;
	end;
	
	Function GameBoard.getBoardStatus : boolean;
	begin
		getBoardStatus:= boardStatus;
	end;
end.