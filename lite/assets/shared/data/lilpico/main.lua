function onCreatePost()
    setProperty("boyfriend.x", getProperty("boyfriend.x") + 750)
    setProperty("boyfriend.y", getProperty("boyfriend.y") - 1000)
    setProperty("gf.x", getProperty("gf.x") + 1500)
end

function onBeatHit()
    if curBeat == 17 then
        doTweenX("bfXTW", "boyfriend", getProperty("boyfriend.x") - 750, crochet / 1000 * 2)
        doTweenY("bfYTW", "boyfriend", getProperty("boyfriend.y") + 1000, crochet / 1000 * 2, "quadin")
    end
    if curBeat == 19 then
        doTweenX("gfXTW", "gf", getProperty("gf.x") - 1500, crochet / 1000 * 4)
    end
end