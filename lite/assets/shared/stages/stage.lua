local dir = "bg/stage/"

function onCreate()
    makeLuaSprite("stage", dir .. "stage", -1460, -1200)
    scaleObject("stage", 2.2, 2.2)
    setProperty("stage.antialiasing", false)
    addLuaSprite("stage")
end