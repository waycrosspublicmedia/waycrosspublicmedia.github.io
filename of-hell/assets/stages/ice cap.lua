function onCreate()
	-- background shit
	makeLuaSprite('ice bg', 'ice bg', -700, -550);
	setScrollFactor('ice bg', 1.0, 1.0);
        scaleObject('ice bg', 6.4, 6.4);
        setProperty('ice bg.antialiasing', false)

	makeLuaSprite('ice floor', 'ice floor', -600, -320);
	setScrollFactor('ice floor', 1.0, 1.0);
        setProperty('ice floor.antialiasing', false)

	addLuaSprite('ice bg', false);
	addLuaSprite('ice floor', false);
        scaleObject('ice floor', 6.4, 6.4);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end