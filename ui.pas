program ui;

Uses Crt,Graph, gboard;

Var GraphicsDriver, {Declaracion de variables}
	GraphicsMode,
	x1,x2, y1, y2,
	mX, mY,	pX, pY,
	row, column,
	row1, column1 : integer;
	board1: GameBoard;
	w : ptrBoard;
	c : char;
	stay: boolean;
	
procedure drawMainMenu; {Dibuja el menu principal}
begin
ClearDevice;
MoveTo(250,200);
SetTextStyle(11,0,0);
OutText('Lights Out');
MoveTo(270,210);
OutText('P)lay');
MoveTo(270,220);
OutText('E)dit');
MoveTo(270,230);
OutText('H)elp');
MoveTo(270, 240);
OutText('A)bout');
{MoveTo(270, 250);
OutText('E)xit');}
end;

procedure drawHelp; {Dibuja el menu principal}
begin
ClearDevice;
MoveTo(250,200);
SetTextStyle(11,0,0);
OutText('Ayuda del programa');
MoveTo(90,210);
OutText('Para jugar debe navegar el puntero con las siguientes teclas:');
MoveTo(247,220);
OutText('8 Mover hacia arriba');
MoveTo(250,230);
OutText('2 Mover hacia abajo');
MoveTo(240, 240);
OutText('4 Mover a la izquierda');
MoveTo(249, 250);
OutText('6 Mover a la derecha');
MoveTo(270,270);
outText('+ Pulsar boton');

MoveTo(230,300);
outText('Presione B para volver');
end;

procedure drawAbout; {Dibuja el menu principal}
begin
ClearDevice;
MoveTo(270,200);
SetTextStyle(11,0,0);
OutText('Lights Out');
MoveTo(125,210);
OutText('Video juego desarrollado en Pascal con ligas a ASM');
MoveTo(270,220);
OutText('Hecho por');
MoveTo(150,230);
OutText('Marcos Vinicio Mendez Hidalgo pon tu canpe');
MoveTo(290, 240);
OutText('&');
moveTo(170,250);
OutText('Luis Angel Vega Rodriguez 201816151');
end;
 
procedure drawGameBoard; {Procedimiento que dibuja el tablero}
begin
	ClearDevice;
	x1 := 6;
	x2 := 126;
	y1 := 6;
	y2 :=  94;
	for row := 1 to 5 do
	begin
		for column := 1 to 5 do
		begin
			if (w^[row, column] = false) then
			begin
				SetFillStyle(1,8);
				setColor(8);
			end;
			if (w^[row, column] = true) then
			begin
				SetFillStyle(1,9);
				setColor(9);
			end;
			Bar3D(x1, y1, x2, y2, 2, false);
			x1 := x1 + 126;
			x2 := x2 + 126;
		end;
	y1 := y1 + 94;
	y2 := y2 + 94;
	x1 := 6;
	x2 := 126;
	end;
end;

begin {metodo principal }
InitGraph(GraphicsDriver, GraphicsMode,'');
	stay := true;
	board1.init;
	board1.move(1,1);
	w := board1.getLogicMatrix;
	pX := 320;
	pY := 240;
	row1 := 3;
	column1 := 3;
	drawMainMenu;
	while (true) do
	begin
		c := ' ';
		c:= Readkey;
		if(c = 'P') or (c = 'p') then
		begin 
			drawGameBoard;
			setColor(4);
			Rectangle(pX - 6, pY - 6, pX + 6, pY + 6);	
			while(true) do {Aqui se debe poner la condicion si se gana el juego}

			begin
				c := ' ';
				c := Readkey;
				if (c = '8') and (row1 > 1)then
				begin 
					row1 := row1 - 1;
					pY := pY - 94;
					drawGameBoard;
					setColor(4);
					Rectangle(pX - 6, pY - 6, pX + 6, pY + 6);	
				end;
				if (c = '2') and (row1 < 5)then
				begin 
					row1 := row1 + 1;
					pY := pY + 94;
					drawGameBoard;
					setColor(4);
					Rectangle(pX - 6, pY - 6, pX + 6, pY + 6);
				end;
				if (c = '4') and (column1 > 1)then
				begin 
					column1 := column1 - 1;
					pX := pX - 126;
					drawGameBoard;
					setColor(4);
					Rectangle(pX - 6, pY - 6, pX + 6, pY + 6);
				end;
				if (c = '6') and (column1 < 5)then
				begin 
					column1 := column1 + 1;
					pX := pX + 126;
					drawGameBoard;
					setColor(4);
					Rectangle(pX - 6, pY - 6, pX + 6, pY + 6);
				end;
				if (c = '+') then
				begin 
					board1.move(row1, column1);
					drawGameBoard;
					setColor(4);
					Rectangle(pX - 6, pY - 6, pX + 6, pY + 6);
				end;
			end;
		end;
		if (c = 'a') or (c = 'A') then
		begin 
			drawAbout;
		end;
		if (c = 'h') or (c = 'H') then
		begin 
			drawHelp;
			stay := true;
			while(stay) do
			begin
				c := ' ';
				c := Readkey;
				if (c = 'B') or (c = 'b') then
				begin 
					stay := false;
				end;
			end;
			drawMainMenu;			
		end;
	end;
readln;
CloseGraph;
end.