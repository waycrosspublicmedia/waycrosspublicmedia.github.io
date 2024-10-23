local originyCL = 0
local originyFC = 0
local originyHS = 0
--woodstock origin y
local originyWS = 0

--snoopy origin y
local originySP = 0
--bf origin y
local originyBF = 0

function onCreate()

	makeLuaSprite('whiteFG','',-900,-900)
	makeGraphic('whiteFG',4000,4000,'ffffff')
	addLuaSprite('whiteFG',false)
	scaleObject('whiteFG', 2.0, 2.0 )
	setObjectCamera('whiteFG','hud')

	makeAnimatedLuaSprite('theGoat', 'backyard/woodstock the goat', 400, 200);
	addAnimationByPrefix('theGoat','bird flying','woodwtock flying',24,false);
	setLuaSpriteScrollFactor('theGoat', 1.0, 1.0);
	addLuaSprite('theGoat', true);
	setProperty('theGoat.alpha', 0.0001)

-- cool cenimatic aspect ratio/black bars
	makeLuaSprite('bartop','',-200,-30)
	makeGraphic('bartop',2000,100,'000000')
	addLuaSprite('bartop',false)
    setScrollFactor('bartop',0,0)
    setObjectCamera('bartop','hud')

    makeLuaSprite('barbot','',-200,650)
	makeGraphic('barbot',2000,100,'000000')
	addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

	originyCL = getProperty('theClouds.y')
	originyFC = getProperty('theFence.y')
	originyHS = getProperty('theHouse.y')
	originyWS = getProperty('theGoat.y')
	originySP = getProperty('dad.y')
	originyBF = getProperty('boyfriend.y')

	addLuaScript('Gameover')

end

function onBeatHit()
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        characterPlayAnim('dad','idle', true)
    end

	if curBeat == 1 then
		doTweenAlpha('whiteFade', 'whiteFG', 0.0001, 2, 'linear')
	end

	if curBeat == 4 then
		doTweenY('cloudsY', 'theClouds', originyCL+0, 12, 'quadInOut');
		doTweenY('fenceY', 'theFence', originyFC+0, 12, 'quadInOut');
		doTweenY('houseY', 'theHouse', originyHS+0, 12, 'quadInOut');
	-- players
		doTweenY('oppY', 'dad', originySP+0, 12, 'quadInOut');
		doTweenX('oppTweenX', 'dad', 100, 12, 'quadInOut');
		doTweenX('oppScaleX', 'dad.scale', 1, 12, 'quadInOut');
		doTweenY('oppScaleY', 'dad.scale', 1, 12, 'quadInOut');


		doTweenY('bfY', 'boyfriend', originyBF+0, 12, 'quadInOut');
		doTweenX('bfTweenX', 'boyfriend', 720, 12, 'quadInOut');
		doTweenX('bfScaleX', 'boyfriend.scale', 1, 12, 'quadInOut');
		doTweenY('bfScaleY', 'boyfriend.scale', 1, 12, 'quadInOut');
	-- scaling shit
		doTweenX('cloudsScaleX', 'theClouds.scale', 1.2, 12, 'quadInOut');
		doTweenY('cloudsScaleY', 'theClouds.scale', 1.2, 12, 'quadInOut');

		doTweenX('fenceScaleX', 'theFence.scale', 1, 12, 'quadInOut');
		doTweenY('fenceScaleY', 'theFence.scale', 1, 12, 'quadInOut');

		doTweenX('houseScaleX', 'theHouse.scale', 1, 12, 'quadInOut');
		doTweenY('houseScaleY', 'theHouse.scale', 1, 12, 'quadInOut');


		setProperty('theGoat.alpha', 1.0)
		objectPlayAnimation('theGoat','bird flying', true);
	end

-- woodstock flies off
	if curBeat == 11 then
		doTweenY('woodstockY', 'theGoat', originyWS-180, 2, 'quadIn');
	end

--snoopy sounds
    if curBeat == 196 then
		setProperty('defaultCamZoom',0.99)		
	end
--bf beatbox
	if curBeat == 200 then
		setProperty('defaultCamZoom',1.03)		
	end
--snoopy sounds
    if curBeat == 204 then
		setProperty('defaultCamZoom',1.07)		
	end	
--bf beatbox
	if curBeat == 208 then
		setProperty('defaultCamZoom',1.11)		
	end
--snoopy sounds
    if curBeat == 212 then
		setProperty('defaultCamZoom',1.15)		
	end	
--bf beatbox
	if curBeat == 220 then
		doTweenZoom('screenZoom', 'camGame', 1.3, 3.0, 'quintIn');		
	end
-- camera back to normal
    if curBeat == 228 then
		setProperty('defaultCamZoom',0.9)		
	end
--camera zooms on snoopy
    if curBeat == 260 then
		setProperty('defaultCamZoom',1.1)		
	end
--camera zooms on bf
	if curBeat == 292 then
		setProperty('defaultCamZoom',1.15)		
	end
-- camera back to normal
    if curBeat == 324 then
		setProperty('defaultCamZoom',0.95)		
	end

end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end

end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

end

function onStepHit()
	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.018*camInt,0.03*camInt)
	end
end

function onCreatePost()

	triggerEvent('Camera Follow Pos',680,550)

	doTweenX('cloudsScaleX', 'theClouds.scale', 1.3, 0.0001, 'linear');
	doTweenY('cloudsScaleY', 'theClouds.scale', 1.3, 0.0001, 'linear');

	doTweenX('fenceScaleX', 'theFence.scale', 1.7, 0.0001, 'linear');
	doTweenY('fenceScaleY', 'theFence.scale', 1.7, 0.0001, 'linear');

	doTweenX('houseScaleX', 'theHouse.scale', 2.3, 0.0001, 'linear');
	doTweenY('houseScaleY', 'theHouse.scale', 2.3, 0.0001, 'linear');

--bf tween shit
	doTweenX('bfTweenX', 'boyfriend', 1700, 0.0001, 'linear');
	doTweenX('bfScaleX', 'boyfriend.scale', 2.8, 0.0001, 'linear');
	doTweenY('bfScaleY', 'boyfriend.scale', 2.8, 0.0001, 'linear');

--opp tween shit
	doTweenX('oppTweenX', 'dad', -800, 0.0001, 'linear');
	doTweenX('oppScaleX', 'dad.scale', 2.8, 0.0001, 'linear');
	doTweenY('oppScaleY', 'dad.scale', 2.8, 0.0001, 'linear');

	doTweenY('cloudsY', 'theClouds', originyCL+300, 0.0001, 'linear');
	doTweenY('fenceY', 'theFence', originyFC+800, 0.0001, 'linear');
	doTweenY('houseY', 'theHouse', originyHS+1200, 0.0001, 'linear');
	doTweenY('oppY', 'dad', originySP+2000, 0.0001, 'linear');
	doTweenY('bfY', 'boyfriend', originyBF+2000, 0.0001, 'linear');

--bf animated icon shit
	makeAnimatedLuaSprite('bfIcon', 'icons/icon-bf-peanuts', getProperty('iconP1.x'), getProperty('iconP1.y'))
	luaSpriteAddAnimationByPrefix('bfIcon', 'idle', 'BF p healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('bfIcon', 'losing', 'BF p hurt icon', 24, true)
	setObjectCamera('bfIcon', 'hud')
	addLuaSprite('bfIcon', true)
	setObjectOrder('bfIcon', getObjectOrder('iconP1') + 1)
	setProperty('iconP1.visible', false)
	objectPlayAnimation('bfIcon', 'idle', true)

--snoopy animated icon shit
	makeAnimatedLuaSprite('dadIcon', 'icons/icon-snoopy', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('dadIcon', 'idle', 'snoopy healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('dadIcon', 'losing', 'snoopy hurt icon', 24, true)
	setObjectCamera('dadIcon', 'hud')
	addLuaSprite('dadIcon', true)
	setObjectOrder('dadIcon', getObjectOrder('iconP2') + 1)
	setProperty('iconP2.visible', false)
	objectPlayAnimation('dadIcon', 'idle', true)
end

function onUpdate()
--bf icon shit
	setProperty('bfIcon.x', getProperty('iconP1.x') + 15)
	setProperty('bfIcon.y', getProperty('iconP1.y') - 10)
	setProperty('bfIcon.angle', getProperty('iconP1.angle'))
	scaleObject('bfIcon', getProperty('iconP1.scale.x'), getProperty('iconP1.scale.y'))
	if getProperty('healthBar.percent') < 20 then
		if getProperty('bfIcon.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('bfIcon', 'losing', true)
		end
	else
		if getProperty('bfIcon.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('bfIcon', 'idle', true)
		end
	end

--snoopy icon shit
	setPropertyLuaSprite('dadIcon', 'flipX', true);
	setProperty('dadIcon.x', getProperty('iconP2.x') + 15)
	setProperty('dadIcon.y', getProperty('iconP2.y') + 30)
	setProperty('dadIcon.angle', getProperty('iconP2.angle'))
	scaleObject('dadIcon', getProperty('iconP2.scale.x'), getProperty('iconP2.scale.y'))
	if getProperty('healthBar.percent') > 80 then
		if getProperty('dadIcon.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('dadIcon', 'losing', true)
		end
	else
		if getProperty('dadIcon.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('dadIcon', 'idle', true)
		end
	end
end
