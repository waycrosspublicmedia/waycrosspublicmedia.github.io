function onCreate()
	-- background shit
	

	--makeLuaSprite('Background2', 'BG_Bad', -3000, -1400);
	--setScrollFactor('Background2', 0.5, 0.5);

	bgX = -2500;
	bgY = - 1400;

	makeLuaSprite('Background1', 'BG_Norm', bgX, bgY);
	setScrollFactor('Background1', 0.6, 0.6);

	makeLuaSprite('Sky', 'sky', bgX, bgY);
	setScrollFactor('Sky', 0.4, 0.4);

	makeLuaSprite('Mounts', 'Mountains', bgX, bgY);
	setScrollFactor('Mounts', 0.5, 0.5);

	makeLuaSprite('Ground', 'ground', bgX, bgY);
	setScrollFactor('Ground', 0.5, 0.5);

	makeLuaSprite('Clouds', 'clouds', bgX, bgY);
	setScrollFactor('Clouds', 0.6, 0.6);

	makeLuaSprite('Shad', 'shadow', bgX, bgY);
	--setBlendMode('Shad', 'MULTIPLY');
	--setScrollFactor('Shad', 0.6, 0.6);

	makeAnimatedLuaSprite('Kaiju', 'kaiju', -730, -2000);
	addAnimationByPrefix('Kaiju', 'bop', 'Kaiju', 24, false);
	objectPlayAnimation('kaiju', 'bop', true);
	setBlendMode('Kaiju', 'MULTIPLY');


	setScrollFactor('Kaiju', 0.7, 0.7);

    
    --makeLuaSprite('Table', 'Table', -1100, 700);
	--setScrollFactor('Table', 0.7, 0.7);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		
	end

	--addLuaSprite('Background1', false);
	addLuaSprite('Sky', false);
	addLuaSprite('Mounts', false);
	addLuaSprite('Clouds', false);
	addLuaSprite('Shad', false);
	addLuaSprite('Ground', false);
	addLuaSprite('Kaiju', false);
	addLuaSprite('Background1', false);
	--addLuaSprite('Table', false);
	--addLuaSprite('AlleywayFG', false);
	--addLuaSprite('stagelight_right', false);
	--addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end