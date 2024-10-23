
local allowCountdown = false
local incutscene = false

function onStartCountdown()

	if not allowCountdown and not isStoryMode then
		makeLuaSprite('blackScreen','',-300,-900)
		makeGraphic('blackScreen',4000,4000,'000000')
		addLuaSprite('blackScreen',true)

		makeLuaText('pressTxt', 'press BACKSPACE to SKIP', 800, 230)
		addLuaText('pressTxt', true)
		setTextSize('pressTxt', 25.0)
		setTextFont("pressTxt", 'peanuts.ttf');
		setTextAlignment('pressTxt', 'center')
		setObjectCamera('pressTxt','hud')
		setProperty('pressTxt.y', 600)
		setProperty('pressTxt.alpha', 0.0001)


		makeLuaText('WarningTxt1', 'warning for musicians or fnf fans in general..', 800, 230)
		addLuaText('WarningTxt1', true)
		setTextSize('WarningTxt1', 38.0)
		setTextFont("WarningTxt1", 'peanuts.ttf');
		setTextAlignment('WarningTxt1', 'center')
		setObjectCamera('WarningTxt1','hud')
		setProperty('WarningTxt1.y', 200)
		setProperty('WarningTxt1.alpha', 0.0001)

		makeLuaText('WarningTxt2', 'this song contains the', 800, 40)
		addLuaText('WarningTxt2', true)
		setTextSize('WarningTxt2', 47.0)
		setTextFont("WarningTxt2", 'peanuts.ttf');
		setTextAlignment('WarningTxt2', 'center')
		setObjectCamera('WarningTxt2','hud')
		setProperty('WarningTxt2.y', 300)
		setProperty('WarningTxt2.alpha', 0.0001)

		makeLuaText('eBassTxt', 'genesis ebass 1', 800, 540)
		addLuaText('eBassTxt', true)
		setTextColor('eBassTxt','ff0000')
		setTextSize('eBassTxt', 47.0)
		setTextFont("eBassTxt", 'peanuts.ttf');
		setTextAlignment('eBassTxt', 'center')
		setObjectCamera('eBassTxt','hud')
		setProperty('eBassTxt.alpha', 0.0001)

		makeLuaText('WarningTxt3', 'if you are sick and tired of this instrument leave now!!!', 1300, 0)
		addLuaText('WarningTxt3', true)
		setTextSize('WarningTxt3', 50.0)
		setTextFont("WarningTxt3", 'peanuts.ttf');
		setTextAlignment('WarningTxt3', 'center')
		setObjectCamera('WarningTxt3','hud')
		setProperty('WarningTxt3.y', 400)
		setProperty('WarningTxt3.alpha', 0.0001)

		makeLuaText('enjoyTxt', 'other wise, enjoy this little song!!', 800, 230)
		addLuaText('enjoyTxt', true)
		setTextSize('enjoyTxt', 50.0)
		setTextFont("enjoyTxt", 'peanuts.ttf');
		setTextAlignment('enjoyTxt', 'center')
		setObjectCamera('enjoyTxt','hud')
		setProperty('enjoyTxt.y', 360)
		setProperty('enjoyTxt.alpha', 0.0001)

		makeLuaSprite('pattyToy', 'easter eggs/patty figure', -100, -100);
		setObjectCamera('pattyToy','hud')
		scaleObject('pattyToy', 0.4, 0.4);
		addLuaSprite('pattyToy', false);
		setProperty('pattyToy.alpha', 0.0001)

		
		incutscene = true
		allowCountdown = true
		setProperty('inCutscene', true);
		setProperty('camGame.zoom', 1.0);
		runTimer('cutsceneTime', 17.0)
		runTimer('blackScreenTime', 15.0)
		runTimer('spcSkipTimeTxt', 4.0)
		runTimer('TW1', 1.0)
		runTimer('TW2', 3.0)
		runTimer('TW3', 4.5)
		runTimer('TW4', 7.8)
		runTimer('TW5', 11.5)
		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('camHUD.visible',true)
	return Function_Continue;

end

function onTimerCompleted(t,l,ll)

	if t == 'cutsceneTime' then
		startCountdown();
	end

	if t == 'fadeTime' then
		startCountdown();
	end

	if t == 'spcSkipTimeTxt' then
		doTweenAlpha('pressTxtFade', 'pressTxt', 1, 1, 'linear')
	end

	if t == 'TW1' then
		setProperty('WarningTxt1.alpha', 1.0)
		playSound('thunk', 0.8)
	end
	if t == 'TW2' then
		setProperty('WarningTxt2.alpha', 1.0)
		playSound('bababrr', 0.9)
	end

	if t == 'TW3' then
		setProperty('eBassTxt.alpha', 1.0)
		setProperty('eBassTxt.y', 350)
		doTweenY('eBassTxtSlideUp', 'eBassTxt', 300, 1, 'quintOut')
		playSound('warning_shot', 0.9)
	end

	if t == 'TW4' then
		setProperty('WarningTxt3.alpha', 1.0)
		playSound('bunk', 0.9)
	end

	if t == 'TW5' then
		setProperty('WarningTxt1.alpha', 0.0001)
		setProperty('WarningTxt2.alpha', 0.0001)
		setProperty('WarningTxt3.alpha', 0.0001)
		setProperty('eBassTxt.alpha', 0.0001)

		setProperty('enjoyTxt.alpha', 1.0)
		doTweenY('enjoyTxtSlideUp', 'enjoyTxt', 300, 1, 'quintOut')
		playSound('birthday_yay_sfx', 0.9)
	end

	if t == 'blackScreenTime' then
		doTweenAlpha('blackScreenDisappear', 'blackScreen', 0.0001, 1, 'linear')
		doTweenAlpha('enjoyTxtFade', 'enjoyTxt', 0.0001, 1, 'linear')
		doTweenAlpha('pressTxtFade2', 'pressTxt', 0.0001, 1, 'linear')
	end

end

function onUpdate()

end

function onUpdatePost()

	if incutscene then
		if keyboardJustPressed('BACKSPACE') then
			cancelTimer('cutsceneTime', true)
			cancelTimer('blackScreenTime', true)
			cancelTimer('spcSkipTimeTxt', true)
			cancelTimer('TW1', true)
			cancelTimer('TW2', true)
			cancelTimer('TW3', true)
			cancelTimer('TW4', true)
			cancelTimer('TW5', true)
			cancelTween('pressTxtFade')
			cancelTween('eBassTxtSlideUp')

			setProperty('WarningTxt1.alpha', 0.0001)
			setProperty('WarningTxt2.alpha', 0.0001)
			setProperty('WarningTxt3.alpha', 0.0001)
			setProperty('eBassTxt.alpha', 0.0001)
			setProperty('enjoyTxt.alpha', 0.0001)
			setProperty('pressTxt.alpha', 0.0001)

			playSound('readyToGo_sfx', 0.9)

			stopSound('thunk', true);
			stopSound('bababrr', true);
			stopSound('warning_shot', true);
			stopSound('bunk', true);
			stopSound('birthday_yay_sfx', true);

			setProperty('pattyToy.alpha', 0.6)
			doTweenAlpha('pattyFigureJumpscare', 'pattyToy', 0.0001, 1, 'linear')
			doTweenAlpha('blackScreenDisappear', 'blackScreen', 0.0001, 1, 'linear')
			runTimer('fadeTime', 2.0)
			return Function_Continue;
			
		end
	end
end

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

function onCreatePost()

	setProperty('healthBar.alpha', 0.0001)
	setProperty('iconP1.alpha', 0.0001)
	setProperty('iconP2.alpha', 0.0001)
	
end

function onBeatHit()

	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

	if getProperty('dad.animation.curAnim.name') == 'idle' then
		characterPlayAnim('dad','idle',true)
	end

	if curBeat == 1 then
		doTweenAlpha('healthAlphaTween', 'healthBar', 1.0, 1.6, 'linear');
		doTweenAlpha('healthBGAlphaTween', 'healthBarBG', 1.0, 1.6, 'linear');
		doTweenAlpha('iconP1AlphaTween', 'iconP1', 1.0, 1.6, 'linear');
		doTweenAlpha('iconP2AlphaTween', 'iconP2', 1.0, 1.6, 'linear');
		doTweenAlpha('scoreTxtAlphaTween', 'scoreTxt', 1.0, 1.6, 'linear');
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
		triggerEvent('Add Camera Zoom',0.015*camInt,0.05*camInt)
	end
end

