function onCreate()
	-- background shit
	setProperty('gfGroup.alpha',0)

	makeLuaSprite('crossroads/BACKGROUND', 'crossroads/BACKGROUND', -1250, -1000);
	setScrollFactor('crossroads/BACKGROUND', 0.9, 0.9);
	scaleObject('crossroads/BACKGROUND', 1.25, 1.25);

	makeLuaSprite('crossroads/THE_FLOOR', 'crossroads/THE_FLOOR', -1280, -1000);
	setScrollFactor('crossroads/THE_FLOOR', 1, 1);
	scaleObject('crossroads/THE_FLOOR', 1.25, 1.25);

	makeLuaSprite('crossroads/speakers_bg', 'crossroads/speakers_bg', -1050, -800);
	setScrollFactor('crossroads/speakers_bg', 1, 1);
	scaleObject('crossroads/speakers_bg', 1.1, 1.1);
	
	makeLuaSprite('crossroads/speakers_bg', 'crossroads/speakers_bg', -1050, -800);
	setScrollFactor('crossroads/speakers_bg', 1, 1);
	scaleObject('crossroads/speakers_bg', 1.1, 1.1);
	
	makeLuaSprite('crossroads/lighting_effects', 'crossroads/lighting_effects', -1250, -800);
	setScrollFactor('crossroads/lighting_effects', 1, 1);
	setBlendMode('crossroads/lighting_effects', 'add')
	scaleObject('crossroads/lighting_effects', 1.25, 1.25);

    makeAnimatedLuaSprite('bgpeople', 'crossroads/bg_boppers', -100, 200)addAnimationByPrefix('bgpeople','boppers','boppers',24,false)
	scaleObject('bgpeople', 0.8, 0.8);
	setScrollFactor('bgpeople', 1, 1);


	addLuaSprite('crossroads/BACKGROUND', false);
	addLuaSprite('crossroads/THE_FLOOR', false);
	addLuaSprite('bgpeople', false);
	addLuaSprite('crossroads/speakers_bg', false);
	addLuaSprite('crossroads/lighting_effects', true);



end

function onBeatHit()
    if curBeat % 2 == 0 then
     objectPlayAnimation('bgpeople','boppers',true)
    end
end