function onCreate()
    setProperty('boyfriend.x', 900)
    setProperty('boyfriend.y', 260)
    setProperty('gf.x', getProperty('gf.x')+100)
    setProperty('dad.angle', 3)
    

    setProperty('defaultCamZoom', 0.9)


    makeLuaSprite('letterbox', 'letterbox', 0,0)
    addLuaSprite('letterbox', true)
    setProperty('letterbox.alpha', 0)
    setObjectCamera('letterbox', 'hud')
    setObjectOrder('letterbox', 4)

    makeLuaSprite('vignette', 'vignette', 0,0)
    addLuaSprite('vignette', true)
    setProperty('vignette.alpha', 0)
    setObjectCamera('vignette', 'hud')
    setObjectOrder('vignette', 3)

    makeLuaSprite('fireballGradient', 'fireballGradient', 0, 0);
	addLuaSprite('fireballGradient', true)
    setScrollFactor('fireballGradient', 0,0)
    setProperty('fireballGradient.scale.x', 1.5)
    setProperty('fireballGradient.scale.y', 1.5)
    setBlendMode('fireballGradient', 'multiply')
    setProperty('fireballGradient.alpha', 0.001)

	makeLuaSprite('trapBlend', '', 0, 0);
	makeGraphic('trapBlend',screenWidth*1.5,screenHeight*1.5,'FFFFFF')
	  addLuaSprite('trapBlend', true);
      setObjectCamera('trapBlend', 'hud')
      setObjectOrder('trapBlend', 2.9)
	  setProperty('trapBlend.alpha',0)
      setBlendMode('trapBlend', 'multiply')
      
      

    makeAnimatedLuaSprite('animelines', 'animelines', 0,0)
    addLuaSprite('animelines', true)
    addAnimationByPrefix('animelines', 'animelines', 'animelines', 24, true)
    setProperty('animelines.alpha', 0)
    setObjectCamera('animelines', 'hud')
    setObjectOrder('animelines', 2)

    

end

function onCreatePost()
    makeLuaSprite('fireballDESK', 'fireballDESK', -700,-275)
    addLuaSprite('fireballDESK', 0, 0)
    setProperty('fireballDESK.alpha', 0.001)
    setObjectOrder('dadGroup', getObjectOrder('bodegaDESK')-1)
    

end


function onSongStart()


end

function onUpdate()

end





modChart = false
function onStepHit()
    if curStep == 1142 then
        playSound('fireball', 1)
    end

    if curStep == 1152 then                                             
        doTweenColor('vignettecolor', 'vignette', '0x77AA359E', 0.2, 'linear')--v Trap events
        setProperty('fireballGradient.alpha', 1)
        setProperty('dad.y', getProperty('dad.y')-6)
        setProperty('bodegaDESK.alpha', 0)
        setProperty('fireballDESK.alpha', 1)
        setObjectOrder('dadGroup', getObjectOrder('fireballDESK')+1)
        modChart = true
    end

    if curStep == 1376 then
        modChart = false
    end

    if curStep == 1407 then
        modChart = true
    end

    if curStep == 1648 then
        modChart = false
    end

    if curStep == 1664 then
        doTweenAlpha('vignetteALPHA', 'vignette', 0, 0.1, 'linear')
    end

    if (curStep >= 1152 and curStep <= 1370) or (curStep >= 1407 and curStep <= 1918) then
        if mustHitSection == false then
            doTweenColor('vignettecolor', 'vignette', '0x77AA359E', 0.2, 'linear')
        else
            doTweenColor('vignettecolor2', 'vignette', '0x770066CB', 0.2, 'linear')
        end
    end                                                                 --^ Trap events

    if curStep >= 1664 and curStep <= 1919 then                         --v Anime event
    cameraShake('game', 0.003, 0.1)
    end



    if curStep == 1664 then

        setProperty('animelines.alpha', 0.2)
        doTweenAlpha('letterboxin', 'letterbox', 1, 0.2)
        removeLuaSprite('vignette',false)
    end
    if curStep == 1919 then
        doTweenAlpha('letterboxout', 'letterbox', 0, 0.2)
        setProperty('animelines.alpha', 0)
        doTweenAlpha('vignetteALPHA2', 'vignette', 0, 0.2, 'linear')
        
    end                                                                 --^ Anime event







end


function onBeatHit()
    if modChart == true then
	if curBeat % 4 == 1 then
		for i = 0,7 do
            if i % 2 == 0 then
			setPropertyFromGroup('strumLineNotes', i, 'scale.x', 1.1)
			setPropertyFromGroup('strumLineNotes', i, 'scale.y', 1.1)
			doTweenX('noteXScaleReturn1'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 0.6, 'sineOut')
            doTweenY('noteYScaleReturn1'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 0.6, 'sineOut')

            setPropertyFromGroup('strumLineNotes', i, 'angle', -25)
			noteTweenAngle('noteSpin1'..i, i, 0, 0.6, 'backOut')
            end
            if i % 2 ~= 0 then
                setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.6)
                setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.6)
                doTweenX('noteXScaleReturn2'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 0.6, 'sineOut')
                doTweenY('noteYScaleReturn2'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 0.6, 'sineOut')
    
                setPropertyFromGroup('strumLineNotes', i, 'angle', 25)
                noteTweenAngle('noteSpin2'..i, i, 0, 0.6, 'backOut')
            end
		end
	elseif curBeat % 4 == 3 then
		for i = 0,7 do
            if i % 2 ~= 0 then
			setPropertyFromGroup('strumLineNotes', i, 'scale.x', 1.1)
			setPropertyFromGroup('strumLineNotes', i, 'scale.y', 1.1)
			doTweenX('noteXScaleBack'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 0.6, 'sineOut')
            doTweenY('noteYScaleBack'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 0.6, 'sineOut')

            setPropertyFromGroup('strumLineNotes', i, 'angle', -25)
			noteTweenAngle('noteSpin2'..i, i, 0, 0.6, 'backOut')
            end

            if i % 2 == 0 then
                setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.6)
                setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.6)
                doTweenX('noteXScaleReturn2'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 0.6, 'sineOut')
                doTweenY('noteYScaleReturn2'..i, 'strumLineNotes.members['..i..'].scale', 0.7, 0.6, 'sineOut')
    
                setPropertyFromGroup('strumLineNotes', i, 'angle', 25)
                noteTweenAngle('noteSpin2'..i, i, 0, 0.6, 'backOut')
            end
		end
	end
end



end


