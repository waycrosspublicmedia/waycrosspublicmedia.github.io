function onCreate()
	-- background shit
	makeLuaSprite('darkbg', 'darkbg', -1680, -960);
	setScrollFactor('darkbg', 1.0, 1.0);
        scaleObject('darkbg', 1.1, 1.1);

	makeLuaSprite('darkground', 'darkground', -1400, -1350);
	setScrollFactor('darkground', 1.0, 1.0);
        scaleObject('darkground', 1.1, 1.1);

	addLuaSprite('darkground', false);
	addLuaSprite('darkbg', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end