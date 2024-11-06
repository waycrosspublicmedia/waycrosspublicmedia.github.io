function onStepHit()--Bueno Este Metodo Es Muy Facil De Usar, Lo Cree En Un Dia Si me Dan creditos Por El Esfuerso Se Los Agradeceria Soy Perez Sen Y Eso Es TODO :)
	if curStep == 2 then
		makeLuaText('Text', "Leyendo Mis Horribles Comentarios De Odio", 600, 660, 600); 
		setTextSize('Text', 29);
		setTextBorder("Text", 1, 'A363C8');
		setObjectCamera('Text', 'other');
		addLuaText('Text', true);
	end
	if curStep == 32 then
		makeLuaText('Text2', "No Tu Otra Vez ", 600, 7, 600); 
		setTextSize('Text2', 29);
		setTextBorder("Text2", 1, 'BD6E09');
		setObjectCamera('Text2', 'other');
		addLuaText('Text2', true);

		setProperty('Text.visible', false);
	  end
	  if curStep == 64 then
		makeLuaText('Text3', "OH Miren Tenemos A Un Comediante Aqui ¿No Es Asi?", 600, 670, 600); 
		setTextSize('Text3', 29);
		setTextBorder("Text3", 1, 'A363C8');
		setObjectCamera('Text3', 'other');
		addLuaText('Text3', true);
		setProperty('Text2.visible', false);

	end
	if curStep == 95 then
		makeLuaText('Text4', "Soy Más Gracioso Que tú, Eso Te Lo Aseguro", 600, 7, 600); 
		setTextSize('Text4', 29);
		setTextBorder("Text4", 1, 'BD6E09');
		setObjectCamera('Text4', 'other');
		addLuaText('Text4', true);

		setProperty('Text3.visible', false);
	  end
	  if curStep == 128 then
		setProperty('Text4.visible', false);
	  end
	  if curStep == 1518 then
		makeLuaText('Text5', "CALLATE!! Y Escucha Esto", 600, 7, 600); 
		setTextSize('Text5', 31);
		setTextBorder("Text5", 1, 'BD6E09');
		setObjectCamera('Text5', 'other');
		addLuaText('Text5', true);

	  end
	  if curStep == 1538 then
		setProperty('Text5.visible', false);
	  end
	  if curStep == 1648 then
		makeLuaText('Text7', "E-ESPERA AGUANTAME UN MOMENTO!! ", 600, 700, 600); 
		setTextSize('Text7', 29);
		setTextBorder("Text7", 1, 'A363C8');
		setObjectCamera('Text7', 'other');
		addLuaText('Text7', true);

		setProperty('Text6.visible', false);
	  end
	  if curStep == 1664 then
		setProperty('Text7.visible', false);
	  end
	  if curStep == 1856 then
		makeLuaText('Text8', "¿Creo Que Rompí Algo?", 600, 670, 600); 
		setTextSize('Text8', 29);
		setTextBorder("Text8", 1, 'A363C8');
		setObjectCamera('Text8', 'other');
		addLuaText('Text8', true);
	  end
	  if curStep == 1876 then
		makeLuaText('Text9', "Fue Tu Cerebro XD", 600, 7, 600); 
		setTextSize('Text9', 29);
		setTextBorder("Text9", 1, 'BD6E09');
		setObjectCamera('Text9', 'other');
		addLuaText('Text9', true);

		setProperty('Text8.visible', false);
	  end
	  if curStep == 1904 then
		makeLuaText('Text10', "Eres Una Amenaza", 600, 700, 600); 
		setTextSize('Text10', 29);
		setTextBorder("Text10", 1, 'A363C8');
		setObjectCamera('Text10', 'other');
		addLuaText('Text10', true);

		setProperty('Text9.visible', false);
	  end
	  if curStep == 1940 then
		setProperty('Text10.visible', false);

	  end
	end