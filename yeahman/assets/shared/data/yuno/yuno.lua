function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
end
	
function onCreate()
	setProperty("beatsPerZoom",999999999999999999)
	setProperty("skipCountdown", true);
	setProperty('healthBar.alpha', tonumber(0))
	setProperty('iconP1.alpha', tonumber(0))
	setProperty('iconP2.alpha', tonumber(0))
	setProperty('scoreTxt.alpha', tonumber(0))
	setProperty('healthBarContainer.visible', false)
end
	