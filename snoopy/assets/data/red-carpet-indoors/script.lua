
function onCreate()

    makeLuaSprite('blackBG','',-1000,-900)
	makeGraphic('blackBG',4000,4000,'000000')
	addLuaSprite('blackBG',false)
    setProperty('blackBG.alpha', 0.9)

	makeLuaSprite('spotLightB', 'spotlight back', 130, 0)
	setBlendMode('spotLightB','add')
	addLuaSprite('spotLightB', false)

	makeLuaSprite('spotLightF', 'spotlight front', 120, 0)
	setBlendMode('spotLightF','add')
	addLuaSprite('spotLightF', true)
	setProperty('spotLightF.alpha', 0.0001)

	makeLuaSprite('spotLightB_right', 'spotlight back', 750, 0)
	setBlendMode('spotLightB_right','add')
	addLuaSprite('spotLightB_right', false)
	setPropertyLuaSprite('spotLightB_right', 'flipX', true)

	makeLuaSprite('spotLightF_right', 'spotlight front', 730, 0)
	setBlendMode('spotLightF_right','add')
	addLuaSprite('spotLightF_right', true)
	setProperty('spotLightF_right.alpha', 0.0001)
	setPropertyLuaSprite('spotLightF_right', 'flipX', true)

	makeLuaSprite('spotLightG', 'spotlight ground', 120, 810)
	setBlendMode('spotLightG','add')
	scaleObject('spotLightG', 0.9, 0.9)
	addLuaSprite('spotLightG', false)

	makeLuaSprite('spotLightG2', 'spotlight ground', 760, 810)
	setBlendMode('spotLightG2','add')
	scaleObject('spotLightG2', 0.9, 0.9)
	addLuaSprite('spotLightG2', false)


	makeLuaSprite('whiteFG','',-900,-900)
	makeGraphic('whiteFG',4000,4000,'ffffff')
	addLuaSprite('whiteFG',false)
	scaleObject('whiteFG', 2.0, 2.0 )
	setProperty('whiteFG.alpha', 0.0001)
	setObjectCamera('whiteFG','hud')

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

end

function onBeatHit()
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        characterPlayAnim('dad','idle', true)
    end

	if curBeat == 1 then
		noteTweenAlpha('NoteALpha0', 0, 0, 0.0005, cubeOut)
		noteTweenAlpha('NoteALpha1', 1, 0, 0.0005, cubeOut)
		noteTweenAlpha('NoteALpha2', 2, 0, 0.0005, cubeOut)
		noteTweenAlpha('NoteALpha3', 3, 0, 0.0005, cubeOut)
		noteTweenAlpha('NoteALpha4', 4, 0, 0.0005, cubeOut)
		noteTweenAlpha('NoteALpha5', 5, 0, 0.0005, cubeOut)
		noteTweenAlpha('NoteALpha6', 6, 0, 0.0005, cubeOut)
		noteTweenAlpha('NoteALpha7', 7, 0, 0.0005, cubeOut)
	end

	if curBeat == 3 then
		doTweenZoom('screenZoom', 'camGame', 1.2, 0.44, 'quintOut');		
	end

	if curBeat == 4 then
		noteTweenAlpha('NoteALpha0', 0, 1, 1.5, linear)
		noteTweenAlpha('NoteALpha1', 1, 1, 1.5, linear)
		noteTweenAlpha('NoteALpha2', 2, 1, 1.5, linear)
		noteTweenAlpha('NoteALpha3', 3, 1, 1.5, linear)
		noteTweenAlpha('NoteALpha4', 4, 1, 1.5, linear)
		noteTweenAlpha('NoteALpha5', 5, 1, 1.5, linear)
		noteTweenAlpha('NoteALpha6', 6, 1, 1.5, linear)
		noteTweenAlpha('NoteALpha7', 7, 1, 1.5, linear)

		setProperty('camGame.alpha', 1)
		setProperty('whiteFG.alpha', 1)
		setProperty('spotLightF.alpha', 1.0)
		doTweenAlpha('spotLightFTween', 'spotLightF', 0.3, 3, 'linear')
		setProperty('spotLightF_right.alpha', 1.0)
		doTweenAlpha('spotLightF_rightTween', 'spotLightF_right', 0.3, 3, 'linear')

		doTweenAlpha('whiteFade', 'whiteFG', 0.0001, 1, 'linear')
		doTweenZoom('screenZoom', 'camGame', 0.95, 13.29, 'quadOut');		
	end

	if curBeat == 35 then
		doTweenZoom('screenZoom', 'camGame', 1.0, 0.42, 'quintIn');		
	end

	if curBeat == 36 then
		doTweenAlpha('blackBGAlphaTween', 'blackBG', 0.0001, 0.5, 'linear');

		doTweenAlpha('spotLightF_rightTween', 'spotLightF_right', 0.0001, 0.3, 'linear')
		doTweenAlpha('spotLightB_rightTween', 'spotLightB_right', 0.0001, 0.3, 'linear')

		doTweenAlpha('spotLightFTween', 'spotLightF', 0.0001, 0.3, 'linear')
		doTweenAlpha('spotLightBTween', 'spotLightB', 0.0001, 0.3, 'linear')
	end

	if curBeat == 99 then
		doTweenZoom('screenZoom', 'camGame', 1.1, 0.42, 'quintIn');		
	end

	if curBeat == 123 then
		doTweenZoom('screenZoom', 'camGame', 1.1, 0.42, 'quintIn');		
	end

	if curBeat == 100 then

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
	setProperty('camGame.alpha', 0.0001)

--bf animated icon shit
	makeAnimatedLuaSprite('bfIcon1', 'icons/icon-bf-peanuts', getProperty('iconP1.x'), getProperty('iconP1.y'))
	luaSpriteAddAnimationByPrefix('bfIcon1', 'idle', 'BF p healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('bfIcon1', 'losing', 'BF p hurt icon', 24, true)
	setObjectCamera('bfIcon1', 'hud')
	addLuaSprite('bfIcon1', true)
	setObjectOrder('bfIcon1', getObjectOrder('iconP1') + 1)
	setProperty('iconP1.visible', false)
	objectPlayAnimation('bfIcon1', 'idle', true)

--snoopy animated icon shit
	makeAnimatedLuaSprite('snoopyIcon1', 'icons/icon-joe-cool', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('snoopyIcon1', 'idle', 'joe cool healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('snoopyIcon1', 'losing', 'joe cool hurt icon', 24, true)
	setObjectCamera('snoopyIcon1', 'hud')
	addLuaSprite('snoopyIcon1', true)
	setObjectOrder('snoopyIcon1', getObjectOrder('iconP2') + 1)
	setProperty('iconP2.visible', false)
	objectPlayAnimation('snoopyIcon1', 'idle', true)
end

function onUpdate()
--bf icon shit
	setProperty('bfIcon1.x', getProperty('iconP1.x') + 15)
	setProperty('bfIcon1.y', getProperty('iconP1.y') - 10)
	setProperty('bfIcon1.angle', getProperty('iconP1.angle'))
	scaleObject('bfIcon1', getProperty('iconP1.scale.x'), getProperty('iconP1.scale.y'))
	if getProperty('healthBar.percent') < 20 then
		if getProperty('bfIcon1.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('bfIcon1', 'losing', true)
		end
	else
		if getProperty('bfIcon1.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('bfIcon1', 'idle', true)
		end
	end

--snoopy icon shit
	setPropertyLuaSprite('snoopyIcon1', 'flipX', true);
	setProperty('snoopyIcon1.x', getProperty('iconP2.x') + 15)
	setProperty('snoopyIcon1.y', getProperty('iconP2.y') + 30)
	setProperty('snoopyIcon1.angle', getProperty('iconP2.angle'))
	scaleObject('snoopyIcon1', getProperty('iconP2.scale.x'), getProperty('iconP2.scale.y'))
	if getProperty('healthBar.percent') > 80 then
		if getProperty('snoopyIcon1.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('snoopyIcon1', 'losing', true)
		end
	else
		if getProperty('snoopyIcon1.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('snoopyIcon1', 'idle', true)
		end
	end
end
