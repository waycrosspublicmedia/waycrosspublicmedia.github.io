function onCreate()
    cameraSetTarget("dad")
    setProperty("skipCountdown", true)
    precacheSound("wtfisgoinon")
    makeLuaSprite("dark")
    makeGraphic("dark", getPropertyFromClass("flixel.FlxG", "width"), getPropertyFromClass("flixel.FlxG", "height"), "000000")
    setObjectCamera("dark", "other")
    setProperty("dark.alpha", 0)
    addLuaSprite("dark")
end

function onBeatHit()
    if curBeat == 198 then
        playSound("wtfisgoinon")
    end
    if curBeat == 201 then
        cameraShake("game", 0.01, crochet / 1000 * 2)
    end
    if curBeat == 203 then
        cameraShake("game", 0.03, crochet / 1000 * 2)
    end
    if curBeat == 205 then
        cameraShake("game", 0.05, crochet / 1000)
    end
    if curBeat == 206 then
        cameraShake("game", 0, 1)
        setProperty("dark.alpha", 1)
    end
end