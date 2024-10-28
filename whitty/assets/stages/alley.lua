function onCreate()
	makeLuaSprite('background', 'stages/alley/background', -420, -130);
	setScrollFactor('background', 1.0, 1.0);

	makeLuaSprite('smog', 'stages/alley/smog', -450, -160);
	setScrollFactor('smog', 0.9, 0.9);

	makeLuaSprite('foreground', 'stages/alley/foreground', -500, -230);
	setScrollFactor('foreground', 0.7, 0.7);

	makeLuaSprite('volumetrics', 'stages/alley/volumetric', -420, -200);
	setScrollFactor('volumetrics', 0.8, 0.8);

	addLuaSprite('background', false);
	addLuaSprite('smog', true);
	addLuaSprite('foreground', true);
	addLuaSprite('volumetrics', true);
	
	close(true);
end