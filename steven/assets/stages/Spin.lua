function onCreate()
	-- background shit
	makeLuaSprite('sky', 'Sky_sp', -1600, -700);
	setScrollFactor('sky', 0.3, 0.3);
	
	
	makeLuaSprite('flare1', 'Flare1', -1650, -900);
	setScrollFactor('flare1', 0.5, 0.5);
	scaleObject('flare1', 1.1, 1.1);
	setBlendMode('flare1', 'LIGHTEN');

	makeLuaSprite('flare2', 'Flare2', -1650, -800);
	setScrollFactor('flare2', 0.7, 0.7);
	scaleObject('flare2', 1.1, 1.1);
	setBlendMode('flare2', 'SCREEN');

	

	makeLuaSprite('floorglow', 'FloorGlow', -1650, -600);
	setScrollFactor('floorglow', 1.1, 1.1);
	scaleObject('floorglow', 1.1, 1.1);
	setBlendMode('floorglow', 'ADD');

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		--makeLuaSprite('starsHere', 'Stars', -1650, -1000);
		makeAnimatedLuaSprite('starsHere', 'Stars', 100, -100);
		setScrollFactor('starsHere', 1.7, 1.7);
		scaleObject('starsHere', 1.1, 1.1);
		addAnimationByPrefix('starsHere', 'play', 'Stars', 24, true);
		objectPlayAnimation('starsHere', 'play');
		setBlendMode('starsHere', 'SCREEN');
	end

	addLuaSprite('sky', false);
	addLuaSprite('flare1', false);
	addLuaSprite('flare2', false);
	
	addLuaSprite('floorglow', true);
	addLuaSprite('starsHere', true);

	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end