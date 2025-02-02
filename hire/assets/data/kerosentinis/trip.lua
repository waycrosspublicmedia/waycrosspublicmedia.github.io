function onCreate()

    makeLuaSprite('trip1', 'mbrainstage/trip1', 0, 0)
    setObjectCamera('trip1', 'other')
    setProperty('trip1.alpha', 0)

    makeLuaSprite('trip2', 'mbrainstage/trip2', 0, 0)
    setObjectCamera('trip2', 'other')
    setProperty('trip2.alpha', 0)

    makeLuaSprite('trip3', 'mbrainstage/trip3', 0, 0)
    setObjectCamera('trip3', 'other')
    setProperty('trip3.alpha', 0)

    addLuaSprite('trip1', true)
    addLuaSprite('trip2', true)
    addLuaSprite('trip3', true)
end

function onStepHit()

    if curStep == 384 then
		doTweenAlpha('yaknow', 'trip1', 1, 2, 'linear')
    end
    if curStep == 430 then
		doTweenAlpha('yaknow2', 'trip2', 1, 2, 'linear')
    end
    if curStep == 470 then
	    doTweenAlpha('yaknow3', 'trip3', 1, 2, 'linear')
    end
    if curStep == 495 then
	    removeLuaSprite('trip1', true)
        removeLuaSprite('trip2', true)
    end
    if curStep == 504 then
        doTweenAlpha('yaknow4', 'trip3', 0, 2, 'linear')
    end
    if curStep == 525 then
	    removeLuaSprite('trip3', true)
    end
end