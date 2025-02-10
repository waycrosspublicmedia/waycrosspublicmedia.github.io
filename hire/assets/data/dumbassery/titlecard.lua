function onCreate()

    makeLuaSprite('titlecard', 'titlecards/dumbasserytitlecard', -300, 150)
    setObjectCamera('titlecard', 'hud')

    addLuaSprite('titlecard', true)
end

function onStepHit()

    if curStep == 1 then
        doTweenX('themoveee', 'titlecard', 0, 1, 'backOut')
    end
    if curStep == 32 then
        doTweenX('themoveback', 'titlecard', -500, 1.5, 'quadIn')
    end
end