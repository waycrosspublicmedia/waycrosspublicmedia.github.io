function onCreate()
	-- background shit
	makeLuaSprite('snowbg','snowbg', -1000,-1050);
        scaleObject('snowbg', 0.8, 0.8);
    setScrollFactor('snowbg', 1.0, 1.0);

	makeLuaSprite('snowbgg','snowbgg', -1100,-700);
        scaleObject('snowbgg', 0.8, 0.8);
     setScrollFactor('snowbgg', 1.1, 1.1);

        makeLuaSprite('snowip','snowip', -1100,-700);
        scaleObject('snowip', 0.8, 0.8);
     setScrollFactor('snowip', 1.0, 1.0);

        makeLuaSprite('snowground','snowground', -1100, -700);
        scaleObject('snowground', 0.8, 0.8);
     setScrollFactor('snowground', 1.0, 1.0);

	makeAnimatedLuaSprite('neige', 'neige', -1350,-1000)
    addAnimationByPrefix('neige', 'a', 'lll', 24, true)
	objectPlayAnimation('neige', 'a', true)
	scaleObject('neige', 4.4, 4.4);
    setScrollFactor('neige', 1, 1);

	makeAnimatedLuaSprite('vent', 'vent', -1700,-1500)
    addAnimationByPrefix('vent', 'a', 'vent', 24, true)
	objectPlayAnimation('vent', 'a', true)
        setProperty('vent.alpha', 4.25)
	scaleObject('vent', 4.4, 4.4);
    setScrollFactor('vent', 1, 1);

	addLuaSprite('snowbg', false);
	addLuaSprite('snowbgg', false);
	addLuaSprite('snowip', false);
        addLuaSprite('snowground', false);
        addLuaSprite('vent', true);
	addLuaSprite('neige', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end