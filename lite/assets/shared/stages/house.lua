local dir = "bg/house/"

function onCreate()
    makeLuaSprite("house", dir .. (songName == "Monster" and "monster" or "house"), -1460, -1200)
    scaleObject("house", 2.2, 2.2)
    setProperty("house.antialiasing", false)
    addLuaSprite("house")

    makeLuaSprite("thunder", dir .. "thunder", -1460, -1200)
    setProperty("thunder.alpha", 0)
    scaleObject("thunder", 2.2, 2.2)
    setProperty("thunder.antialiasing", false)
    addLuaSprite("thunder")
end