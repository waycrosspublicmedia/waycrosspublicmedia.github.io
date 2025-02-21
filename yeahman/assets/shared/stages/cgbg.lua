
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()

	makeLuaSprite('void')
	makeGraphic("void",1,1)
	setScrollFactor('void', 1, 1);
	scaleObject('void', 5000, 5000);
	
	makeLuaSprite('dabg', 'stages/cg/cgbg', -400, -500);
	setScrollFactor('dabg', 1, 1);
	scaleObject('dabg', 0.8, 0.8);

	--makeLuaSprite('gradient', 'purplegradient', -200, -160);
	--setScrollFactor('gradient', 1, 1);
	--scaleObject('gradient', 1.4, 1.4);



	addLuaSprite('void', false);
	addLuaSprite('dabg', false);
	
end

function onUpdate()
    setProperty('gf.visible', false)
    end
    
