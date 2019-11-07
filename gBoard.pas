Unit UGameBoard;

Interface

	Type 
		board = array[0..4,0..4] of boolean;
		ptrBoard = ^board;
		GameBoard = object
			logicMatrix : board;
			boardStatus : boolean;
			Constructor init;
			Procedure setBoardStatus(pBoardStatus:boolean);
			Procedure initializeBoard;
			Procedure move(pRow, pColumn:integer);
			Procedure calculateBoardStatus;
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
		for row := 0 to 5 do
			for column := 0 to 5 do
				logicMatrix[row,column] := false;
	end;
	
	Procedure GameBoard.move(pRow,pColumn:integer);
	begin
		logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn];
		if (pRow = 0) and (pColumn = 0) then
		begin
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn+1];
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow+1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if (pRow = 4) and (pColumn = 4) then
		begin
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn-1];
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow+1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if (pRow = 4) and (pColumn = 0) then
		begin
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn+1];
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow-1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if (pRow = 4) and (pColumn = 0) then
		begin
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn-1];
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow-1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if pRow = 4 then
		begin
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn-1];
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn+1];
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow-1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		if pColumn = 4 then
		begin
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn-1];
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow+1,pColumn];
			logicMatrix[pRow,pColumn] := not logicMatrix[pRow-1,pColumn];
			calculateBoardStatus;
			exit;
		end;
		logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn-1];
		logicMatrix[pRow,pColumn] := not logicMatrix[pRow,pColumn+1];
		logicMatrix[pRow,pColumn] := not logicMatrix[pRow-1,pColumn];
		logicMatrix[pRow,pColumn] := not logicMatrix[pRow+1,pColumn];
		calculateBoardStatus;
		
	end;
	
	Procedure GameBoard.calculateBoardStatus;
	var
		row : integer;
		column: integer;
	begin
		for row := 0 to 5 do
			for column := 0 to 5 do
				if logicMatrix[row,column] = true then
				begin
					setBoardStatus(false);
					exit;
				end;
		setBoardStatus(true);
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