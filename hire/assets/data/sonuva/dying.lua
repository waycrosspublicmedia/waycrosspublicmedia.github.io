function onCreate()

    makeAnimatedLuaSprite('fuckin', 'mariodies', -1320, -15)
    addAnimationByPrefix('fuckin', 'wtf', 'mariodies', 20, false)
    objectPlayAnimation('fuckin', 'wtf')
    setProperty('fuckin.alpha', 0)

    makeAnimatedLuaSprite('frickin', 'mariotalks', -1355, 953)
    addAnimationByPrefix('frickin', 'poop', 'mariodies 2', 24, false)
    objectPlayAnimation('frickin', 'poop')
    setProperty('frickin.alpha', 0)

    makeAnimatedLuaSprite('stupid', 'sonic killinggg', 230, 290)
    addAnimationByPrefix('stupid', 'peeeee', 'sonic kills', 24, false)
    objectPlayAnimation('stupid', 'peeeee')
    setProperty('stupid.alpha', 0)

    addLuaSprite('fuckin', true)
    addLuaSprite('frickin', true)
    addLuaSprite('stupid', true)
end

function onStepHit()

    if curStep == 1536 then
        setProperty('boyfriend.alpha', 0)
        playSound('sonuva', 1)
        objectPlayAnimation('stupid', 'peeeee')
        setProperty('stupid.alpha', 1)
    end

    if curStep == 1552 then
        setProperty('dad.x', -1300)
        setProperty('dad.y', 900)
        setProperty('dad.alpha', 0)
        objectPlayAnimation('fuckin', 'wtf')
        setProperty('fuckin.alpha', 1)
    end

    if curStep == 1602 then
        removeLuaSprite('fuckin', true)
        objectPlayAnimation('frickin', 'poop')
        setProperty('frickin.alpha', 1)
    end
end
