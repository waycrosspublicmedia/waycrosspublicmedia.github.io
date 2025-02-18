function onCreate()
    makeLuaSprite('shadow1','shadow',135,610)
    addLuaSprite('shadow1', false)
    scaleObject('shadow1', 0.45, 0.4)
    setProperty('shadow1.alpha', 0.5)

    makeLuaSprite('shadow2','shadow',905,640)
    addLuaSprite('shadow2', false)
    scaleObject('shadow2', 0.35, 0.35)
    setProperty('shadow2.alpha', 0.5)


    

end

function onCreatePost()
    setObjectOrder('darkBG', getObjectOrder('gfGroup') - 1)
end

function onSongStart()

end

doBoyFade = false
function onEvent(n)
    if n == 'darkBG' and doBoyFade == false then
        doTweenColor('boyfriendDarkIn', 'boyfriend', '363636', 1, 'linear')
        doTweenColor('gfDarkIn', 'gfKO', '363636', 1, 'linear')
        doBoyFade = true
        setHealthBarColors('CC1450', '675761')
    elseif n == 'darkBG' and doBoyFade == true then
        doTweenColor('boyfriendDarkOut', 'boyfriend', 'ffffff', 0.1, 'linear')
        doTweenColor('gfDarkOut', 'gfKO', 'ffffff', 0.1, 'linear')
        doBoyFade = false
        setHealthBarColors('CC1450', '0066CB')
    end
end

function onSectionHit()

end




function onBeatHit()
    if getProperty('gf.animation.curAnim.name') == 'danceLeft' then
        triggerEvent('Add Camera Zoom', 0.02, 0.02)
    end
end

function onUpdatePost()

end


function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'GF Sing' or gfSection == true then
        triggerEvent('Add Camera Zoom', 0.02, 0.02)
        doTweenX('gfScaleTweenX1', 'gf.scale', 1.23, 0.02, 'sine')
        doTweenY('gfScaleTweenY1', 'gf.scale', 1.23, 0.02, 'sine')
    end







end

function onTweenCompleted(tag)
    if tag == 'gfScaleTweenX1' then
        doTweenX('gfScaleTweenX2', 'gf.scale', 1.2, 0.02, 'sine')
        doTweenY('gfScaleTweenY2', 'gf.scale', 1.2, 0.02, 'sine')
    end
end