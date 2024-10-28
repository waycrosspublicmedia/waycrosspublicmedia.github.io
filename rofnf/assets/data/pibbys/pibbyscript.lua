
function onCreate()


    setProperty('camHUD.visible', 0)
end

function onBeatHit()


    if curBeat == 32 then
              
        setProperty('camHUD.visible', 1)
    end



end