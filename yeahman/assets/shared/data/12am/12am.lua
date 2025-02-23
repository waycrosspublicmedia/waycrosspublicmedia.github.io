function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
end

function onCreate()
	setProperty("beatsPerZoom",999999999999999999)
end
	