--behold my spaghetti code

function onCreate()
    
    makeAnimatedLuaSprite('enidbackgroundbop', 'enidbackgroundbop', 250,175)
    addAnimationByIndices('enidbackgroundbop', 'enidLeft', 'idle', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14', 24)
    addAnimationByIndices('enidbackgroundbop', 'enidRight', 'idle', '15,16,17,18,19,20,21,22,23,24,25,26,27,28', 24)
    addLuaSprite('enidbackgroundbop', 0, 0)

    makeAnimatedLuaSprite('kobackgroundbop', 'kobackgroundbop', 540,100)
    addAnimationByPrefix('kobackgroundbop', 'kobackgroundbop', 'idle', 24, false)
    addLuaSprite('kobackgroundbop', 0, 0)


    makeAnimatedLuaSprite('grabBeam', 'grabBeam', 0, 0);
    addAnimationByPrefix('grabBeam', 'grabBeam', 'anim', 14, true)
	addLuaSprite('grabBeam', true);
    setObjectCamera('grabBeam', 'camHUD', true)
    setProperty('grabBeam.alpha', 0)
    scaleObject('grabBeam', 0.9, 0.9)

    if middlescroll == false then
    midScrollFix = 717
    else
    midScrollFix = 400
    end
    makeAnimatedLuaSprite('flipBeam', 'flipBeam', midScrollFix, (Vertical and 570 or 50));
    addAnimationByPrefix('flipBeam', 'flipBeam', 'anim', 14, true)
	addLuaSprite('flipBeam', true);
    setObjectCamera('flipBeam', 'camHUD', true)
    setProperty('flipBeam.alpha', 0)
    scaleObject('flipBeam', 1.05, 1)
    if downscroll == true then --why using 'or' doesn't work, i have no clue
        setProperty('flipBeam.y', 570 - 20)
    else
        setProperty('flipBeam.y', 50 - 20)
    end


    if middlescroll == false then
    makeAnimatedLuaSprite('flipBeam2', 'flipBeam', 78, (Vertical and 570 or 50));
    addAnimationByPrefix('flipBeam2', 'flipBeam2', 'anim', 14, true)
	addLuaSprite('flipBeam2', true);
    setObjectCamera('flipBeam2', 'camHUD', true)
    setProperty('flipBeam2.alpha', 0)
    scaleObject('flipBeam2', 1.05, 1)
    if downscroll == true then --why using 'or' doesn't work, i have no clue
        setProperty('flipBeam2.y', 570 - 20)
    else
        setProperty('flipBeam2.y', 50 - 20)
    end
    end




end



function onUpdatePost(elapsed)
	-- Shit here by methewhenmethe#7219 this is to fix the wired visual issues with noteTweenDirection!
	noteCount = getProperty('notes.length')
	for i = 0, noteCount-1 do
		noteData = getPropertyFromGroup('notes', i, 'noteData')
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
            if (getPropertyFromGroup('notes', i, 'mustPress')) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'direction') - 90)
            else
				
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'direction') - 90)
            end	
		else
            if (noteData >= 4) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'angle'))
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'angle'))
            end	
		end
	end
	-- End of the fix

    
end

radchart = false
local enidDance = false
function onBeatHit()
    if curBeat % 2 == 0 then
    objectPlayAnimation('kobackgroundbop', 'kobackgroundbop', false)
    end

    if curBeat % 2 == 0 then
    if enidDance == false then
        objectPlayAnimation('enidbackgroundbop', 'enidLeft', false)
        enidDance = true
    else
        objectPlayAnimation('enidbackgroundbop', 'enidRight', false)
        enidDance = false
    end
    end
end

dontGrab = false
function onSectionHit()
    if radchart == false and curStep >= 640 and curStep <= 2143 then
    if mustHitSection == true and dontGrab == false then
        runTimer('flipFix', 0.1)
        dontGrab = true
    elseif mustHitSection == false and dontGrab == true then
        triggerEvent('release note')
        dontGrab = false
    end
    end

end

noteAngle = 0
grabBeamAngle = 1
function onUpdate()
    if grabbed == true then
        noteTweenAngle('speenGO' .. defaultStrum, grabbedNote, noteAngle, 1, 'linear')
        noteAngle = noteAngle + 5
    end

    if grabbed == false then
        cancelTween('speenGO' .. defaultStrum)
        noteTweenAngle('speenSTOP' .. defaultStrum, grabbedNote, 0, 0.01, 'linear')
        noteAngle = 0
    end
end

Vertical = not downscroll
grabbed = false
function onEvent(tag)
    if tag == 'Add Camera Zoom' then
        funnySection()
    end

    if tag == 'radchart' then
        radchart = true
        Vertical = not downscroll
        doTweenAlpha('flipBeamIn', 'flipBeam', 0.8, 0.5, 'linear')
        doTweenAlpha('flipBeam2In', 'flipBeam2', 0.8, 0.5, 'linear')
        triggerEvent('release note')
        playSound('radnoise', 0.4, 'radnoise')
        runTimer('flipFix2', 0.5)

    end

    if tag == 'radchart off' then
        radchart = false
        Vertical = downscroll
        flipChart()
        doTweenAlpha('flipBeamOut', 'flipBeam', 0, 0.5, 'linear')
        doTweenAlpha('flipBeam2Out', 'flipBeam2', 0, 0.5, 'linear')
        doTweenAngle('funnychartreset', 'camHUD', 0, 0.3, 'elasticOut')
    end

    if tag == 'grab note' then
        grabNotes()
        grabbed = true
    end

    if tag == 'release note' then
        releaseNotes()
        grabbed = false
        noteAngle = 0
    end


end

function funnySection()
    if (getProperty('camHUD.angle') == -3 or getProperty('camHUD.angle') == 0) and radchart == true then
        doTweenAngle('funnychart', 'camHUD', 3, 0.25, 'elasticOut')
    elseif radchart == true then
        doTweenAngle('funnychart2', 'camHUD', -3, 0.25, 'elasticOut')
    else doTweenAngle('funnychartreset', 'camHUD', 0, 0.3, 'elasticOut')
    end
end

function flipChart()
    --playSound('radnoise', 0.7, 'radnoise')
    cancelTween('releaseNoteY0')
    cancelTween('releaseNoteY1')
    cancelTween('releaseNoteY2')
    cancelTween('releaseNoteY3')


    for i = 0, 7 do
        
        

        doTweenAlpha('healthOut', 'healthBar', 0, 0.2, 'linear')
        --doTweenAlpha('timebarOut', 'timeBar', 0, 0.2, 'linear')
        doTweenAlpha('icon1Out', 'iconP1', 0, 0.2, 'linear')
        doTweenAlpha('icon2Out', 'iconP2', 0, 0.2, 'linear')
        --doTweenAlpha('timetextOut', 'timeTxt', 0, 0.2, 'linear')
        doTweenAlpha('botplayOut', 'botplayTxt', 0, 0.2, 'linear')

        



        noteTweenY('moveNoteY' .. i, i, (Vertical and 570 or 50), 0.6, 'quartInOut')
        doTweenY('flipBeamY', 'flipBeam', (Vertical and 570 or 50) - 20, 0.6, 'quartInOut')
        doTweenY('flipBeam2Y', 'flipBeam2', (Vertical and 570 or 50) - 20, 0.6, 'quartInOut')
        
                triggerEvent('Change Scroll Speed', 0.4, 0.3)
                runTimer('scrollTimer', 0.3)
    end
end

function onTimerCompleted(tag)
    if tag == 'scrollTimer' then
        triggerEvent('Change Scroll Speed', 1, 0.3)
        for i = 0, 7 do
            setProperty('healthBar.y', (Vertical and 83.2 or 644.8))
            --setProperty('timeBar.y', (Vertical and 688 or 31))
            setProperty('iconP1.y', getProperty('healthBar.y') - 75)
            setProperty('iconP2.y', getProperty('healthBar.y') - 75)
            --setProperty('timeTxt.y', getProperty('timeBar.y') - 12)
            setProperty('botplayTxt.y', (Vertical and 606 or 82))



        noteTweenDirection('scrollDir' .. i, i, (downscroll and (Vertical and 90 or -90) or (Vertical and -90 or 90)), 0.01, 'quartInOut')

            doTweenAlpha('healthIn', 'healthBar', 1, 0.2, 'linear')
            --doTweenAlpha('timebarIn', 'timeBar', 1, 0.2, 'linear')
            doTweenAlpha('icon1In', 'iconP1', 1, 0.2, 'linear')
            doTweenAlpha('icon2In', 'iconP2', 1, 0.2, 'linear')
            --doTweenAlpha('timetextIn', 'timeTxt', 1, 0.2, 'linear')
            doTweenAlpha('botplayIn', 'botplayTxt', 1, 0.2, 'linear')
        end
    end

    if tag == 'flipFix' and radchart == false then
        triggerEvent('grab note')
    end

    if tag == 'flipFix2' then
        flipChart()
    end

end


grabbedNote = 4
defaultStrum = 0
function grabNotes()

    grabbedNote = getRandomInt(4,7)
    dragY = getRandomInt(-75,-150)
    dragX = getRandomInt(-50,50)

    --setProperty('grabBeam.x', defaultPlayerStrumX0)
    
    doTweenAlpha('grabBeamAlphaIn', 'grabBeam', 0.9, 0.2, 'linear')
    
    playSound('radnoise', 0.3, 'radnoise')

    defaultStrum = grabbedNote - 4


    
    if downscroll == true then
        setProperty('grabBeam.y', defaultPlayerStrumY0 - 10)
        noteTweenY('grabNoteY' .. defaultStrum, grabbedNote, defaultPlayerStrumY0 + dragY, 1.2, 'cubeInOut')
            doTweenY('grabBeamTweenY', 'grabBeam', defaultPlayerStrumY0 + dragY - 10, 1.2, 'cubeInOut')
        if defaultStrum == 0 then
            noteTweenX('grabNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX0 + dragX, 1.2, 'cubeInOut')
                setProperty('grabBeam.x', defaultPlayerStrumX0 - 12)
                    doTweenX('grabBeamTween' .. defaultStrum, 'grabBeam', defaultPlayerStrumX0 + dragX - 12, 1.2, 'cubeInOut')
        elseif defaultStrum == 1 then
            noteTweenX('grabNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX1 + dragX, 1.2, 'cubeInOut') 
                setProperty('grabBeam.x', defaultPlayerStrumX1 - 12)
                    doTweenX('grabBeamTween' .. defaultStrum, 'grabBeam', defaultPlayerStrumX1 + dragX - 12, 1.2, 'cubeInOut')
        elseif defaultStrum == 2 then
            noteTweenX('grabNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX2 + dragX, 1.2, 'cubeInOut') 
                setProperty('grabBeam.x', defaultPlayerStrumX2 - 12)
                    doTweenX('grabBeamTween' .. defaultStrum, 'grabBeam', defaultPlayerStrumX2 + dragX - 12, 1.2, 'cubeInOut')
        elseif defaultStrum == 3 then
            noteTweenX('grabNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX3 + dragX, 1.2, 'cubeInOut') 
                setProperty('grabBeam.x', defaultPlayerStrumX3 - 12)
                    doTweenX('grabBeamTween' .. defaultStrum, 'grabBeam', defaultPlayerStrumX3 + dragX - 12, 1.2, 'cubeInOut')
        end
    else
        setProperty('grabBeam.y', defaultPlayerStrumY0 - 10)
        noteTweenY('grabNoteY' .. defaultStrum, grabbedNote, defaultPlayerStrumY0 + -dragY, 1.2, 'cubeInOut')
            doTweenY('grabBeamTweenY', 'grabBeam', defaultPlayerStrumY0 + -dragY - 10, 1.2, 'cubeInOut')
        if defaultStrum == 0 then
            noteTweenX('grabNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX0 + dragX, 1.2, 'cubeInOut')
                setProperty('grabBeam.x', defaultPlayerStrumX0 - 12)
                    doTweenX('grabBeamTween' .. defaultStrum, 'grabBeam', defaultPlayerStrumX0 + dragX - 12, 1.2, 'cubeInOut')
        elseif defaultStrum == 1 then
            noteTweenX('grabNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX1 + dragX, 1.2, 'cubeInOut') 
                setProperty('grabBeam.x', defaultPlayerStrumX1 - 12)
                    doTweenX('grabBeamTween' .. defaultStrum, 'grabBeam', defaultPlayerStrumX1 + dragX - 12, 1.2, 'cubeInOut')
        elseif defaultStrum == 2 then
            noteTweenX('grabNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX2 + dragX, 1.2, 'cubeInOut') 
                setProperty('grabBeam.x', defaultPlayerStrumX2 - 12)
                    doTweenX('grabBeamTween' .. defaultStrum, 'grabBeam', defaultPlayerStrumX2 + dragX - 12, 1.2, 'cubeInOut')
        elseif defaultStrum == 3 then
            noteTweenX('grabNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX3 + dragX, 1.2, 'cubeInOut') 
                setProperty('grabBeam.x', defaultPlayerStrumX3 - 12)
                    doTweenX('grabBeamTween' .. defaultStrum, 'grabBeam', defaultPlayerStrumX3 + dragX - 12, 1.2, 'cubeInOut')
        end
    end
end

function releaseNotes()
    noteTweenY('releaseNoteY' .. defaultStrum, grabbedNote, defaultPlayerStrumY0, 1, 'elasticOut')
    if defaultStrum == 0 then
        noteTweenX('releaseNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX0, 1, 'elasticOut')
    elseif defaultStrum == 1 then
        noteTweenX('releaseNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX1, 1, 'elasticOut') 
    elseif defaultStrum == 2 then
        noteTweenX('releaseNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX2, 1, 'elasticOut') 
    elseif defaultStrum == 3 then
        noteTweenX('releaseNoteX' .. defaultStrum, grabbedNote, defaultPlayerStrumX3, 1, 'elasticOut') 
    end
    
    doTweenAlpha('grabBeamAlphaOut', 'grabBeam', 0, 0.2, 'linear')
    
    noteAngle = 0
end


