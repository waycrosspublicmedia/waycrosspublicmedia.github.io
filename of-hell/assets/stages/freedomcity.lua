function onCreate()
	-- background shit
	makeLuaSprite('freedomsky','freedomsky', -1200,-1050);
        scaleObject('freedomsky', 0.8, 0.8);
    setScrollFactor('freedomsky', 1.0, 1.0);

	makeLuaSprite('freedomback','freedomback', -1100,-700);
        scaleObject('freedomback', 0.8, 0.8);
     setScrollFactor('freedomback', 1.1, 1.1);

        makeLuaSprite('freedomcity','freedomcity', -1100,-700);
        scaleObject('freedomcity', 0.8, 0.8);
     setScrollFactor('freedomcity', 1, 1);

        makeLuaSprite('freedomground','freedomground', -1100, -700);
        scaleObject('freedomground', 0.8, 0.8);
     setScrollFactor('freedomground', 1.0, 1.0);

	makeAnimatedLuaSprite('goutes', 'goutes', -1350, 600)
    addAnimationByPrefix('goutes', 'a', 'gouttes', 24, true)
	objectPlayAnimation('goutes', 'a', true)
	scaleObject('goutes', 1.3, 1.3);
    setScrollFactor('goutes', 1, 1);

         makeAnimatedLuaSprite('RECUPERE_12242_pluid', 'RECUPERE_12242_pluid', -1850,-800)
    addAnimationByPrefix('RECUPERE_12242_pluid', 'a', 'pluie', 24, true)
	objectPlayAnimation('RECUPERE_12242_pluid', 'a', true)
        setProperty('RECUPERE_12242_pluid.alpha', 0.25)
	scaleObject('RECUPERE_12242_pluid', 1.5, 1.5);
    setScrollFactor('RECUPERE_12242_pluid', 1, 1);

	addLuaSprite('freedomsky', false);
	addLuaSprite('freedomback', false);
	addLuaSprite('freedomcity', false);
        addLuaSprite('freedomground', false);
	addLuaSprite('RECUPERE_12242_pluid', true);
        addLuaSprite('goutes', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end