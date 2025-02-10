function onCreate()
	-- background shit
	makeLuaSprite('mountain bg','mountain bg', -1000,-1050);
        scaleObject('mountain bg', 1.4, 1.4);
    setScrollFactor('mountain bg', 1.0, 1.0);

	makeLuaSprite('mountain behind sky','mountain behind sky', -2000,-950);
        scaleObject('mountain behind sky', 1.4, 1.4);
     setScrollFactor('mountain behind sky', 1.0, 1.0);

        makeLuaSprite('mountain mountain','mountain mountain', -1100,-300);
        scaleObject('mountain mountain', 1.4, 1.4);
     setScrollFactor('mountain mountain', 1.0, 1.0);

        makeLuaSprite('mountain ground','mountain ground', -1100, 450);
        scaleObject('mountain ground', 1.4, 1.4);
     setScrollFactor('mountain ground', 1.0, 1.0);

	makeAnimatedLuaSprite('mountain water', 'mountain water', -1050,-100)
    addAnimationByPrefix('mountain water', 'a', 'Occurrence water', 24, true)
	objectPlayAnimation('mountain water', 'a', true)
	scaleObject('mountain water', 1.4, 1.4);
    setScrollFactor('mountain water', 1.0, 1.0);

	addLuaSprite('mountain bg', false);
	addLuaSprite('mountain behind sky', false);
	addLuaSprite('mountain water', false);
         addLuaSprite('mountain mountain', false);
	addLuaSprite('mountain ground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end