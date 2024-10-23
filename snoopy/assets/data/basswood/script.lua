local originyCL = 0
local originyTR = 0
local originyGP = 0
local originyGO = 0 -- GO! GO! GO! GO! jk it's the grass opponent Y stuff
--Peppermint Patty origin y
local originyPT = 0
--snoopy origin y
local originySP = 0
--bf origin y
local originyBF = 0

function onCreate()
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

	doTweenY('barTopTween', 'bartop', -100, 0.0001, 'linear')
    doTweenY('barBotTween', 'barbot', 750, 0.0001, 'linear')

	originyCL = getProperty('theClouds.y')
	originyTR = getProperty('theTree.y')
	originyGP = getProperty('theGrassPlayer.y')
	originyGO = getProperty('theGrassOpp.y')

	originyPT = getProperty('dad.y')
	originyBF = getProperty('boyfriend.y')
	originySP = getProperty('snoopyPlayer3.y')

	addLuaScript('Gameover')
end

function onBeatHit()

	if curBeat == 4 then
		doTweenY('cloudsY', 'theClouds', originyCL+0, 8.82, 'quadInOut');
		doTweenY('treeY', 'theTree', originyTR+0, 8.82, 'quadInOut');
		doTweenY('grassPY', 'theGrassPlayer', originyGP+0, 8.82, 'quadInOut');
		doTweenY('grassOY', 'theGrassOpp', originyGO+0, 8.82, 'quadInOut');
	-- players
		doTweenY('oppY', 'dad', originyPT+0, 8.82, 'quadInOut');
		doTweenY('bfY', 'boyfriend', originyBF+0, 8.82, 'quadInOut');
		doTweenY('snoopY', 'snoopyPlayer3', originySP+0, 8.82, 'quadInOut');
	end

	if curBeat == 31 then
		doTweenZoom('screenZoom', 'camGame', 0.8, 0.5, 'quintOut');
		doTweenY('barTopTween', 'bartop', -30, 0.5, 'quintOut')
        doTweenY('barBotTween', 'barbot', 650, 0.5, 'quintOut')
	end

	if curBeat == 32 then
		setProperty('defaultCamZoom',0.8)
	end

	if curBeat == 127 or curBeat == 159 or curBeat == 287 or curBeat == 351 or curBeat == 383 then
		doTweenZoom('screenZoom', 'camGame', 0.97, 0.35, 'quintIn');
	end

end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end

end

function onStepHit()
	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.018*camInt,0.03*camInt)
	end
end

function onCreatePost()

	setProperty('gf.visible', false)

	triggerEvent('Camera Follow Pos',680,550)

	doTweenY('cloudsY', 'theClouds', originyCL+300, 0.0001, 'linear');
	doTweenY('treeY', 'theTree', originyTR+500, 0.0001, 'linear');
	doTweenY('grassPY', 'theGrassPlayer', originyGP+900, 0.0001, 'linear');
	doTweenY('grassOY', 'theGrassOpp', originyGO+900, 0.0001, 'linear');

	doTweenY('oppY', 'dad', originyPT+1000, 0.0001, 'linear');
	doTweenY('bfY', 'boyfriend', originyBF+1000, 0.0001, 'linear');
	doTweenY('snoopY', 'snoopyPlayer3', originySP+1000, 0.0001, 'linear');

--bf animated icon shit
	makeAnimatedLuaSprite('bfIcon', 'icons/icon-bf-peanuts', getProperty('iconP1.x'), getProperty('iconP1.y'))
	luaSpriteAddAnimationByPrefix('bfIcon', 'idle', 'BF p healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('bfIcon', 'losing', 'BF p hurt icon', 24, true)
	setObjectCamera('bfIcon', 'hud')
	addLuaSprite('bfIcon', true)
	setObjectOrder('bfIcon', getObjectOrder('iconP1') + 1)
	setProperty('iconP1.visible', false)
	objectPlayAnimation('bfIcon', 'idle', true)
--snoopy player2 animated icon
	makeAnimatedLuaSprite('snoopyIcon1', 'icons/icon-snoopy', getProperty('iconP1.x'), getProperty('iconP1.y'))
	luaSpriteAddAnimationByPrefix('snoopyIcon1', 'idle', 'snoopy healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('snoopyIcon1', 'losing', 'snoopy hurt icon', 24, true)
	setObjectCamera('snoopyIcon1', 'hud')
	addLuaSprite('snoopyIcon1', true)
	setObjectOrder('snoopyIcon1', getObjectOrder('iconP1') + 2)
	objectPlayAnimation('snoopyIcon1', 'idle', true)

--peppermint patty animated icon shit
	makeAnimatedLuaSprite('dadIcon', 'icons/icon-patricia', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('dadIcon', 'idle', 'patricia healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('dadIcon', 'losing', 'patricia hurt icon', 24, true)
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
	setProperty('snoopyIcon1.x', getProperty('iconP1.x') + 80)
	setProperty('snoopyIcon1.y', getProperty('iconP1.y') + 20)
	setProperty('snoopyIcon1.angle', getProperty('iconP1.angle'))
	scaleObject('snoopyIcon1', getProperty('iconP1.scale.x') * 0.8, getProperty('iconP1.scale.y') * 0.8)
	if getProperty('healthBar.percent') < 20 then
		if getProperty('snoopyIcon1.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('snoopyIcon1', 'losing', true)
		end
	else
		if getProperty('snoopyIcon1.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('snoopyIcon1', 'idle', true)
		end
	end

--peppermint patty icon shit
	setPropertyLuaSprite('dadIcon', 'flipX', true);
	setProperty('dadIcon.x', getProperty('iconP2.x') + 15)
	setProperty('dadIcon.y', getProperty('iconP2.y') + 3)
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


