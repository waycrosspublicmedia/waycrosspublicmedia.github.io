function onCreate()
	-- background shit
	makeLuaSprite('hidebg', 'hidebg', -1480, -560);
	setScrollFactor('hidebg', 1.0, 1.0);
        scaleObject('hidebg', 1.5, 1.5);

	makeLuaSprite('hidetree', 'hidetree', -2000, -250);
	setScrollFactor('hidetree', 1.1, 1.1);
        scaleObject('hidetree', 1.3, 1.3);

	makeLuaSprite('hidetrees', 'hidetrees', -1400, -150);
	setScrollFactor('hidetrees', 1.0, 1.0);
        scaleObject('hidetrees', 1.3, 1.3);

	makeLuaSprite('hideground', 'hideground', -1430, 1050);
	setScrollFactor('hideground', 1.1, 1.1);
        scaleObject('hideground', 1.4, 1.4);

	addLuaSprite('hidebg', false);
	addLuaSprite('hidetree', false);
	addLuaSprite('hidetrees', false);
	addLuaSprite('hideground', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end