
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

end

function onBeatHit()
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        characterPlayAnim('dad','idle', true)
    end

	if curBeat == 6 then
        doTweenZoom('screenZoom', 'camGame', 1.0, 0.75, 'quintIn');
    end

	if curBeat == 63 then
        doTweenZoom('screenZoom', 'camGame', 1.0, 0.37, 'quintIn');
    end

	if curBeat == 95 then
        doTweenZoom('screenZoom', 'camGame', 1.0, 0.37, 'quintIn');
    end

	if curBeat == 110 then
        doTweenZoom('screenZoom', 'camGame', 1.1, 0.75, 'quintIn');
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

	setProperty('gf.visible',false);

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
	makeAnimatedLuaSprite('snoopyIcon1', 'icons/icon-snoopy', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('snoopyIcon1', 'idle', 'snoopy healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('snoopyIcon1', 'losing', 'snoopy hurt icon', 24, true)
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
