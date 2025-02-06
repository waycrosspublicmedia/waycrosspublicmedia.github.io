function onCreate()
	-- background shit
	makeLuaSprite('cringe', 'cringe', -1680, -960);
	setScrollFactor('cringe', 1.0, 1.0);
        scaleObject('cringe', 3.1, 3.1);

	addLuaSprite('cringe', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end