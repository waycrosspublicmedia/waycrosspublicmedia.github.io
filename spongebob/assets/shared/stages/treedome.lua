function onCreate()
	makeLuaSprite('treedome_sky', 'stage_bg/treedome/treedome_bg', -500, -600);
	setScrollFactor('treedome_sky', 0.2, 0.2);
	scaleObject('treedome_sky', 1.3, 1.3);
	setProperty('treedome_sky.antialiasing', false);
	addLuaSprite('treedome_sky', false);
	
	makeLuaSprite('treedome_rocks', 'stage_bg/treedome/treedome_sand', -750, -190);
	setScrollFactor('treedome_rocks', 0.67, 0.67);
	scaleObject('treedome_rocks', 1.6, 1.6);
	setProperty('treedome_rocks.antialiasing', false);
	addLuaSprite('treedome_rocks', false);
		
	if not lowQuality then
		makeAnimatedLuaSprite('patrick_treedome', 'stage_bg/treedome/SandyBGpatrick', 2300, 1090)
		addAnimationByPrefix('patrick_treedome', 'idle', 'idle', 9, false)
		addAnimationByPrefix('patrick_treedome', 'blinking', 'highquality-blinking', 16, false)
		addAnimationByPrefix('patrick_treedome', 'drinking', 'drinking', 16, false)
		setScrollFactor('patrick_treedome', 0.85, 0.88);
		scaleObject('patrick_treedome', 1.2, 1.2);
		addLuaSprite('patrick_treedome', false);

		makeLuaSprite('treedome_dome', 'stage_bg/treedome/treedome_dome', 0, -100);
		setScrollFactor('treedome_dome', 0.9, 0.9);
		scaleObject('treedome_dome', 1.6, 1.6);
		addLuaSprite('treedome_dome', false);
	end
	
	makeLuaSprite('treedome_ground', 'stage_bg/treedome/treedome_ground', 0, 300);
	setScrollFactor('treedome_ground', 1, 1);
	scaleObject('treedome_ground', 1.4, 1.4);
	addLuaSprite('treedome_ground', false);
	
	makeLuaSprite('treedome_tree', 'stage_bg/treedome/treedome_tree', 0, 200);
	setScrollFactor('treedome_tree', 1, 1);
	scaleObject('treedome_tree', 1.5, 1.5);
	addLuaSprite('treedome_tree', false);

	makeAnimatedLuaSprite('spongebob_treedome', 'stage_bg/treedome/SandyBGspongebob', 1300, 1300)
	addAnimationByPrefix('spongebob_treedome', 'sbIdle', 'idle', 24, false)
	setScrollFactor('spongebob_treedome', 1.0, 1.0);
	scaleObject('spongebob_treedome', 0.57, 0.57);
	addLuaSprite('spongebob_treedome', false);
end

local patrickAnimation = 0;
--0 = no anim
--1 = blinking
--2 = drinking

function onTimerCompleted(tag)
	if tag == 'patrickGoIdle' then
		patrickAnimation = 0;
		--playAnim('patrick_treedome', 'idle', false)
	end
	if tag == 'patrickGoIdle2' then
		patrickAnimation = 0;
		playAnim('patrick_treedome', 'idle', false)
	end
end

function runOthers()
	if not lowQuality and getRandomBool(10) and patrickAnimation == 0 then
		patrickAnimation = 1;
		playAnim('patrick_treedome', 'blinking', false)
		runTimer('patrickGoIdle2', 0.3);
	elseif not lowQuality and getRandomBool(5) and patrickAnimation == 0 then
		patrickAnimation = 2;
		playAnim('patrick_treedome', 'drinking', false)
		runTimer('patrickGoIdle2', 0.7);
	end
end

function onBeatHit()
	playAnim('spongebob_treedome', 'sbIdle', false)
	if curBeat % 2 == 0 and not lowQuality then runOthers() end
	if patrickAnimation == 0 and curBeat % 2 == 0 and not lowQuality then
		patrickAnimation = 3;
		playAnim('patrick_treedome', 'idle', false)
		runTimer('patrickGoIdle', 0.1)
	end
end