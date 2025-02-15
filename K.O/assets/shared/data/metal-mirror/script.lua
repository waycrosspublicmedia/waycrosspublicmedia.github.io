function onCreate()


    makeAnimatedLuaSprite('animelines', 'animelines', 0,0)
    addLuaSprite('animelines', true)
    addAnimationByPrefix('animelines', 'animelines', 'animelines', 24, true)
    setProperty('animelines.alpha', 0)
    setObjectCamera('animelines', 'hud')
    setObjectOrder('animelines', 2)

    setPropertyFromClass('GameOverSubstate', 'characterName', 'KO_MM');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'sonicDeath');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', '');
end

function onCreatePost()
    setProperty('healthBar.flipX', true)
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)

    --setObjectOrder('iconP2', getObjectOrder('iconP2')-1)

    bfX = getProperty('boyfriend.x')
    dadX = getProperty('dad.x')
    setProperty('boyfriend.x', dadX)
    setProperty('dad.x', bfX)

    setTextBorder('lyric', 3, '2b3ebb')

end

function onGameOverStart()

    setProperty('healthOverlay.alpha', 0)
    
    if swappedSonic then
        makeLuaSprite('sonicDies', 'characters/sonicDies', getProperty('Sonic.x') + 350, getProperty('Sonic.y'))
    else
        makeLuaSprite('sonicDies', 'characters/sonicDies', getProperty('Sonic.x') + 650, getProperty('Sonic.y'))
    end
    scaleObject('sonicDies', 1.1, 1.1)

    
    addLuaSprite('sonicDies', false)
    setProperty('sonicDies.alpha', 0)

    if sonicsHere == true then
        setProperty('sonicDies.alpha', 1)
    end


    doTweenY('deathKOup', 'boyfriend', getProperty('boyfriend.y') - 250, 0.4, 'sineOut')
    doTweenY('deathSONICup', 'sonicDies', getProperty('Sonic.y') - 250, 0.4, 'sineOut')
end

function onTweenCompleted(n)
    if n == 'deathKOup' then
        doTweenY('deathKOdown', 'boyfriend', getProperty('boyfriend.y') + 1000, 0.6, 'sineIn')
    end

    if n == 'deathSONICup' then
        doTweenY('deathSONICdown', 'sonicDies', getProperty('Sonic.y') + 1000, 0.7, 'sineIn')
    end

    if n == 'deathSONICdown' then
        restartSong(false)
    end
end


function onUpdate()
    if curStep > 905 then
        sonicsHere = true
    end
end


function onUpdatePost()

    setObjectOrder('darkBG', getObjectOrder('Metal Sonic') - 1)
    setObjectOrder('gfGroup', getObjectOrder('Metal Sonic') - 1)

    if getProperty('healthBar.percent') < 80 and getProperty('healthBar.percent') > 20 and curStep > 0 then
        shakeIntX = getRandomInt(-3,3)
    else
        shakeIntX = 0
    end


    if getProperty('healthBar.percent') > 80 then
        x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
        x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
        setProperty('iconP1.x', x2 + shakeIntX +10)
        setProperty('iconP2.x', x1 + shakeIntX +20)
    elseif getProperty('healthBar.percent') < 20 then
        x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
        x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
        setProperty('iconP1.x', x2 + shakeIntX -20)
        setProperty('iconP2.x', x1 + shakeIntX -10)
    else
        x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
        x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
        setProperty('iconP1.x', x2 + shakeIntX +5)
        setProperty('iconP2.x', x1 + shakeIntX -5)
    end


    setProperty('iconP2.angle', getProperty('health')*50 - 50)
    setProperty('iconP1.angle', getProperty('health')*50 - 50)

    if (getProperty('iconP1.angle') or getProperty('iconP2.angle')) > 15 then
        setProperty('iconP1.angle', 15)
        setProperty('iconP2.angle', 15)
    elseif (getProperty('iconP1.angle') or getProperty('iconP2.angle')) < -15 then
        setProperty('iconP1.angle', -15)
        setProperty('iconP2.angle', -15)
    end

    setObjectOrder('scoreTxt', getObjectOrder('iconP1')+10)
        

end



function onSongStart()
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then

        noteTweenX('playerStrums1', 4, defaultOpponentStrumX0, 1, 'backInOut')
        noteTweenX('playerStrums2', 5, defaultOpponentStrumX1, 1, 'backInOut')
        noteTweenX('playerStrums3', 6, defaultOpponentStrumX2, 1, 'backInOut')
        noteTweenX('playerStrums4', 7, defaultOpponentStrumX3, 1, 'backInOut')

        noteTweenX('opponentStrums1', 0, defaultPlayerStrumX0, 1, 'backInOut')
        noteTweenX('opponentStrums2', 1, defaultPlayerStrumX1, 1, 'backInOut')
        noteTweenX('opponentStrums3', 2, defaultPlayerStrumX2, 1, 'backInOut')
        noteTweenX('opponentStrums4', 3, defaultPlayerStrumX3, 1, 'backInOut')

    end
end

function onStepHit()

    if curStep == 904 then
        setProperty('Sonic.x', getProperty('Sonic.x') - 500)
        setProperty('Metal Sonic.x', getProperty('Metal Sonic.x') + 500)
    end

    if curStep == 905 then


        objectPlayAnimation('Metal Sonic', 'running', false)
        doTweenX('SonicIn', 'Sonic', getProperty('Sonic.x') + 450, 0.1, 'cubeOut')
        doTweenX('MetalIn', 'Metal Sonic', getProperty('Metal Sonic.x') - 450, 0.1, 'cubeOut')
    end

    if curStep >= 905 then
        setProperty('Sonic.alpha', 1)
        setProperty('Metal Sonic.alpha', 1)
    end

    if curBeat >= 234 then
        setTextBorder('lyric', 3, '00003b')
    end


    if curStep == 1344 then
        doTweenAlpha('animeIn', 'animelines', 0.5, 0.01, 'linear')
        doTweenColor('KODark', 'boyfriend', '444444', 0.1, 'linear')
        doTweenColor('K0Dark', 'dad', '444444', 0.1, 'linear')
        doTweenColor('gfDark', 'gf', '444444', 0.1, 'linear')
    elseif curStep == 1599 then
        doTweenAlpha('animeOut', 'animelines', 0, 0.25, 'linear')
        doTweenColor('KODark', 'boyfriend', 'ffffff', 0.25, 'linear')
        doTweenColor('K0Dark', 'dad', 'ffffff', 0.25, 'linear')
        doTweenColor('gfDark', 'gf', 'ffffff', 0.25, 'linear')
    end
end

colorSwappedSonic = false
function onBeatHit()
    if curBeat >= 404 and curBeat < 499 then
        triggerEvent('Add Camera Zoom')
        
        if not colorSwappedSonic then
            --setHealthBarColors('0039bc', '1b3ac8') --Sonic Colors (lol)
            colorSwappedSonic = true
        else
            --setHealthBarColors('1A1A71', 'D92B2D') --KO Colors
            colorSwappedSonic = false

    end


    end
end

swappedMetal = false
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    triggerEvent('Drain', -0.002)
    cameraShake('game', 0.001, 0.1)
    cameraShake('hud', 0.0005, 0.1)

    if noteType == 'Metal Notes' and swappedMetal == false then
        doTweenX('swapMetal', 'dad', getProperty('Metal Sonic.x'), 1, 'elasticOut')
        doTweenX('swapMK0', 'Metal Sonic', getProperty('dad.x'), 1, 'elasticOut')
        swappedMetal = true
    elseif noteType ~= 'Metal Notes' and swappedMetal == true then
        doTweenX('swapMetal', 'dad', getProperty('Metal Sonic.x'), 1, 'elasticOut')
        doTweenX('swapMK0', 'Metal Sonic', getProperty('dad.x'), 1, 'elasticOut')
        swappedMetal = false
    end
end

swappedSonic = false
function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Sonic Notes' and swappedSonic == false then
        doTweenX('swapSonic', 'boyfriend', getProperty('Sonic.x'), 1, 'elasticOut')
        doTweenX('swapKO', 'Sonic', getProperty('boyfriend.x'), 1, 'elasticOut')
        swappedSonic = true
    elseif noteType ~= 'Sonic Notes' and swappedSonic == true then
        doTweenX('swapSonic', 'boyfriend', getProperty('Sonic.x'), 1, 'elasticOut')
        doTweenX('swapKO', 'Sonic', getProperty('boyfriend.x'), 1, 'elasticOut')
        swappedSonic = false
    end
end