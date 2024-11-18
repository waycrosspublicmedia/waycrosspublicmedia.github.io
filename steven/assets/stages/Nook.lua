function onCreate()
	-- background shit
	makeLuaSprite('BG', 'Drinkwall', -350, -400);
	setScrollFactor('BG', 0.8, 0.8);
	scaleObject('BG', 0.9,0.9);
	
	
	makeLuaSprite('table', 'Tablev2', 300, 250);
	setScrollFactor('table', 0.95, 0.95);
	scaleObject('table', 1.2,1.2);
	--scaleObject('flare1', 1.1, 1.1);
	--setBlendMode('flare1', 'LIGHTEN');

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		
	end

	addLuaSprite('BG', false);
	addLuaSprite('table', false);

	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end