akatsukiWalked = false
originxAK = 0
originyAK = 0

function onCreate()
	makeAnimatedLuaSprite('akatsuki', 'easter eggs/akatsuki assets', -500, 200)
	luaSpriteAddAnimationByPrefix('akatsuki', 'idle', 'akatsuki idle', 24, true)
	luaSpriteAddAnimationByPrefix('akatsuki', 'walkForward', 'akatsuki forward walk', 24, true)
	luaSpriteAddAnimationByPrefix('akatsuki', 'activate', 'akatsuki activate', 24, true)
	luaSpriteAddAnimationByPrefix('akatsuki', 'superAttack', 'akatsuki super', 24, true)
	addLuaSprite('akatsuki', true)
	setProperty('akatsuki.antialiasing',false)
	scaleObject('akatsuki', 2.5, 2.5)
	setProperty('akatsuki.alpha', 0.0001)
	objectPlayAnimation('akatsuki', 'walkForward', true)
end

function onBeatHit()


end

function onEvent( name, value1,value2)

	if name == 'AkatsukiOpp' then
		if value1 == 'walk in' then
			doTweenX('akaTweenXIn', 'akatsuki', -200, 1, 'linear');
			runTimer('akatsukiWalkTime', 1)
			doTweenAlpha('akatsukiPopIn', 'akatsuki', 1, 0.2, 'linear')
		end

		if value1 == 'walk out' then
			doTweenX('akaTweenXIn', 'akatsuki', -200, 1, 'linear');
			objectPlayAnimation('akatsuki', 'activate', true)
			doTweenAlpha('akatsukiPopIn', 'akatsuki', 1, 0.2, 'linear')
		end

		if value1 == 'super' then
			objectPlayAnimation('akatsuki', 'activate', true)
			playSound('akatsuki_voice1', 0.8)
			runTimer('startAttacking', 1.1)
		end
	end

end

function onTweenCompleted(t)

end

function onCreatePost()

end

function onUpdate()
	if misses == 5 then
		triggerEvent('AkatsukiOpp', 'walk in', '')
    end

end

function onTimerCompleted(t)
	if t == 'akatsukiWalkTime' then
		objectPlayAnimation('akatsuki', 'idle', true)
		runTimer('sayYourPrayers', 10)
	end

	if t == 'startAttacking' then
		objectPlayAnimation('akatsuki', 'superAttack', true)
		doTweenX('akaTweenXAttack', 'akatsuki', 250, 0.15, 'linear');
		runTimer('startSound', 0.2)
		runTimer('fullAttackTime', 3.44)
		triggerEvent('Camera Follow Pos', 900, 600)
	end

	if t == 'sayYourPrayers' then
		akatsukiDeath()
	end

	if t == 'startSound' then
		playSound('akatsuki_superPunches', 0.9)
	end

	if t == 'fullAttackTime' then
		setHealth(0)
		stopSound('akatsuki_superPunches')
	end

end

function akatsukiDeath()
	triggerEvent('AkatsukiOpp', 'super', '')
	--doTweenAlpha('hudDisappear', 'camHUD', 0.0001, 0.3, 'linear')
	triggerEvent('Camera Follow Pos', 400, 600)
    setProperty('cameraSpeed', 5)
	doTweenZoom('camzi','camGame', 1, 1.1,'bounceOut')
	runHaxeCode([[
		game.KillNotes();
		game.vocals.pause();
		game.vocals.volume = 0;
		FlxG.sound.music.volume = 0;
		
	]])
end