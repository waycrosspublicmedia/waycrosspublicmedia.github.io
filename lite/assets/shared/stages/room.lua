local dir = "bg/room/"

function onCreate()
    makeLuaSprite("room", dir .. "room", -1000, -1200)
    scaleObject("room", 2, 2)
    setProperty("room.antialiasing", false)
    addLuaSprite("room")
end