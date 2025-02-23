
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	

	makeLuaSprite('dabg', 'stages/wingz/jackiebg2', -400, -290);
	setScrollFactor('dabg', 0.6, 0.6);
	scaleObject('dabg', 1.3, 1.3);
	addLuaSprite('dabg', false);

	makeAnimatedLuaSprite('dabg2', 'stages/wingz/rain', 400, -290);
	addAnimationByPrefix("dabg2", "i", "r",16)
	playAnim("dabg2", "i")
	setScrollFactor('dabg2', 0.6, 0.6);
	scaleObject('dabg2', 2.5,2.5);
	addLuaSprite('dabg2', false);


	makeLuaSprite('datrain', 'stages/wingz/jackietrain', -400, -290);
	setScrollFactor('datrain', 1, 1);
	scaleObject('datrain', 1.3, 1.3);
	addLuaSprite('datrain', false);
	
	makeLuaSprite('dalight', 'stages/wingz/wing3', -500, -290);
	setScrollFactor('dalight', 1, 1);
	scaleObject('dalight', 1.5, 1.5);
	addLuaSprite('dalight', true);
end


function onUpdate(elapsed)
	setProperty('gf.alpha', 0)
	setBlendMode('dalight', 'add')
	if mustHitSection then
		setProperty("defaultCamZoom",  0.7)
	else
		setProperty("defaultCamZoom",  0.65)
	end
end