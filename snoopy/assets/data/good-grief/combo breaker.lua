local originyIP = 0
local originyIP2 = 0
local originyIP3 = 0
local originyIP4 = 0

function onCreate()
	makeAnimatedLuaSprite('superBG','easter eggs/bg super',-500, -100)
    addAnimationByPrefix('superBG','SHING','super BG thing',60,false);
	setLuaSpriteScrollFactor('superBG', 0, 0);
	setProperty('superBG.antialiasing',false)
    addLuaSprite('superBG',false)
	scaleObject('superBG', 7.0, 7.0)
    setProperty('superBG.alpha', 0.0001)

	makeAnimatedLuaSprite('superCharge','easter eggs/charging',430, 0)
    addAnimationByPrefix('superCharge','SHOOO','super charge',30,false);
	setLuaSpriteScrollFactor('superCharge', 1, 1);
	setProperty('superCharge.antialiasing',false)
    addLuaSprite('superCharge',true)
	scaleObject('superCharge', 2.0, 2.0)
	setBlendMode('superCharge','add')
    setProperty('superCharge.alpha', 0.0001)

	makeLuaSprite('jjInput1','easter eggs/jjba input1',800, 530)
	addLuaSprite('jjInput1',true)
	setProperty('jjInput1.antialiasing',false)
    setObjectCamera('jjInput1','hud')
    scaleObject('jjInput1', 4.0, 4.0)
	setProperty('jjInput1.alpha', 0.0001)

	makeLuaSprite('jjInput2','easter eggs/jjba input2',900, 530)
	addLuaSprite('jjInput2',true)
	setProperty('jjInput2.antialiasing',false)
    setObjectCamera('jjInput2','hud')
    scaleObject('jjInput2', 4.0, 4.0)
	setProperty('jjInput2.alpha', 0.0001)

	makeLuaSprite('jjInput3','easter eggs/jjba input3',1000, 530)
	addLuaSprite('jjInput3',true)
	setProperty('jjInput3.antialiasing',false)
    setObjectCamera('jjInput3','hud')
    scaleObject('jjInput3', 4.0, 4.0)
	setProperty('jjInput3.alpha', 0.0001)

	makeLuaSprite('jjInput4','easter eggs/jjba input4',1150, 530)
	addLuaSprite('jjInput4',true)
	setProperty('jjInput4.antialiasing',false)
    setObjectCamera('jjInput4','hud')
    scaleObject('jjInput4', 4.0, 4.0)
	setProperty('jjInput4.alpha', 0.0001)

	makeAnimatedLuaSprite('cutIn','easter eggs/bf cut in',1200, 400)
    addAnimationByPrefix('cutIn','shakeShake','cut in shake',40,true);
	setLuaSpriteScrollFactor('cutIn', 0, 0);
    addLuaSprite('cutIn',false)
	scaleObject('cutIn', 0.4, 0.4)
	--setObjectCamera('cutIn','hud')
    setProperty('cutIn.alpha', 0.0001)

	makeLuaText('manualText1', 'Manual Input Mode: ON', 400, 860)
    addLuaText('manualText1', true)
    setTextSize('manualText1', 30.0)
    setTextAlignment('manualText1', 'left')
    setTextColor('manualText1','ffffff')
    setObjectCamera('manualText1','hud')
    setProperty('manualText1.y', 540)
    setProperty('manualText1.alpha', 0.0001)

	makeLuaText('manualText2', 'Manual Input Mode: OFF', 400, 860)
    addLuaText('manualText2', true)
    setTextSize('manualText2', 30.0)
    setTextAlignment('manualText2', 'left')
    setTextColor('manualText2','ffffff')
    setObjectCamera('manualText2','hud')
    setProperty('manualText2.y', 540)
    setProperty('manualText2.alpha', 0.0001)

	originyIP = getProperty('jjInput1.y')
	originyIP2 = getProperty('jjInput2.y')
	originyIP3 = getProperty('jjInput3.y')
	originyIP4 = getProperty('jjInput4.y')
end

bfSuperLines = {
    'bf_superline1',
    'bf_superline2',
    'bf_superline3',
	'bf_superline4',

}

manualInputMode = false

spacePress = 1
mPress = 1
inputThing = 1
function onUpdate()
	rand= math.random( 1, 4)
    coolLine = bfSuperLines[rand]
	if keyboardJustPressed('SPACE') then
        spacePress = spacePress + 1
		if spacePress == 2 then
			setProperty('jjInput1.alpha', 1)
			setProperty('jjInput1.y', originyIP+15)
			doTweenY('input1Bounceup','jjInput1',originyIP+0, 0.5,'quintOut')
			playSound('jjba_punch1', 0.7);
		end

		if spacePress == 3 then
			setProperty('jjInput2.alpha', 1)
			setProperty('jjInput2.y', originyIP2+15)
			doTweenY('input2Bounceup','jjInput2',originyIP2+0, 0.5,'quintOut')
			playSound('jjba_punch2', 0.7);
		end

		if spacePress == 4 then
			setProperty('jjInput3.alpha', 1)
			setProperty('jjInput3.y', originyIP3+15)
			doTweenY('input3Bounceup','jjInput3',originyIP3+0, 0.5,'quintOut')
			playSound('jjba_punch3', 0.7);
		end
		
		if spacePress == 5 then
			setProperty('jjInput4.alpha', 1)
			setProperty('jjInput4.y', originyIP4+15)
			doTweenY('input4Bounceup','jjInput4',originyIP4+0, 0.5,'quintOut')
			playSound('jjba_ready', 1.0);
		end

		if spacePress == 6 then
			runTimer('superIntroTime', 0.6)
			setProperty('jjInput1.alpha', 0.0001)
			setProperty('jjInput2.alpha', 0.0001)
			setProperty('jjInput3.alpha', 0.0001)
			setProperty('jjInput4.alpha', 0.0001)

			playSound('jjba_super', 1.0);
			playSound(coolLine , 1.0);

			triggerEvent('Hey!','BF','1.0')

			setProperty('cutIn.alpha', 1)

			objectPlayAnimation('superBG','SHING',true)
			objectPlayAnimation('superCharge','SHOOO',true)
			runTimer('sparkVisibility', 0.9)
			setProperty('superCharge.alpha', 1)
			setProperty('superBG.alpha', 1)

			doTweenX('ciScaleX', 'cutIn.scale', 1.4, 0.2, 'linear');
			doTweenX('ciTweenX', 'cutIn', 800, 0.2, 'linear');
			doTweenY('ciTweenY', 'cutIn', 300, 0.2, 'linear');
			doTweenY('ciScaleY', 'cutIn.scale', 1.4, 0.2, 'linear');
		end
	end

	if keyboardJustPressed('M') then
		mPress = mPress + 1
		if mPress == 2 then
			playSound('jjba_punch1', 0.7);

			setProperty('manualText1.alpha', 1)
			setProperty('manualText2.alpha', 0.0001)

			runTimer('mTextTime1', 1)
			cancelTween('mTextFade1')
			cancelTween('mTextFade2')
			manualInputMode = true
		else
			mPress = 1
			playSound('jjba_punch1', 0.7);

			setProperty('manualText1.alpha', 0.0001)
			setProperty('manualText2.alpha', 1)

			runTimer('mTextTime2', 1)
			cancelTween('mTextFade1')
			cancelTween('mTextFade2')
			manualInputMode = false
		end
	end

-- Manual Input Stuff
	if manualInputMode == true then
		if keyboardJustPressed('DOWN') then
			inputThing = inputThing + 1

			if inputThing == 2 then
				runTimer('inputTime', 0.3)
			end
		end

		if keyboardJustPressed('RIGHT') then
			inputThing = inputThing + 1

			if inputThing == 3 then
				runTimer('inputTime', 0.3)
			end
		end

		if keyboardJustPressed('Z') then
			inputThing = inputThing + 1

			if inputThing == 4 then
				runTimer('inputTime', 0.3)
			end
		end

		if keyboardReleased('Z') then
			if inputThing == 4 then
				runTimer('superIntroTime', 0.6)

				playSound('jjba_super', 1.0);
				playSound(coolLine , 1.0);

				triggerEvent('Hey!','BF','1.0')

				setProperty('cutIn.alpha', 1)

				objectPlayAnimation('superBG','SHING',true)
				objectPlayAnimation('superCharge','SHOOO',true)
				runTimer('sparkVisibility', 0.9)
				setProperty('superCharge.alpha', 1)
				setProperty('superBG.alpha', 1)

				doTweenX('ciScaleX', 'cutIn.scale', 1.4, 0.2, 'linear');
				doTweenX('ciTweenX', 'cutIn', 800, 0.2, 'linear');
				doTweenY('ciTweenY', 'cutIn', 300, 0.2, 'linear');
				doTweenY('ciScaleY', 'cutIn.scale', 1.4, 0.2, 'linear');
			end
		end
	end
end

function onTimerCompleted(t,l,ll)
	if t == 'superIntroTime' then
		setProperty('blackBG.alpha', 0.0001)
		setProperty('cutIn.alpha', 0.0001)
		setProperty('superBG.alpha', 0.0001)
		runTimer('superHealth', 0.8)
		scaleObject('cutIn', 0.4, 0.4)
		runTimer('healthGaining', 0.05)
	end

	if t == 'superHealth' then
		spacePress = 1
		inputThing = 1
		cancelTimer('healthGaining', true)
	end

	if t == 'sparkVisibility' then
		setProperty('superCharge.alpha', 0.0001)
	end

	if t == 'healthGaining' then
		health = getProperty('health')
    	if getProperty('health') > 0.02 then
       	 setProperty('health', health+ 0.03);
    	end

		if manualInputMode == true then
			if getProperty('health') > 0.02 then
				setProperty('health', health+ 0.05);
			end
		end

		playSound('jjba_punch3', 0.7);
		runTimer('healthGaining', 0.05)
	end

--manual input stuff
	if t == 'mTextTime1' then
		doTweenAlpha('mTextFade1', 'manualText1', 0.0001, 1, 'linear');
	end

	if t == 'mTextTime2' then
		doTweenAlpha('mTextFade2', 'manualText2', 0.0001, 1, 'linear');
	end

	if t == 'inputTime' then
		inputThing = 1
	end


end

function onStepHit()

end

