function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
end
	
	
function onUpdate()
    setProperty('gf.visible', false)
end
