function onCreate()
    setProperty('camGame.zoom',1.1)
    makeLuaSprite('black','',0,0)
	makeGraphic('black',1280,1280,'000000')
	addLuaSprite('black',true)
    setScrollFactor('black',0,0)
    setObjectCamera('black','other')
    makeLuaSprite('hypeshit','hypeshit',0,0)
    setObjectCamera('hypeshit','hud')
    addLuaSprite('hypeshit',true)
    setBlendMode('hypeshit','multiply');
end

function onStartCountdown()
    runTimer('camOut',1.4)
end

function onTimerCompleted(tag,loops,loopsLeft)
    if tag == 'camOut' then
        doTweenZoom('www','camGame',0.65,6.0,'quadInOut')
        doTweenAlpha('blackfade','black',0,2.0,'quadInOut')
    end
end