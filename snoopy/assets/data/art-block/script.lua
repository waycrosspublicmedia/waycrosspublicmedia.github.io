
local cutsceneEnded = false

function onCreate()
    makeLuaSprite('blackBG','',-1000,-900)
	makeGraphic('blackBG',4000,4000,'000000')
	addLuaSprite('blackBG', false)
	setObjectCamera('blackBG','hud')
    setProperty('blackBG.alpha', 0.0001)
end

function onBeatHit()

	if curBeat % 0 == 1 then
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			characterPlayAnim('boyfriend','idle', true)
		end
	end


end

function onStepHit()
	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.015*camInt,0.03*camInt)
	end

end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end
end

function onCreatePost()

--bf animated icon shit
	makeAnimatedLuaSprite('bfIcon1', 'icons/icon-bf-peanuts', getProperty('iconP1.x'), getProperty('iconP1.y'))
	luaSpriteAddAnimationByPrefix('bfIcon1', 'idle', 'BF p healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('bfIcon1', 'losing', 'BF p hurt icon', 24, true)
	setObjectCamera('bfIcon1', 'hud')
	addLuaSprite('bfIcon1', true)
	setObjectOrder('bfIcon1', getObjectOrder('iconP1') + 1)
	setProperty('iconP1.visible', false)
	objectPlayAnimation('bfIcon1', 'idle', true)

--tankman animated icon shit
	makeAnimatedLuaSprite('frankIcon', 'icons/icon-franklin', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('frankIcon', 'idle', 'franklin healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('frankIcon', 'losing', 'franklin hurt icon', 24, true)
	setObjectCamera('frankIcon', 'hud')
	addLuaSprite('frankIcon', true)
	setObjectOrder('frankIcon', getObjectOrder('iconP2') + 1)
	setProperty('iconP2.visible', false)
	objectPlayAnimation('frankIcon', 'idle', true)
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
	setPropertyLuaSprite('frankIcon', 'flipX', true);
	setProperty('frankIcon.x', getProperty('iconP2.x') + 1)
	setProperty('frankIcon.y', getProperty('iconP2.y') + 1)
	setProperty('frankIcon.angle', getProperty('iconP2.angle'))
	scaleObject('frankIcon', getProperty('iconP2.scale.x'), getProperty('iconP2.scale.y'))
	if getProperty('healthBar.percent') > 80 then
		if getProperty('frankIcon.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('frankIcon', 'losing', true)
		end
	else
		if getProperty('frankIcon.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('frankIcon', 'idle', true)
		end
	end
end



