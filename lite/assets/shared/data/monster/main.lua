local dir = "bg/house/"

function onCreate()
    setProperty("timeBar.visible", false)
    setProperty("timeTxt.visible", false)
    makeLuaSprite("vignette", dir .. "vignette")
    setObjectCamera("vignette", "other")
    setProperty("vignette.alpha", 0)
    addLuaSprite("vignette")
end

function onBeatHit()
    if curBeat == 128 then
        setProperty("house.alpha", 0.6)
    end
    if curBeat == 158 then
        doTweenAlpha("bgATW", "house", 1, crochet / 1000 * 2, "sineOut")
    end
    if curBeat == 192 then
        setProperty("house.alpha", 0.8)
        doTweenAlpha("bgATW", "house", 0.2, crochet / 1000 * 4, "sineOut")
        setProperty("vignette.alpha", 1)
    end
    if curBeat == 318 then
        setProperty("house.alpha", 1)
        removeLuaSprite("vignette")
    end
end