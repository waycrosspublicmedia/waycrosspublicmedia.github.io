local zoomEventList = {23, 31, 39, 47, 87, 95, 103, 111}
local zoomEventNum = 1

function onCreatePost()
    triggerEvent("Alt Idle Animation", "Dad", "-alt")
    characterPlayAnim("dad", "idle-alt")
end

function onStepHit()
    if curStep == 57 then
        cameraSetTarget("dad")
    end
end

function onBeatHit()
    if curBeat <= zoomEventList[#zoomEventList] + 1 then
        if curBeat == zoomEventList[zoomEventNum] then
            setProperty("defaultCamZoom", 0.9)
            setProperty("camGame.zoom", 0.9)
        end
        if curBeat == zoomEventList[zoomEventNum] + 1 then
            setProperty("defaultCamZoom", 0.6)
            setProperty("camGame.zoom", 0.6)
            zoomEventNum = zoomEventNum + 1
        end
    end
end