function onStepHit()

    if curStep == 1276 then
        triggerEvent('Change Character', 'gf', 'bfFH')
    end

    if curStep == 1281 then
        doTweenX('whhooop', 'gf', 4000, 2.2, 'cubeIn')
    end

    if curStep == 1296 then
        triggerEvent('Screen Shake','0.3, 0.03' ,'0.3, 0.01')
        playSound('break', 0.7)
    end
end