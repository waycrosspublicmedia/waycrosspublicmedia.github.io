function onCreate()
	-- background shit
	makeLuaSprite('volcanosky','volcanosky', -1495,-750);
        scaleObject('volcanosky', 2.8, 2.8);
    setScrollFactor('volcanosky', 1.0, 1.0);

	makeLuaSprite('volcanomountains','volcanomountains', -1400,-670);
        scaleObject('volcanomountains', 2.8, 2.8);
     setScrollFactor('volcanomountains', 1.0, 1.0);

        makeLuaSprite('volcanowall','volcanowall', -1500,-800);
        scaleObject('volcanowall', 2.7, 2.7);
     setScrollFactor('volcanowall', 1.0, 1.0);

        makeLuaSprite('volcanoground','volcanoground', -1400, -600);
        scaleObject('volcanoground', 2.7, 2.7);
     setScrollFactor('volcanoground', 1.0, 1.0);

	makeAnimatedLuaSprite('bulles', 'bulles', -1050, 600)
    addAnimationByPrefix('bulles', 'a', 'Occurrence bulles', 24, true)
	objectPlayAnimation('bulles', 'a', true)
	scaleObject('bulles', 2.7, 2.7);
    setScrollFactor('bulles', 1.0, 1.0);

	makeAnimatedLuaSprite('lava', 'lava', -1495,-670)
    addAnimationByPrefix('lava', 'a', 'Occurrence lave', 20, true)
	objectPlayAnimation('lava', 'a', true)
	scaleObject('lava', 2.8, 2.8);
    setScrollFactor('lava', 1.0, 1.0);

	addLuaSprite('volcanosky', false);
	addLuaSprite('volcanomountains', false);
        addLuaSprite('lava', false);
        addLuaSprite('bulles', false);
	addLuaSprite('volcanowall', false);
	addLuaSprite('volcanoground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end