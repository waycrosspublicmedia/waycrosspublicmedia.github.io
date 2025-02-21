
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	makeLuaSprite('yard', 'stages/spooky/spookybgvar', -800, -700);
    scaleObject('yard', 1.7, 1.7);
    addLuaSprite('yard', false);

    makeAnimatedLuaSprite('bruh' , 'stages/spooky/bitchass' , 250 , 200);
	addAnimationByPrefix('bruh' , 'idle' , 'bitchass' , 12 , true);
	scaleObject('bruh', 0.6, 0.6);
	addLuaSprite('bruh', false);

    makeAnimatedLuaSprite('ear' , 'stages/spooky/earhead' , 1700 , 400);
	addAnimationByPrefix('ear' , 'idle' , 'earhead' , 12 , true);
	scaleObject('ear', 0.6, 0.6);
	addLuaSprite('ear', false);

    makeAnimatedLuaSprite('tomb' , 'stages/spooky/tombstone' , -500 , 300);
	addAnimationByPrefix('tomb' , 'idle' , 'tombstone' , 12 , true);
	scaleObject('tomb', 0.6, 0.6);
	addLuaSprite('tomb', false);

    makeLuaSprite('light', 'stages/spooky/overlight', -900, -10);
    scaleObject('light', 2.9, 2.9);
    setScrollFactor('light', 1, 0.1);
    addLuaSprite('light', true);
end

function onUpdate()
    setBlendMode('light', 'add')
    setProperty('light.alpha', 0.1)
    setProperty('tomb.alpha', 0.7)
    setProperty('gf.visible', false)
end
    