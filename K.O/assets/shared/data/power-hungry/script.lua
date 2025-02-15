function onCreate()


    setPropertyFromClass('ClientPrefs', 'middleScroll', false)

    makeLuaSprite('spookyvignette', 'spookyvignette', 0,0)
    addLuaSprite('spookyvignette', true)
    setProperty('spookyvignette.alpha', 1)
    setObjectCamera('spookyvignette', 'other')
    setObjectOrder('spookyvignette', 3)

    

    makeLuaSprite('titlecard', 'titlecards/titlecard' .. songName, 0, 0)
    setProperty('titlecard.alpha', 0)
    setObjectCamera('titlecard', 'hud')
    scaleObject('titlecard', 0.8,0.8)
    screenCenter('titlecard')
    setProperty('titlecard.y', getProperty('titlecard.y')+22)
    addLuaSprite('titlecard', true)

    setProperty('healthBar.alpha', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)

        for i = 0,3 do
            setPropertyFromGroup('playerStrums', i, 'alpha', 0)
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
        end


    

    setScrollFactor('dad', 1, 1)
    doTweenAlpha('enoirInvis', 'boyfriend', 0.3, 0.3, 'linear')



    iconDefaultY = getProperty('iconP2.y')

    makeLuaText("IT'S MY BIRTHDAY", "", 1000, 0, 0)
    addLuaText("IT'S MY BIRTHDAY")
    setTextFont("IT'S MY BIRTHDAY", 'COMICSANS.ttf')
    setTextSize("IT'S MY BIRTHDAY", 170)
    setTextColor("IT'S MY BIRTHDAY",'FF0000')
    setTextBorder("IT'S MY BIRTHDAY", 0,0)
    setTextAlignment("IT'S MY BIRTHDAY", 'center')
    setObjectCamera("IT'S MY BIRTHDAY", 'other')
    screenCenter("IT'S MY BIRTHDAY")

end

function onCreatePost()
setProperty('gf.alpha', 0)
setProperty('flashblack.alpha', 1)
setObjectOrder('flashwhite', getObjectOrder('letterbox')-1)


for i = 0,3 do
    setPropertyFromGroup('playerStrums', i, 'alpha', 0)
    setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
end

noteTweenX('playerStrums1', 4, 412, 0.01, 'linear')
noteTweenX('playerStrums2', 5, 524, 0.01, 'linear')
noteTweenX('playerStrums3', 6, 636, 0.01, 'linear')
noteTweenX('playerStrums4', 7, 748, 0.01, 'linear')


setObjectOrder('flashwhite', getObjectOrder('letterbox')-1)

end

function onSongStart()



end



function onUpdatePost()
    if getProperty('healthBar.percent') > 80 then
        setProperty('iconP2.x', getProperty('iconP2.x') + getRandomInt(-1,1))
        setProperty('iconP2.y', iconDefaultY + getRandomInt(-1,1))
    end


    if getProperty('health') <= 0 then
        
        loadSong('Power Hungry', 0)
    end

end


function onStepHit()



    if curStep == 64 then
        doTweenAlpha('titlecardIn', 'titlecard', 1, 2, 'sineIn')
    elseif curStep == 96 then
        doTweenAlpha('titlecardOut', 'titlecard', 0, 2, 'linear')
    elseif curStep == 120 then
        noteTweenAlpha('playerStrums1', 4, 1, 2, 'sineInOut')
        noteTweenAlpha('playerStrums2', 5, 1, 2, 'sineInOut')
        noteTweenAlpha('playerStrums3', 6, 1, 2, 'sineInOut')
        noteTweenAlpha('playerStrums4', 7, 1, 2, 'sineInOut')

        doTweenAlpha('healthBarIn','healthBar', 1,2,'sineInOut')
        doTweenAlpha('P1In','iconP1', 1,2,'sineInOut')
        doTweenAlpha('P2In','iconP2', 1,2,'sineInOut')
    elseif curStep == 1152 then
        noteTweenAlpha('playerStrums1', 4, 0, 1, 'sineOut')
        noteTweenAlpha('playerStrums2', 5, 0, 1, 'sineOut')
        noteTweenAlpha('playerStrums3', 6, 0, 1, 'sineOut')
        noteTweenAlpha('playerStrums4', 7, 0, 1, 'sineOut')

        doTweenAlpha('healthBarOut','healthBar', 0,1,'sineOut')
        doTweenAlpha('P1Out','iconP1', 0,1,'sineOut')
        doTweenAlpha('P2Out','iconP2', 0,1,'sineOut')
    elseif curStep == 1240 then
        noteTweenAlpha('playerStrums1', 4, 1, 0.3, 'linear')
        noteTweenAlpha('playerStrums2', 5, 1, 0.3, 'linear')
        noteTweenAlpha('playerStrums3', 6, 1, 0.3, 'linear')
        noteTweenAlpha('playerStrums4', 7, 1, 0.3, 'linear')
    elseif curStep == 2208 then
        noteTweenAlpha('playerStrums1', 4, 0, 2, 'linear')
        noteTweenAlpha('playerStrums2', 5, 0, 2, 'linear')
        noteTweenAlpha('playerStrums3', 6, 0, 2, 'linear')
        noteTweenAlpha('playerStrums4', 7, 0, 2, 'linear')

        doTweenAlpha('healthBarOut','healthBar', 0,1,'linear')
        doTweenAlpha('P1Out','iconP1', 0,2,'linear')
        doTweenAlpha('P2Out','iconP2', 0,2,'linear')

    end

    if curStep == 1152 then
        setTextString("IT'S MY BIRTHDAY", "IT'S")
        screenCenter("IT'S MY BIRTHDAY")
    elseif curStep == 1157 then
        setTextString("IT'S MY BIRTHDAY", "IT'S MY")
        screenCenter("IT'S MY BIRTHDAY")
    elseif curStep == 1162 then
        setTextString("IT'S MY BIRTHDAY", "IT'S MY BIRTH-")
        screenCenter("IT'S MY BIRTHDAY")
    elseif curStep == 1168 then
        setTextString("IT'S MY BIRTHDAY", "IT'S MY BIRTHDAY")
        screenCenter("IT'S MY BIRTHDAY")
        doTweenAlpha("bdayOut", "IT'S MY BIRTHDAY", 0, 1.5, 'linear')
    end


    if curStep % 2 == 0 then
        setTextColor("IT'S MY BIRTHDAY",'FF0000')
    else
        setTextColor("IT'S MY BIRTHDAY",'FF3333')
    end












end

function onEvent(n)
    if n == 'Add Camera Zoom' then
        setProperty('redBG.alpha', 0.5)
        doTweenAlpha('redOut', 'redBG', 0.001, 0.9, 'sineOut')

        if getProperty('healthBar.percent') >= 20 then
            triggerEvent('Drain', 0.08)
        end
        
        for i = 0,3 do
            setPropertyFromGroup('playerStrums', i, 'alpha', 0.2)
        end

        noteTweenAlpha('playerStrums1', 4, 1, 0.9, 'linear')
        noteTweenAlpha('playerStrums2', 5, 1, 0.9, 'linear')
        noteTweenAlpha('playerStrums3', 6, 1, 0.9, 'linear')
        noteTweenAlpha('playerStrums4', 7, 1, 0.9, 'linear')


    end


end



aeAmount = 0
function onSectionHit()
    if curSection >= 2 then
    if mustHitSection == true then
        setProperty('defaultCamZoom', 0.7)
        doTweenAlpha('enoirAppear', 'boyfriend', 1, 0.2, 'backInOut')
        doTweenY('enoirUp', 'boyfriend', 170, 1, 'backInOut')
    elseif mustHitSection == false then
        if curStep >= 1183 and curStep < 1567 then
            setProperty('defaultCamZoom', 1.2)
        elseif curStep >= 1567 then
            setProperty('defaultCamZoom', 0.85)
        else
            setProperty('defaultCamZoom', 1)
        end
        doTweenAlpha('enoirInvis', 'boyfriend', 0.2, 0.2, 'backInOut')
        doTweenY('enoirDown', 'boyfriend', 500, 1, 'backInOut')
    end
    end
end


function onBeatHit()


end


function goodNoteHit(id, direction, noteType, isSustainNote)
    doTweenColor('missColor', 'boyfriendGroup', 'ffffff', 0.01, 'linear')

end

gfAlpha = 0.35
noteTable = {'left', 'down', 'up', 'right'}
noteCounter = 0
function opponentNoteHit(id, direction, noteType, isSustainNote)


    if curStep >= 1213 and curStep < 1952 then
        cameraShake('game', 0.002, 0.2)
        cameraShake('hud', 0.0015, 0.2)
    else
	    cameraShake('game', 0.001, 0.2)
	    cameraShake('hud', 0.0005, 0.2)
    end

    if curStep >= 1952 then
        gfAlpha = 0.15
    end 
    if curStep >= 1439 then
        playAnim('gf', getProperty('singAnimations')[direction +1], true)
        setProperty('gf.alpha', gfAlpha)
        setProperty('radBG.alpha', 0.04)
        doTweenAlpha('radBGfade', 'radBG', 0, 0.5, 'linear')
        doTweenAlpha('radFade', 'gf', 0, 0.5, 'linear')
    end


    if not isSustainNote then
        makeAnimatedLuaSprite('newnote' .. noteCounter, 'KO_NOTESKIN', getRandomInt(0, 1180), getRandomInt(0, 620));
        addAnimationByPrefix('newnote' .. noteCounter, 'stuff', noteTable[getRandomInt(0,3)] .. ' press', 0, false);
        setObjectCamera('newnote' .. noteCounter, 'game')
        setScrollFactor('newnote' .. noteCounter, 0,0)
        setObjectOrder('newnote' .. noteCounter, getObjectOrder('gfGroup')-1)
        addLuaSprite('newnote' .. noteCounter, false)
        setProperty('newnote' .. noteCounter .. '.alpha', 0.2)
        setProperty('newnote' .. noteCounter .. '.angle', getRandomInt(0,360))
        noteScale = getRandomInt(10,20)/10
        scaleObject('newnote' .. noteCounter, noteScale, noteScale)
        doTweenX('newnoteX' .. noteCounter, 'newnote' .. noteCounter .. '.scale', 4, 1, 'sineIn')
        doTweenY('newnoteY' .. noteCounter, 'newnote' .. noteCounter .. '.scale', 4, 1, 'sineIn')
        doTweenAlpha('newnoteAlpha' .. noteCounter, 'newnote' .. noteCounter, 0, 0.3, 'linear')
        doTweenAngle('newnoteAngle' .. noteCounter, 'newnote' .. noteCounter, getRandomInt(-100,100), 3, 'linear')
        noteCounter = noteCounter + 1
    end
    

end

function noteMiss(id, direction, noteType, isSustainNote)
	doTweenColor('missColor', 'boyfriendGroup', '777777', 0.01, 'linear')

	cancelTimer('Misstimer')
	runTimer('Misstimer', 0.375, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'Misstimer' then
		doTweenColor('missColor', 'boyfriendGroup', 'ffffff', 0.01, 'linear')
	end


end



function onTweenCompleted(n)
    for i = 0, noteCounter do
        if n == 'newnoteAngle' .. i then
            removeLuaSprite('newnote' .. i, true)
        end
    end
end



function onGameOver()
    return Function_Stop
end