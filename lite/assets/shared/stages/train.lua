local dir = "bg/train/"

function onCreate()
    makeLuaSprite("city", dir .. "city", -1460, -1200)
    scaleObject("city", 2.2, 2.2)
    setProperty("city.antialiasing", false)
    setScrollFactor("city", 0.7, 0.7)
    addLuaSprite("city")

    makeLuaSprite("polls", dir .. "polls", -1460, -1200)
    scaleObject("polls", 2.2, 2.2)
    setProperty("polls.antialiasing", false)
    addLuaSprite("polls")

    makeLuaSprite("train", dir .. "train", 3000, 100)
    scaleObject("train", 2.2, 2.2)
    setProperty("train.antialiasing", false)
    addLuaSprite("train")

    makeLuaSprite("ground", dir .. "ground", -1460, -1200)
    scaleObject("ground", 2.2, 2.2)
    setProperty("ground.antialiasing", false)
    addLuaSprite("ground")

    runTimer("trainComes", 0)
end

function onPause()
    pauseSound("trainSound")
end

function onResume()
    resumeSound("trainSound")
end

function onTimerCompleted(tag)
    if tag == "trainComes" then
        playSound("train_comes", 1, "trainSound")
        runTimer("trainComes", getRandomInt(15, 25))
        runTimer("trainIncome", 4.74)
        runTimer("readyGF", 4.2)
        runTimer("callTrain", 4.5)
        runTimer("trainPassed", 6.75)

    elseif tag == "callTrain" then
        runTimer("trainPassing", 0.25, 8)

    elseif tag == "trainIncome" then
        setProperty("train.x", 3000)
        doTweenX("trainXTW", "train", 1000, 0.1)

    elseif tag == "readyGF" then
        characterPlayAnim("gf", "hairblow", true)
        runHaxeCode("game.gf.specialAnim = true;")

    elseif tag == "trainPassing" then
        setProperty("train.x", 0)
        doTweenX("trainXTW", "train", -8000, 0.25)

    elseif tag == "trainPassed" then
        setProperty("train.x", 1000)
        doTweenX("trainXTW", "train", -15000, 0.4)
    end
end
