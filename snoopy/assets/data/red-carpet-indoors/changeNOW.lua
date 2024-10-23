
function onCreate()

	makeAnimatedLuaSprite('changePoof','easter eggs/poof cloud',520, 140)
    addAnimationByPrefix('changePoof','changeNOW','poofin',24,false);
    addLuaSprite('changePoof',true)
    setProperty('changePoof.alpha', 0.0001)
end

spacePress = 1
function onUpdate()

	if keyboardJustPressed('SPACE') then
		spacePress = spacePress + 1
		if spacePress == 2 then
			triggerEvent('Change Character','BF','joe-cool-bf-p')
			setProperty('changePoof.alpha', 1)
			objectPlayAnimation('changePoof', 'changeNOW', true)
			runTimer('poofVisible', 0.83)
			playSound('change_cheer', 0.8);
		else
			spacePress = 1
			triggerEvent('Change Character','BF','bf-p')
			setProperty('changePoof.alpha', 1)
			objectPlayAnimation('changePoof', 'changeNOW', true)
			runTimer('poofVisible', 0.83)
			playSound('change_boo', 0.8);
			
		end
	end
end

function onTimerCompleted(t,l,ll)
	if t == 'poofVisible' then
		setProperty('changePoof.alpha', 0.0001)
	end
end
