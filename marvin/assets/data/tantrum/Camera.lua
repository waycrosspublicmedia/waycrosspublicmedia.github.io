local campointx = 0
local campointy = 0
local bfturn = bool
local camMovement = 7.5
local velocity = 2.5

function onSongStart() -- no more bug
    campointx = getProperty('camFollow.x')
    campointy = getProperty('camFollow.y')
end    

-- edit these 2 last values up here so you dont have to manually do every single one
function onMoveCamera(focus)
	if focus == 'boyfriend' then
            campointx = getProperty('camFollow.x')
            campointy = getProperty('camFollow.y')
            bfturn = true
	elseif focus == 'dad' then
            campointx = getProperty('camFollow.x')
            campointy = getProperty('camFollow.y')
            bfturn = false
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if bfturn then
        if direction == 0 then
            setProperty('camFollow.x', campointx - camMovement)
        elseif direction == 1 then
            setProperty('camFollow.y', campointy + camMovement)
        elseif direction == 2 then
            setProperty('camFollow.y', campointy - camMovement)
        elseif direction == 3 then
            setProperty('camFollow.x', campointx + camMovement)
        end
    end
end   

-- delete this if you dont want the oponent to move the camera
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not bfturn then
        if direction == 0 then
            setProperty('camFollow.x', campointx - camMovement)
        elseif direction == 1 then
            setProperty('camFollow.y', campointy + camMovement)
        elseif direction == 2 then
            setProperty('camFollow.y', campointy - camMovement)
        elseif direction == 3 then
            setProperty('camFollow.x', campointx + camMovement)
        end
    end
end