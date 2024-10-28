function onCreate()
    makeLuaSprite("bg", nil, -2500, -2500)
    makeGraphic("bg", 1, 1)
    scaleObject("bg", 5000, 5000)
    setScrollFactor("bg", 0, 0)
    addLuaSprite("bg")
    setProperty("skipCountdown", true)
end

function lerp(a, b, t)
    return (b - a) * t + a
end

function onCountdownStarted()
	for i = 0, 3 do
		setPropertyFromGroup("playerStrums", i, "x", getPropertyFromGroup("opponentStrums", i, "x"))
		setPropertyFromGroup("opponentStrums", i, "x", lerp(defaultPlayerStrumX0, defaultPlayerStrumX3, i / 3))
	end
end
