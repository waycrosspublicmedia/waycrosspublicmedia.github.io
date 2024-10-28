local intensity = 0.01
local duration = 0.1

function opponentNoteHit()
    camShake()
end

function camShake()
    cameraShake('game', intensity, duration)
end