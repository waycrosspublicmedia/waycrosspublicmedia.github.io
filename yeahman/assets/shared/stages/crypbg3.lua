
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()

	setProperty("skipCountdown", true);

	makeLuaSprite('crypbg', 'stages/cryp/newcrypbg3', -1100, -800);
	setScrollFactor('crypbg', 1, 1);
	scaleObject('crypbg', 0.8, 0.8);

	
	addLuaSprite('crypbg', false);

	makeAnimatedLuaSprite('angela' , 'stages/cryp/angela' , 300 , 125 , "sparrow");
	addAnimationByPrefix('angela', 'hey', 'heylisten' , 24 , false);
	addLuaSprite('angela');
	setProperty('angela.alpha', 0);

	makeAnimatedLuaSprite('sofia' , 'stages/cryp/SofiaCRYPGF' , -500 , 200);
	addAnimationByPrefix('sofia' , 'surprise' , 'SofiaSurpise' , 24 , false);
	addAnimationByPrefix('sofia' , 'idle' , 'SofiaBoppinh' , 24 , true);
	scaleObject('sofia', 0.8, 0.8);
	addLuaSprite('sofia');
	

end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end

	setProperty("gf.flipX", false)
end
