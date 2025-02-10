function onCreate()
	-- background shit
	makeLuaSprite('whisper', 'whisper', -880, -860);
	setScrollFactor('whisper', 1.0, 1.0);
        scaleObject('whisper', 2.9, 2.9);

	makeLuaSprite('whisper2', 'whisper2', 680, -180);
	setScrollFactor('whisper2', 1.0, 1.0);
        scaleObject('whisper2', 1.35, 1.35);

	makeLuaSprite('whisperplat', 'whisperplat', 900, -200);
	setScrollFactor('whisperplat', 1.0, 1.0);
        scaleObject('whisperplat', 1.2, 1.2);

	addLuaSprite('whisper', false);
	addLuaSprite('whisperplat', false);
	addLuaSprite('whisper2', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end