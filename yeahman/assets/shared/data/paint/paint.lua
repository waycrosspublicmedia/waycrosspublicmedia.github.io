function onCreatePost()


	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end


	makeLuaSprite("black_")
	makeGraphic("black_",1,1,"000000")
	scaleObject("black_", screenWidth,screenHeight)
	setProperty("black_.alpha", 0)
	addLuaSprite("black_")
	setObjectCamera("black_",'hud') --i did this and somehow forgot about _fxFadeAlpha lol



	setProperty("camZooming", true)

end

	
function onCreate()
	setProperty('healthBar.alpha', tonumber(0))
	setProperty('scoreTxt.alpha', tonumber(0))
	setProperty('healthBarContainer.visible', false)
end



function onEvent(eventName, value1, value2, strumTime)
	if eventName == '' then
		if value1 == 'combakc' then
			doTweenAlpha("black_R", "black_", 0, 0.75, "")
		end

		if value1 == 'setQ' then
			local num = tonumber(value2)
			setProperty("defaultCamZoom", num)
			setProperty("camGame.zoom", num)
		end

	end


end
	



