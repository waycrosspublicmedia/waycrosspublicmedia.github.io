function onCreate()
	-- background shit
	makeLuaSprite('south bg','south bg', -1350,-850);
        scaleObject('south bg', 1.1, 1.1);
    setScrollFactor('south bg', 1.0, 1.0);

	makeLuaSprite('south mountains','south mountains', -1350,-700);
        scaleObject('south mountains', 1.15, 1.15);
     setScrollFactor('south mountains', 1.1, 1.1);

        makeLuaSprite('south forground','south forground', -1335,-700);
        scaleObject('south forground', 1.15, 1.15);
     setScrollFactor('south forground', 1.1, 1.1);

    makeLuaSprite('south ground','south ground', -1350,-700);
        scaleObject('south ground', 1.1, 1.1);
     setScrollFactor('south ground', 1.0, 1.0);

	makeAnimatedLuaSprite('flow', 'flow', 1450, 1280)
    addAnimationByPrefix('flow', 'a', 'fleurs', 24, true)
	objectPlayAnimation('flow', 'a', true)
	scaleObject('flow', 1.3, 1.3);
    setScrollFactor('flow', 1, 1);

	makeAnimatedLuaSprite('fleu', 'fleu', -650, 920)
    addAnimationByPrefix('fleu', 'a', 'fleu', 24, true)
	objectPlayAnimation('fleu', 'a', true)
	scaleObject('fleu', 1.3, 1.3);
    setScrollFactor('fleu', 1, 1);

	addLuaSprite('south bg', false);
	addLuaSprite('south mountains', false);
	addLuaSprite('south ground', false);
	addLuaSprite('flow', false);
	addLuaSprite('fleu', false);
	addLuaSprite('south forground', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end