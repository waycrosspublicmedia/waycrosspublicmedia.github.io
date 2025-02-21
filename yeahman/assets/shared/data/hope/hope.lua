
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

    if curStep == 160 then
		triggerEvent("Set GF Speed", 1)
	end

    if curStep == 256 then
		triggerEvent("Set GF Speed", 2)
	end

    if curStep == 288 then
		triggerEvent("Set GF Speed", 1)
	end

    if curStep == 896 then
		triggerEvent("Set GF Speed", 2)
	end

    if curStep == 928 then
		triggerEvent("Set GF Speed", 1)
	end

    if curStep == 1024 then
		triggerEvent("Set GF Speed", 2)
	end

    if curStep == 1056 then
		triggerEvent("Set GF Speed", 1)
	end

    if curStep == 1152 then
		triggerEvent("Set GF Speed", 2)
	end

    if curStep == 1280 then
		triggerEvent("Set GF Speed", 1)
	end

	--camera speed bump stuff for yknow if data added that code

end


function onEvent(eventName, value1, value2, strumTime)
	if eventName == '' and value1 == 'weener' then
		runHaxeCode([[
			FlxG.camera.visible = false;
			game.camHUD.visible = false;
		]])
	end
end

