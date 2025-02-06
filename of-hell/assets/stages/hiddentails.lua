function onCreate()
	-- background shit
	makeLuaSprite('hiddenblack', 'hiddenblack', -1700, -950);
	setScrollFactor('hiddenblack', 0.8, 0.8);

	makeLuaSprite('hiddenshit', 'hiddenshit', 150, -340);
        scaleObject('hiddenshit', 2.4, 2.4);
	setScrollFactor('hiddenshit', 0.8, 0.8);

	makeLuaSprite('hiddenrock', 'hiddenrock', -400, 350);
        scaleObject('hiddenrock', 2.2, 2.2);
	setScrollFactor('hiddenrock', 0.8, 0.8);

	makeLuaSprite('hiddenclouds', 'hiddenclouds', -550, -150);
        scaleObject('hiddenclouds', 2.5, 2.5);
	setScrollFactor('hiddenclouds', 0.8, 0.8);

	makeLuaSprite('hiddenfloor', 'hiddenfloor', -300, 550);
        scaleObject('hiddenfloor', 2.3, 2.3);
	setScrollFactor('hiddenfloor', 1.0, 1.0);

	addLuaSprite('hiddenblack', false);
        addLuaSprite('hiddenclouds', false);
	addLuaSprite('hiddenshit', false);
	addLuaSprite('hiddenrock', false);
	addLuaSprite('hiddenfloor', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end