function onCreatePost()
    setProperty('introSoundsSuffix', '-none')
end

function onUpdatePost()
    setProperty("countdownReady.visible", false)
    setProperty("countdownSet.visible", false)
    setProperty("countdownGo.visible", false)
end
