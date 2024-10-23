
function onCreate()
	makeLuaSprite('pattyToy', 'easter eggs/patty figure', -100, -100);
	setObjectCamera('pattyToy','hud')
	scaleObject('pattyToy', 0.4, 0.4);
	addLuaSprite('pattyToy', false);
	setProperty('pattyToy.alpha', 0.0001)

end

spacePress = 0

function onUpdate()
	if keyboardJustPressed('SPACE') then
		spacePress = spacePress + 1
		playSound('birthday_yay_sfx', 0.9)
		setProperty('pattyToy.alpha', 0.6)
		doTweenAlpha('pattyFigureJumpscare', 'pattyToy', 0.0001, 1, 'linear')

		if spacePress > 9 then
			playSound('mario_1up', 0.9)

			addScore(100)

			health = getProperty('health')
			if getProperty('health') > 0.02 then
				setProperty('health', health+ 0.1);
			end
		end
	end
end


