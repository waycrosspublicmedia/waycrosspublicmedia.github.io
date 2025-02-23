function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
end
	
function onUpdate(elapsed)
	if mustHitSection then
		setProperty("defaultCamZoom",  0.75)
	else
		setProperty("defaultCamZoom",  0.55)
	end
end

function onCreate()
	setProperty("beatsPerZoom",999999999999999999)
	setProperty("skipCountdown", true);
	makeLuaSprite('Dark', '',-1000,-1000)
	makeGraphic('Dark', 1, 1, '000000')
    scaleObject('Dark',4000,4000)
	setScrollFactor('Dark', 0, 0)

    setProperty("Dark.alpha", tonumber(0))

end


function onStepHit()
    --fade in intro / outro
	
	if curStep == 1 then
		doTweenAlpha('startBlackFade', 'startDark', 0, 8, 'smootherStepInOut')
	end

	if curStep == 1 then
		doTweenZoom('tag', 'camGame', 0.55, 10, 'smootherStepInOut')
	end

    if curStep == 60 then 
        setProperty("defaultCamZoom",  0.55)
    end

    if curStep == 736 then
        setProperty("Dark.alpha", tonumber(1))
    end
end