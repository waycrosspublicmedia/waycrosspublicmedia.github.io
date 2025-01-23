function onCreate()
	setProperty("isMiddleScroll", true)
	setProperty("showOpponentStrums", false)

	makeLuaSprite('title', 'rolling girl/title')
	setObjectCamera('title', 'camHUD')
	setProperty('title.alpha', 0)
	screenCenter('title')
	addLuaSprite('title')

	setProperty('card.visible', false)
end

function onCreatePost()
	scaleObject("boyfriend", 0.8, 0.8)
	triggerEvent("Move Camera", "bf")

	triggerEvent("Lagtrain Stage Visibility", "false")
	triggerEvent("Lagtrain Sprite", "grace,0", "true")
end

function onSectionHit()
	if curSection == 82 then
		cameraFade('camGame', '000000', 6.35, true)
	end

	if curSection == 84 then
		doTweenAlpha('title', 'title', 1, 3.89)
		close(true);
	end
end
