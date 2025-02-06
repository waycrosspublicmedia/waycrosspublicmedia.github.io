function onCreate()
	-- background shit
	makeLuaSprite('b tree', 'b tree', -1280, -660);
	setScrollFactor('b tree', 1.0, 1.0);
        scaleObject('b tree', 0.9, 0.9);

	makeLuaSprite('blacks trees', 'blacks trees', -1300, -750);
	setScrollFactor('blacks trees', 1.0, 1.0);
        scaleObject('blacks trees', 0.9, 0.9);

	makeLuaSprite('black tree', 'black tree', -1200, -650);
	setScrollFactor('black tree', 1.0, 1.0);
        scaleObject('black tree', 0.8, 0.8);

	makeLuaSprite('trees', 'trees', -1400, -800);
	setScrollFactor('trees', 1.1, 1.1);
        scaleObject('trees', 1.0, 1.0);

	makeLuaSprite('tree ground', 'tree ground', -1400, -850);
	setScrollFactor('tree ground', 1.0, 1.0);
        scaleObject('tree ground', 1.0, 1.0);

	makeLuaSprite('plants', 'plants', -1400, -500);
	setScrollFactor('plants', 1.0, 1.0);
        scaleObject('plants', 0.9, 0.9);

	makeLuaSprite('tree', 'tree', -1400, -850);
	setScrollFactor('tree', 1.1, 1.1);
        scaleObject('tree', 1.0, 1.0);

        makeAnimatedLuaSprite('plant_1', 'plant_1', 1250,800)
        addAnimationByPrefix('plant_1', 'a', 'plant', 24, true)
	objectPlayAnimation('plant_1', 'a', true)
	scaleObject('plant_1', 0.8, 0.8);
        setScrollFactor('plant_1', 1.0, 1.0);

        makeAnimatedLuaSprite('plant_2', 'plant_2', -50,500)
        addAnimationByPrefix('plant_2', 'a', 'plant', 24, true)
	objectPlayAnimation('plant_2', 'a', true)
	scaleObject('plant_2', 1.5, 1.5);
        setScrollFactor('plant_2', 1.0, 1.0);

        addLuaSprite('black tree', false);
	addLuaSprite('blacks trees', false);
	addLuaSprite('b tree', false);
        addLuaSprite('trees', false);
        addLuaSprite('tree ground', false);
        addLuaSprite('plants', false);
        addLuaSprite('tree', false);
        addLuaSprite('plant_1', false);
        addLuaSprite('plant_2', false);
        addLuaSprite('tree', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end