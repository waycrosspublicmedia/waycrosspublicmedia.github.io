
function onCreatePost() 
    makeLuaSprite('black','',0,0)
    makeGraphic('black',1280,720,'000000')
    setScrollFactor('black',0,0)
    addLuaSprite('black',true)
    setObjectCamera('black','other')
    setProperty('black.alpha',0.00001)

    precacheImage('krabs clip');
end

function onGameOver()
    return Function_Stop
end

function onUpdate(elapsed)
    if getHealth() <= 0.0001 then
        openCustomSubstate('gamerrrr',true)
    end
end

function onCustomSubstateCreatePost(n)
    if n == 'gamerrrr' then
        runTimer('deathTimer', 2.55)
        --playSound('goofup_clip', 0.9)
        startVideo('krabs clip');
    end
end

function onCustomSubstateUpdate(n,elapsed)
    if n == 'gamerrrr' then
    end
end

rset = false
function onCustomSubstateUpdatePost(n,elapsed)
    if n == 'gamerrrr' then
    end
end

function onTimerCompleted(tag)
    if tag == 'deathTimer' then
        setProperty('black.alpha', 1)
        runTimer('downTime', 0.5)
    end

    if tag == 'downTime' then
        restartSong(false)
    end
 end