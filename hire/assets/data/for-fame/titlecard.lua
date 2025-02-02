function onCreate()

    makeLuaSprite('titlecard', 'titlecards/forfametitlecard', -300, 150)
    setObjectCamera('titlecard', 'hud')

    addLuaSprite('titlecard', true)
end

function onStepHit()

    if curStep == 16 then
        doTweenX('themoveee', 'titlecard', 0, 1, 'backOut')
    end
    if curStep == 53 then
        doTweenX('themoveback', 'titlecard', -500, 1.5, 'quadIn')
    end
end