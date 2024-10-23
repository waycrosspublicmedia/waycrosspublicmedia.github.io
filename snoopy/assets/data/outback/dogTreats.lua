local originyDT = 0
local font = 'snoopdogg.otf';

function onCreate()
	makeAnimatedLuaSprite('dogTreat','easter eggs/dog treat',1000, 500)
	addAnimationByIndices('dogTreat','bite1','dog treat stuffs','0',12)
	addAnimationByIndices('dogTreat','bite2','dog treat stuffs','1',12)
	addAnimationByIndices('dogTreat','bite3','dog treat stuffs','2',12)
	addAnimationByIndices('dogTreat','bite4','dog treat stuffs','3',12)
    addLuaSprite('dogTreat',true)
	setObjectCamera('dogTreat','hud')
	scaleObject('dogTreat', 0.9, 0.9)
    setProperty('dogTreat.alpha', 0.0001)

	originyDT = getProperty('dogTreat.y')

	makeLuaText('easterEggNoText', 'Cannot Activate Easter Egg Yet', 400, 860)
    addLuaText('easterEggNoText', true)
    setTextSize('easterEggNoText', 35.0)
    setTextAlignment('easterEggNoText', 'left')
    setTextColor('easterEggNoText','ffffff')
    setObjectCamera('easterEggNoText','hud')
    setProperty('easterEggNoText.y', 540)
	setTextBorder('easterEggNoText', 2.5, '1E1E1E')
	setTextFont("easterEggNoText", font);
    setProperty('easterEggNoText.alpha', 0.0001)
end

function onBeatHit()
	if curBeat == 36 then
		eastereggEnabled = true
	end
end

spacePress = 1
eastereggEnabled = false
function onUpdate()

	if keyboardJustPressed('SPACE') then
		if eastereggEnabled == true then
			spacePress = spacePress + 1
			if spacePress < 9 then
				setProperty('dogTreat.alpha', 1)
				setProperty('dogTreat.y', originyDT+15)
				doTweenY('dogTreatBounceup','dogTreat',originyDT+0, 0.5,'quintOut')
				playSound('chomp_sfx', 0.7);
				objectPlayAnimation('dogTreat','bite1');
			else
				stopSound('chomp_sfx', 0.7);
			end
	
			if spacePress == 6 then
				objectPlayAnimation('dogTreat','bite2');
			end
	
			if spacePress == 7 then
				objectPlayAnimation('dogTreat','bite3');
			end
	
			if spacePress == 8 then
				objectPlayAnimation('dogTreat','bite4');
				runTimer('beforeFade', 1.0)
				triggerEvent('Change Character','Dad','snoopy-happy')
			end
		else
			setProperty('easterEggNoText.alpha', 1)
			playSound('cancelMenu', 0.6)
			runTimer('noActivateFadeTime', 2)
			cancelTween('easterEggNoTextFade')
		end
	end
end

function onTimerCompleted(t,l,ll)
	if t == 'beforeFade' then
		doTweenAlpha('dogTreatFade','dogTreat',0.0001, 1,'linear')
		stopSound('chomp_sfx', true);
	end

	if t == 'noActivateFadeTime' then
		doTweenAlpha('easterEggNoTextFade','easterEggNoText',0.0001, 1,'linear')
	end

end

