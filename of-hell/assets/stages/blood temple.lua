function onCreate()
	-- background shit
	makeLuaSprite('11124','11124', -2000,-1050);
        scaleObject('11124', 0.8, 0.8);
    setScrollFactor('11124', 1.0, 1.0);

	makeLuaSprite('bloodground','bloodground', -2000,-950);
        scaleObject('bloodground', 0.8, 0.8);
     setScrollFactor('bloodground', 1.0, 1.0);

        makeLuaSprite('bloodplat','bloodplat', -2080,-900);
        scaleObject('bloodplat', 0.8, 0.8);
     setScrollFactor('bloodplat', 1.0, 1.0);

	makeAnimatedLuaSprite('knu', 'knu', -1650,-320)
    addAnimationByPrefix('knu', 'a', 'knu', 24, true)
	objectPlayAnimation('knu', 'a', true)
	scaleObject('knu', 1.4, 1.4);
    setScrollFactor('knu', 1, 1);

	makeAnimatedLuaSprite('tails', 'tails', 900,-320)
    addAnimationByPrefix('tails', 'a', 'tails', 24, true)
	objectPlayAnimation('tails', 'a', true)
	scaleObject('tails', 1.4, 1.4);
    setScrollFactor('tails', 1, 1);

	addLuaSprite('11124', false);
	addLuaSprite('bloodplat', false);
        addLuaSprite('knu', false);
	addLuaSprite('tails', false);
        addLuaSprite('bloodground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end