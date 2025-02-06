function onCreate()
	-- background shit
	makeLuaSprite('foggysky','foggysky', -1495,-1050);
        scaleObject('foggysky', 3.2, 3.2);
    setScrollFactor('foggysky', 1.0, 1.0);

	makeLuaSprite('foggyclouds','foggyclouds', -1500,-970);
        scaleObject('foggyclouds', 3.2, 3.2);
     setScrollFactor('foggyclouds', 1.0, 1.0);

        makeLuaSprite('foggyrock','foggyrock', -1600,-1100);
        scaleObject('foggyrock', 3.0, 3.0);
     setScrollFactor('foggyrock', 1.0, 1.0);

        makeLuaSprite('foggy','foggy', -1500,-1600);
        scaleObject('foggy', 3.2, 3.2);
     setScrollFactor('foggy', 1.0, 1.0);

        makeLuaSprite('foggyground','foggyground', -1400, -960);
        scaleObject('foggyground', 3.0, 3.0);
     setScrollFactor('foggyground', 1.0, 1.0)

        makeLuaSprite('fog','fog', -1500, -1000);
        scaleObject('fog', 3.1, 3.1);
     setScrollFactor('fog', 1.0, 1.0)

	makeAnimatedLuaSprite('bubles', 'bubles', -1050, 900)
    addAnimationByPrefix('bubles', 'a', 'Occurrence bulles', 24, true)
	objectPlayAnimation('bubles', 'a', true)
	scaleObject('bubles', 3.2, 3.2);
    setScrollFactor('bubles', 1.0, 1.0);

	makeAnimatedLuaSprite('lavas', 'lavas', -1595,-670)
    addAnimationByPrefix('lavas', 'a', 'Occurrence lave', 24, true)
	objectPlayAnimation('lavas', 'a', true)
	scaleObject('lavas', 3.2, 3.2);
    setScrollFactor('lavas', 1.0, 1.0);

	addLuaSprite('foggysky', false);
	addLuaSprite('foggyclouds', false);
        addLuaSprite('foggyrock', false);
        addLuaSprite('foggy', false);
        addLuaSprite('bubles', false);
	addLuaSprite('lavas', false);
        addLuaSprite('foggyground', false);
        addLuaSprite('fog', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end