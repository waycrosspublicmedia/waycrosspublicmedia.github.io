
function onCreate()

	makeAnimatedLuaSprite('tankSpeech1', 'junkyard bg/tank talk1', 200, -200);
	addAnimationByPrefix('tankSpeech1','beat it','beat it speech',24,false);
	addLuaSprite('tankSpeech1', false);
	objectPlayAnimation('tankSpeech1','beat it',true);
	setProperty('tankSpeech1.alpha', 0.0001)

	makeAnimatedLuaSprite('tankSpeech2', 'junkyard bg/tank talk2', 300, -150);
	addAnimationByPrefix('tankSpeech2','ugh','ugh speech',24,false);
	addLuaSprite('tankSpeech2', false);
	objectPlayAnimation('tankSpeech2','ugh',true);
	setProperty('tankSpeech2.alpha', 0.0001)

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

	getProperty('camGame.scroll.x', 650)
	getProperty('camGame.scroll.y', 10)

	addLuaScript('Gameover')
-- precaching shit

end

function onBeatHit()
	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

	if getProperty('dad.animation.curAnim.name') == 'idle' then
		characterPlayAnim('dad','idle',true)
	end

	if curBeat == 15 then
		--setProperty('tankSpeech1.alpha', 1.0)
		--objectPlayAnimation('tankSpeech1','beat it',true);
	end

	if curBeat == 16 then
		--doTweenZoom('screenZoom', 'camGame', 0.82, 8.34, 'quadInOut');
	end

	if curBeat == 17 then
		--setProperty('tankSpeech1.alpha', 0.0001)
	end

	if curBeat == 32 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curBeat == 48 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curBeat == 63 then
		doTweenZoom('screenZoom', 'camGame', 0.86, 0.52, 'quintIn');
	end

	if curBeat == 64 then
		setProperty('defaultCamZoom', 0.6)
	end

	if curBeat == 79 then
		setProperty('tankSpeech2.alpha', 1.0)		
		objectPlayAnimation('tankSpeech2','ugh',true);
	end

	if curBeat == 80 then
		setProperty('defaultCamZoom', 0.65)
	end

	if curBeat == 81 then
		setProperty('tankSpeech2.alpha', 0.0001)
	end

	if curBeat == 112 then
		doTweenZoom('screenZoom', 'camGame', 0.56, 8.34, 'quadInOut');
	end

	if curBeat == 127 then
		doTweenZoom('screenZoom', 'camGame', 0.64, 0.52, 'quintIn');
	end

	if curBeat == 128 then
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
--snoopy animated icon shit
	makeAnimatedLuaSprite('bfIcon', 'icons/icon-snoopy', getProperty('iconP1.x'), getProperty('iconP1.y'))
	luaSpriteAddAnimationByPrefix('bfIcon', 'idle', 'snoopy hurt icon', 24, true)
	luaSpriteAddAnimationByPrefix('bfIcon', 'losing', 'snoopy hurt icon', 24, true)
	setObjectCamera('bfIcon', 'hud')
	addLuaSprite('bfIcon', true)
	setObjectOrder('bfIcon', getObjectOrder('iconP1') + 1)
	setProperty('iconP1.visible', false)
	objectPlayAnimation('bfIcon', 'idle', true)

--tankman animated icon shit
	makeAnimatedLuaSprite('dadIcon', 'icons/icon-tankman-peanuts', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('dadIcon', 'idle', 'tankman p healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('dadIcon', 'losing', 'tankman p hurt icon', 24, true)
	setObjectCamera('dadIcon', 'hud')
	addLuaSprite('dadIcon', true)
	setObjectOrder('dadIcon', getObjectOrder('iconP2') + 1)
	setProperty('iconP2.visible', false)
	objectPlayAnimation('dadIcon', 'idle', true)
end

function onUpdate()

--bf icon shit
	setProperty('bfIcon.x', getProperty('iconP1.x') + 15)
	setProperty('bfIcon.y', getProperty('iconP1.y') + 30)
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
	setProperty('dadIcon.x', getProperty('iconP2.x') + 1)
	setProperty('dadIcon.y', getProperty('iconP2.y') + 1)
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

function opponentNoteHit(id, noteData, noteType, isSustainNote)

	if getProperty('health') > 0.1 then
		setProperty('health',getProperty('health')-0.015)
		end
end

function onTimerCompleted(t,l,ll)

end


