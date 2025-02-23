function onCreate()
	makeLuaSprite('startDark', '', 0, 0)
	makeGraphic('startDark', 1, 1, '000000')
	scaleObject("startDark", 1280, 720)
	setScrollFactor('startDark', 0, 0);
	addLuaSprite('startDark', true)

	makeLuaSprite('Dark', '', 0, 0)
	makeGraphic('Dark', 1, 1, '000000')
	scaleObject("Dark",1500,1500)
	setScrollFactor('Dark', 0, 0);
	setObjectCamera("Dark", "camHUD")
	addLuaSprite('Dark', true)

	setProperty("Dark.alpha", tonumber(0))
	setProperty("gf.alpha", tonumber(0))
end


function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
end
	
function onStepHit()
    --fade in intro / outro
	
	if curStep == 1 then
		doTweenAlpha('startBlackFade', 'startDark', 0, 12.5, 'linear')
	end

	if curStep == 1 then
		doTweenZoom('tag', 'camGame', 1.1, 11, 'smootherStepInOut')
	end

	if curStep == 784 then
		setProperty("Dark.alpha", tonumber(1))
		setProperty("gf.alpha", tonumber(1))
	end

	if curStep == 800 then
		setProperty("Dark.alpha", tonumber(0))
	end

	if curStep == 1024 then
		doTweenZoom('tag', 'camGame', 5.0, 3, 'smootherStepInOut')
		doTweenAlpha('startBlackFade', 'Dark', 1, 1, 'linear')
	end

end


	