function onCreate()
end

function onCreatePost()
    makeAnimatedLuaSprite('darrolcutscene', 'darrolcutscene', -1100,250)
    addAnimationByPrefix('darrolcutscene', 'darrolcutscene', 'darrolcutscene', 24, false)
    addLuaSprite('darrolcutscene', true)
    setProperty('darrolcutscene.alpha', 0.0001)

    makeLuaSprite('gradient', 'gradient', 0,0)
    setObjectCamera('gradient', 'hud')
    addLuaSprite('gradient', false)
    setProperty('gradient.alpha', 0)
    setProperty('gradient.y', 100)


    setObjectOrder('KO', 21)
    setObjectOrder('radup', 20)
    setObjectOrder('enid-stand', 22)
    setObjectOrder('boyfriendGroup', 23)
    setObjectOrder('Darell', 24)
    
end

function onSongStart()
    doTweenY('dadDown', 'dad', getProperty('dad.y') + 50, 1, 'sineInOut')
end

function onTweenCompleted(n)
    if n == 'dadDown' then
        doTweenY('dadUp', 'dad', getProperty('dad.y') - 50, 1, 'sineInOut')
    end

    if n == 'dadUp' then
        doTweenY('dadDown', 'dad', getProperty('dad.y') + 50, 1, 'sineInOut')
    end
end

function onBeatHit()
    setProperty('gradient.y', 0)
    doTweenY('gradientDown', 'gradient', 30, 0.3, 'sineOut')
end

function onStepHit()
    

    if curStep == 1247 then
        callScript('scripts/VideoSpriteHandler', 'makeVideoSprite', {'boxedinCutscene', 'boxedinCutscene', X, Y, 'camOther', true})
    end



 if curStep >= 1279 then
    setPropertyLuaSprite('KO', 'alpha', 1)
    setPropertyLuaSprite('radup', 'alpha', 1)
    setPropertyLuaSprite('enid-stand', 'alpha', 1)
    setProperty('boyfriend.x', 780)
    setProperty('boyfriend.y', 350)
 end

 if curStep == 1414 then
    doTweenX('darrellIn', 'darrolcutscene', -300, 0.6, 'sineOut')
 end

 if curStep == 2112 then
    doTweenColor('dadDark', 'dad', '1a1a1a', 0.01, 'linear')
    doTweenColor('BGDark', 'boxmoreBG', '1a1a1a', 0.01, 'linear')
    doTweenColor('BGdarrellDark', 'darrellBG', '1a1a1a', 0.01, 'linear')
    doTweenColor('gfDark', 'gf', '1a1a1a', 0.01, 'linear')

    doTweenColor('bfOrange', 'boyfriend', 'a3854e', 0.01, 'linear')
    doTweenColor('darrellOrange', 'Darell', 'a3854e', 0.01, 'linear')
    doTweenColor('KOOrange', 'KO', 'a3854e', 0.01, 'linear')
    doTweenColor('RadOrange', 'radup', 'a3854e', 0.01, 'linear')
    doTweenColor('enidOrange', 'enid-stand', 'a3854e', 0.01, 'linear')
    doTweenColor('gradientColor', 'gradient', 'ff6600', 0.01, 'linear')

 end

 if curStep == 2352 then
    doTweenColor('dadOrange', 'dad', 'a3854e', 0.2, 'linear')
 end
 
 if curStep == 2880 then
    setProperty('camGame.alpha', 0)
    setProperty('gradient.alpha', 0)
 end

end

allowReset = true
function onEvent(n)
    if n == 'Flash Camera White' or n == 'Flash Camera Intensity' then
        triggerEvent('Add Camera Zoom', 0.08, 0.09)
    end

    if n == 'Change Camera Zoom' then
        allowReset = false
        runTimer('allowReset', 0.1)
        debugPrint(allowReset)
    end
end



function onTimerCompleted(n)
    if n == 'allowReset' then
        allowReset = true
        debugPrint(allowReset)
    end
end

local healthColor1 = 'A1A1A1'
local healthColor2 = '0066CB'
function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'KO Notes' then
        healthColor2 = 'DB2729'
        runHaxeCode([[
            game.icon]] .. string.upper('P1') .. [[.changeIcon(']] .. 'ko' .. [[')
        ]]);    
    elseif noteType == 'Enid Notes' then
        healthColor2 = 'AA359E'
        runHaxeCode([[
            game.icon]] .. string.upper('P1') .. [[.changeIcon(']] .. 'enid' .. [[')
        ]]);    
    elseif noteType == 'Rad Notes' then
        healthColor2 = '25664E'
        runHaxeCode([[
            game.icon]] .. string.upper('P1') .. [[.changeIcon(']] .. 'rad' .. [[')
        ]]);    
    else
        healthColor2 = '0066CB'
        runHaxeCode([[
            game.icon]] .. string.upper('P1') .. [[.changeIcon(']] .. 'okkobf' .. [[')
        ]]);    
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    triggerEvent('Drain', -0.009)
    if noteType == 'Darrell Notes' or noteType == 'Darrell + Darrell Notes' then
        healthColor1 = 'E31613'
        runHaxeCode([[
            game.icon]] .. string.upper('P2') .. [[.changeIcon(']] .. 'darrell' .. [[')
        ]]);
    else
        healthColor1 = 'A1A1A1'
        runHaxeCode([[
            game.icon]] .. string.upper('P2') .. [[.changeIcon(']] .. 'boxman' .. [[')
        ]]);    
    end

    if noteType == 'Darrell + Darrell Notes' then
        triggerEvent('Object Animation', 'darrellBG', 'speak')
    end
end





function onUpdatePost()
    if curStep >= 991 then
    setHealthBarColors(healthColor1, healthColor2)
    end
end
