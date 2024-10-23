
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

	addLuaScript('Gameover')
end

function onBeatHit()
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        characterPlayAnim('dad','idle', true)
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

	followchars = false

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
	makeAnimatedLuaSprite('dadIcon', 'icons/icon-joe-cool', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('dadIcon', 'idle', 'joe cool healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('dadIcon', 'losing', 'joe cool hurt icon', 24, true)
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
