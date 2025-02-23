function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
end
	
function onUpdate(elapsed)
    if mustHitSection then
            setProperty("defaultCamZoom",  0.6)
            doTweenAlpha('lowkbruh', "bg", 1, 0.4, 'linear')
    else
            setProperty("defaultCamZoom",  0.67)
            doTweenAlpha('lowkbruh', "bg", 0.5, 0.6, 'linear')
    end
end
    


function onCreate()
        setProperty("beatsPerZoom",999999999999999999)
end