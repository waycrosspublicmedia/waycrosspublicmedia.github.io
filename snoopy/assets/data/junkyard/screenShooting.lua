
function onCreate()

	makeLuaSprite('whiteBG','',-1000,-900)
	makeGraphic('whiteBG',4000,4000,'ffffff')
	addLuaSprite('whiteBG',false)
	setObjectCamera('whiteBG','hud')
	setBlendMode('whiteBG','add')
    setProperty('whiteBG.alpha', 0.0001)

	makeAnimatedLuaSprite('bulletHole','easter eggs/wall hole',600, 100)
	addAnimationByPrefix('bulletHole','boom','hole in wall',24,false);
    addLuaSprite('bulletHole',true)
	setObjectCamera('bulletHole','hud')
	scaleObject('bulletHole', 1.2, 1.2);
    setProperty('bulletHole.alpha', 0.0001)

	makeAnimatedLuaSprite('bulletHole2','easter eggs/wall hole',400, 300)
	addAnimationByPrefix('bulletHole2','boom2','hole in wall',24,false);
    addLuaSprite('bulletHole2',true)
	setObjectCamera('bulletHole2','hud')
	scaleObject('bulletHole2', 1.2, 1.2);
    setProperty('bulletHole2.alpha', 0.0001)

	makeAnimatedLuaSprite('bulletHole3','easter eggs/wall hole',800, 200)
	addAnimationByPrefix('bulletHole3','boom3','hole in wall',24,false);
    addLuaSprite('bulletHole3',true)
	setObjectCamera('bulletHole3','hud')
	scaleObject('bulletHole3', 1.2, 1.2);
    setProperty('bulletHole3.alpha', 0.0001)

	makeAnimatedLuaSprite('bulletHole4','easter eggs/wall hole',700, 0)
	addAnimationByPrefix('bulletHole4','boom4','hole in wall',24,false);
    addLuaSprite('bulletHole4',true)
	setObjectCamera('bulletHole4','hud')
	scaleObject('bulletHole4', 1.2, 1.2);
    setProperty('bulletHole4.alpha', 0.0001)

end

gunShots = {
    'gunshot1',
    'gunshot2',
    'gunshot3',
	'gunshot4',
	'gunshot5',

}

spacePress = 1
function onUpdate()
	rand= math.random( 1, 4)
    fire = gunShots[rand]
	if keyboardJustPressed('SPACE') then
        spacePress = spacePress + 1
		setProperty('bulletHole.alpha', 1)
		if spacePress < 7 then
			setProperty('whiteBG.alpha', 0.7)
			doTweenAlpha('muzzleFlash','whiteBG', 0.0001, 0.1,'linear')
			playSound(fire, 0.9);
		else
			stopSound(fire, true)
		end
		if spacePress == 2 then
			objectPlayAnimation('bulletHole', 'boom', true)
			setProperty('bulletHole.alpha', 1)
		end

		if spacePress == 3 then
			objectPlayAnimation('bulletHole2', 'boom2', true)
			setProperty('bulletHole2.alpha', 1)
		end

		if spacePress == 4 then
			objectPlayAnimation('bulletHole3', 'boom3', true)
			setProperty('bulletHole3.alpha', 1)
		end

		if spacePress == 5 then
			objectPlayAnimation('bulletHole4', 'boom4', true)
			setProperty('bulletHole4.alpha', 1)
		end

		if spacePress == 6 then
			noteTweenAngle('noteAngleShizz', 4, 180, 1.5, 'quadOut')
			noteTweenX('noteSlideLeft', 4, 550, 1.5, 'linear')
			noteTweenY('noteShotUp', 4, -60, 0.4, 'quadOut')
			playSound('bababrr', 0.9);
		end
	end
end

function onTweenCompleted(t)

	if t == 'noteShotUp' then
		noteTweenY('noteGoesDown', 4, 800, 0.8, 'quadIn')
	end

end

function onTimerCompleted(t,l,ll)


end

function onStepHit()

end

