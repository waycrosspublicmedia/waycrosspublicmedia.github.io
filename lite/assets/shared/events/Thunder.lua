function onCreate()
    precacheSound("thunder1")
    precacheSound("thunder2")
end

function onEvent(name, v1)
    if name == "Thunder" then
        playSound("thunder" .. v1)
        setProperty("thunder.alpha", 1)
        runTimer("thunderFade", 0.2)
        characterPlayAnim("gf", "scared", true)
        runHaxeCode("game.gf.specialAnim = true;")
    end
end

function onTimerCompleted(tag)
    if tag == "thunderFade" then
        doTweenAlpha("thunderATW", "thunder", 0, 1, "sinein")
    end
end