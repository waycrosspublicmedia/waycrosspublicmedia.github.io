function onCreate()
	makeLuaSprite('title', 'lagtrain/title')
	setObjectCamera('title', 'camHUD')
	setProperty('title.alpha', 0)
	screenCenter('title')
	addLuaSprite('title')

	makeLuaSprite('blackScreen', '', -100, -100);
    makeGraphic('blackScreen', 1280*2, 720*2, '000000');
    setScrollFactor('blackScreen', 0, 0);
    screenCenter('blackScreen');
    addLuaSprite('blackScreen', true);
    setProperty('blackScreen.alpha', 0);

	setProperty('card.visible', false)
end

function onCreatePost()
	triggerEvent("Lagtrain Stage Visibility", "false")
	triggerEvent("Lagtrain Sprite", "sven,0", "true")
end

function onSectionHit()
	if curSection == 65 then
		doTweenAlpha('thanksJorge', 'blackScreen', 1, 3.8)
		doTweenAlpha('title', 'title', 1, 3.8)
		close(true);
	end
end
