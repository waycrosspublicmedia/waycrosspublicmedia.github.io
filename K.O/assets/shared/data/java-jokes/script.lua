function onCreate()
	makeLuaSprite('fadeBLACK', '', 0, 0);
	makeGraphic('fadeBLACK',screenWidth*1.5,screenHeight*1.5,'000000')
    precacheImage('fadeBLACK')
    setObjectCamera('fadeBLACK', 'other')
	setProperty('fadeBLACK.alpha',1)
	setObjectOrder('fadeBLACK', 2.5)
end

function onCreatePost()
    setObjectOrder('darkBG', getObjectOrder('gfGroup') - 1)
    setObjectOrder('flashwhite', getObjectOrder('letterbox')-1)

end


joke = false
function onEvent(n)
    if n == 'Drain' then
        cameraShake('hud', 0.004, 0.12)
        cameraShake('game', 0.004, 0.12)
        triggerEvent('Werds Tween Zoom', getProperty('defaultCamZoom') + 0.1, "0.5, backOut")
        joke = true
    
        
    end
end

function onSectionHit()
    if joke == true then
        triggerEvent('Werds Tween Zoom', getProperty('defaultCamZoom') - 0.1, "0.5, backOut")
        joke = false
    end

end

function onStepHit()

    if curStep == 1 then
        setProperty('healthBar.alpha', 0)
        setProperty('healthOverlay.alpha', 0)
        for i = 0,3 do
            setPropertyFromGroup('playerStrums', i, 'alpha', 0)
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
        end
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
    end
        

    if curStep == 128 then
        doTweenAlpha('healthBar', 'healthBar', 1, 0.5, 'linear')
        doTweenAlpha('healthOverlay', 'healthOverlay', 1, 0.5, 'linear')
        doTweenAlpha('iconP1', 'iconP1', 1, 0.5, 'linear')
        doTweenAlpha('iconP2', 'iconP2', 1, 0.5, 'linear')

        noteTweenAlpha('opponentStrums1', 0, 1, 0.5, 'linear')
        noteTweenAlpha('opponentStrums2', 1, 1, 0.5, 'linear')
        noteTweenAlpha('opponentStrums3', 2, 1, 0.5, 'linear')
        noteTweenAlpha('opponentStrums4', 3, 1, 0.5, 'sineInOut')

        noteTweenAlpha('playerStrums1', 4, 1, 0.5, 'linear')
        noteTweenAlpha('playerStrums2', 5, 1, 0.5, 'linear')
        noteTweenAlpha('playerStrums3', 6, 1, 0.5, 'linear')
        noteTweenAlpha('playerStrums4', 7, 1, 0.5, 'linear')

    end
end

function onBeatHit()
    if curBeat >= 232 and curBeat <= 296 then
        triggerEvent('Add Camera Zoom', 0, 0.05)

    end

    if curBeat == 296 then
        doTweenAlpha('byevignette', 'vignette', 0, 2, 'linear')
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)

end

function onTweenCompleted(tag)

end