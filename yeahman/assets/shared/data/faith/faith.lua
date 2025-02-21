
function onCreate()

	setProperty('skipCountdown',true)

	makeLuaSprite('startDark', '', 0, 0)
	makeGraphic('startDark', 1500, 1500, '000000')
	setObjectCamera('startDark', 'camHUD')
	setScrollFactor('startDark', 0, 0);
	addLuaSprite('startDark', false)

	setProperty('healthBar.alpha', tonumber(0))
	setProperty('iconP1.alpha', tonumber(0))
	setProperty('iconP2.alpha', tonumber(0))
	setProperty('scoreTxt.alpha', tonumber(0))
	setProperty('healthBarContainer.visible', false)

	doTweenZoom('tag', 'camGame', 1.2, 0.01)

	triggerEvent("Set GF Speed", 2)


end

function onStepHit()

    --fade in intro / outro
	
	if curStep == 1 then
		doTweenAlpha('startBlackFade', 'startDark', 0, 10, 'linear')
	end

	if curStep == 1 then
		doTweenZoom('tag', 'camGame', 0.4, 10, 'smootherStepInOut')
	end

	if curStep == 1532 then
		doTweenAlpha('startBlackFade', 'startDark', 1, 0.01, 'linear')
	end

    --gf speed up stuff

end

