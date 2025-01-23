function onCreatePost()
    makeLuaSprite("fade", nil, 0, 0)
    makeGraphic("fade", screenWidth, screenHeight, '000000')
    setObjectCamera("fade", 'camHUD')
    screenCenter("fade", 'xy')
    addLuaSprite("fade")
end

function onUpdatePost(elapsed)
    if curBeat > 0 and curBeat <= 8 then
        setProperty("fade.alpha", getProperty("fade.alpha") - (elapsed / 2))
    end
end