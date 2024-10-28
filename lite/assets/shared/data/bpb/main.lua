local hue = 0.0
local hueSpeed = 50
local ogTimeColor

function onCreatePost()
    ogTimeColor = getProperty("timeBar.leftBar.color")
end

function onUpdatePost(elapsed)
    if 128 <= curBeat and curBeat <= 191 then
        setTextString("timeTxt", "FREESTYLE")
        hue = hue + hueSpeed * elapsed
        if hue > 360 then
            hue = hue - 360
        end

        runHaxeCode("game.timeBar.setColors(FlxColor.fromHSB(" .. hue .. ", 0.5, 1.0));")
    end
end

function onBeatHit()
    if curBeat == 192 then
        runHaxeCode("game.timeBar.setColors(".. ogTimeColor.. ");")
    end
end