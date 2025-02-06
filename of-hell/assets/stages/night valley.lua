function onCreate()
	-- background shit
	makeLuaSprite('nightback','nightback', -1100,-850);
        scaleObject('nightback', 0.8, 0.8);
    setScrollFactor('nightback', 1.0, 1.0);

	makeLuaSprite('nightforest','nightforest', -1000,-700);
        scaleObject('nightforest', 0.8, 0.8);
     setScrollFactor('nightforest', 1.1, 1.1);

        makeLuaSprite('nightground','nightground', -1100,-700);
        scaleObject('nightground', 0.8, 0.8);
     setScrollFactor('nightground', 1.0, 1.0);

	makeAnimatedLuaSprite('light_1', 'light_1', -1250,-400)
    addAnimationByPrefix('light_1', 'a', 'light', 24, true)
	objectPlayAnimation('light_1', 'a', true)
        setProperty('light_1.alpha', 0.5)
	scaleObject('light_1', 4.0, 4.0);
    setScrollFactor('light_1', 1, 1);

	addLuaSprite('nightback', false);
	addLuaSprite('nightforest', false);
	addLuaSprite('nightground', false);
	addLuaSprite('light_1', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end