function onCreate()
	-- background shit
	makeLuaSprite('bingobg', 'bingobg', -2300, -600);
        scaleObject('bingobg', 1.6, 1.6);
	setScrollFactor('bingobg', 1.0, 1.0);

	makeLuaSprite('bingoground', 'bingoground', -1700, 150);
        scaleObject('bingoground', 1.6, 1.6);
	setScrollFactor('bingoground', 1.0, 1.0);

	makeLuaSprite('housefr', 'housefr', -900, -150);
        scaleObject('housefr', 1.1, 1.1);
	setScrollFactor('housefr', 1.0, 1.0);

	makeLuaSprite('blacksonk', 'blacksonk', -1350, -450);
        scaleObject('blacksonk', 1.2, 1.2);
	setScrollFactor('blacksonk', 1.0, 1.0);

	makeLuaSprite('house', 'house', -1600, -700);
        scaleObject('house', 1.5, 1.5);
	setScrollFactor('house', 1.0, 1.0);

	makeLuaSprite('houseground', 'houseground', -1300, 920);
        scaleObject('houseground', 1.0, 1.0);
	setScrollFactor('houseground', 1.0, 1.0);

	addLuaSprite('bingobg', false);
	addLuaSprite('bingoground', false);

end

function onEvent(event, v1, v2)
	if event == 'pixelStage' then
                addLuaSprite('house', false)
                addLuaSprite('blacksonk', true)
		setProperty('defaultCamZoom', 0.4)
		setProperty('camGame.zoom', 0.4)
	end
end