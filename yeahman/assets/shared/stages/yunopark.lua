
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	
	makeLuaSprite('dabg', 'stages/yuno/yunobg2', -900, -600);
	setScrollFactor('dabg', 1, 1);
	scaleObject('dabg', 1.7, 1.7);

	makeAnimatedLuaSprite('boppers', 'stages/yuno/marrdance', 1000, -900);
    luaSpriteAddAnimationByPrefix('boppers', 'idle', 'marrdance instance 1', 24, false);
    scaleObject('boppers', 0.8, 0.8);
    setLuaSpriteScrollFactor('boppers', 1, 1);

	addLuaSprite('dabg', false);
	addLuaSprite('boppers', false);
	
end

function onBeatHit()
	luaSpritePlayAnimation('boppers', 'idle', true);
	
end

function onUpdate()
	setProperty('gf.alpha', 0)
	
end