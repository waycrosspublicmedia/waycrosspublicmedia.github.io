function onCreate()
    makeLuaSprite('boxmoreBG', 'boxmoreBG', -700,-555)
    addLuaSprite('boxmoreBG', 0, 0)
    scaleObject('boxmoreBG', 1.1,1.1)

    makeAnimatedLuaSprite('darrellBG', 'darrol-boxed-in-bg', 300,-1495)
    addAnimationByPrefix('darrellBG', 'idle', 'idle', 24, false)
    addAnimationByPrefix('darrellBG', 'blinking_idle', 'blinking_idle', 24, false)
    addAnimationByPrefix('darrellBG', 'speak', 'normalspeak', 24, false)
    addAnimationByPrefix('darrellBG', 'worriedspeak', 'leftworried', 24, false)
    addAnimationByPrefix('darrellBG', 'worriedleft', 'worried', 24, false)
    addAnimationByPrefix('darrellBG', 'firsttease', 'firsttease', 24, false)
    addAnimationByPrefix('darrellBG', 'secondtease', 'secondtease', 24, false)
    addLuaSprite('darrellBG', 0, 0)

    makeAnimatedLuaSprite('boxmoreLAVA', 'boxmoreLAVA', -700,-275)
    addAnimationByPrefix('boxmoreLAVA', 'boxmoreLAVA', 'anim', 14, true)
    addLuaSprite('boxmoreLAVA', 0, 0)
    scaleObject('boxmoreLAVA', 1.1,1.1)




end

function onCreatePost()
    setProperty('gf.origin.y', 0)

end



local gfSwing = false
local allowBGBOP = true
function onBeatHit()

    if getProperty('gf.animation.frameName') == 'danceleft0000' then
        cancelTween('gfLeft')
        cancelTween('gfRight')
        doTweenAngle('gfLeft', 'gf', 1, 0.66, 'sineOut')
    elseif getProperty('gf.animation.frameName') == 'danceright0000' then
        cancelTween('gfLeft')
        cancelTween('gfRight')
        doTweenAngle('gfRight', 'gf', -1, 0.66, 'sineOut')
    end

    
        -- if gfSwing == false then
        --     doTweenAngle('gfLeft', 'gf', 1, 0.22, 'sineInOut')
        --     gfSwing = true
        -- else
        --     doTweenAngle('gfRight', 'gf', -1, 0.22, 'sineInOut')
        --     gfSwing = false
        -- end

        if curBeat % 8 == 0 and allowBGBOP == true then
            objectPlayAnimation('darrellBG', 'blinking_idle', true)
        elseif curBeat % 2 == 0 and allowBGBOP == true then
           
            objectPlayAnimation('darrellBG', 'idle', true)

        end
end 

function onEvent(n,v1,v2)
    if n == 'Object Animation' then
        allowBGBOP = false
        if v2 == 'firsttease' or v2 == 'secondtease' then
            runTimer('bopTimer', 0.5)
        else
            runTimer('bopTimer', 1.3)
        end
    end
end

function onTimerCompleted(n)
    if n == 'bopTimer' then
        objectPlayAnimation('darrellBG', 'blinking_idle', true)
        allowBGBOP = true
    end
end