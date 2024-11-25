function onCreate()

makeLuaSprite('base','puma/base',-200, -320)
addLuaSprite('base',false)
scaleObject('base',0.8,0.72)
setLuaSpriteScrollFactor('base',0.96,1)

if not lowQuality then
    makeAnimatedLuaSprite('ghosts','puma/ghosts',-200, -320)
    addAnimationByPrefix('ghosts','scare1','ghostone',24,false)
    addAnimationByPrefix('ghosts','scare2','ghosttwo',24,false)
    addAnimationByPrefix('ghosts','scare3','ghostthree',24,false)
    addAnimationByPrefix('ghosts','scare4','ghostfour',24,false)
    addAnimationByPrefix('ghosts','scare5','ghostfive',24,false)
    addAnimationByPrefix('ghosts','scare6','ghostsix',24,false)
    addLuaSprite('ghosts',false)
    doTweenAlpha('ghosthide', 'ghosts', 0.0, 0.01, 'circInOut')
    scaleObject('ghosts',0.8,0.72)
    setLuaSpriteScrollFactor('ghosts',0.96,1) 
end

makeLuaSprite('stairs','puma/stairs',-200, -320)
addLuaSprite('stairs',false)
scaleObject('stairs',0.8,0.72)
setLuaSpriteScrollFactor('stairs',0.96,1)

makeAnimatedLuaSprite('ctas','puma/ctas',-200, -332)
addAnimationByPrefix('ctas','bounce','ctas idle',24,false)
addLuaSprite('ctas',false)
scaleObject('ctas',0.8,0.72)
setLuaSpriteScrollFactor('ctas',0.96,1)

makeLuaSprite('rail1','puma/rail1',-200, -320)
addLuaSprite('rail1',false)
scaleObject('rail1',0.8,0.72)
setLuaSpriteScrollFactor('rail1',0.96,1)

if not lowQuality then
    makeLuaSprite('stars','puma/stars',-200, -320)
    addLuaSprite('stars',false)
    scaleObject('stars',0.8,0.72)
    setLuaSpriteScrollFactor('stars',0.96,1)
end

makeLuaSprite('rail2','puma/rail2',-200, -320)
addLuaSprite('rail2',true)
scaleObject('rail2',0.8,0.72)
setLuaSpriteScrollFactor('rail2',0.96,1)

doTweenAlpha('NoBitches','gfGroup',0,0.01,'linear')

if songName == 'Boo' then
    removeLuaSprite('ctas',true)

    makeAnimatedLuaSprite('cta1','puma/chumbly',100,140)
    addAnimationByPrefix('cta1','jump','chumbly jump',24,false)
    addLuaSprite('cta1',false)
    setObjectCamera('cta1','hud')
    makeAnimatedLuaSprite('cta2','puma/katanatr',300,120)
    addAnimationByPrefix('cta2','jump','katanatr jump',24,false)
    addLuaSprite('cta2',false)
    setObjectCamera('cta2','hud')
    makeAnimatedLuaSprite('cta3','puma/oreo',800,-300)
    addAnimationByPrefix('cta3','jump','oreo fall',30,false)
    addLuaSprite('cta3',false)
    setObjectCamera('cta3','hud')
    makeAnimatedLuaSprite('cta4','puma/sploinka',-380,100)
    addAnimationByPrefix('cta4','jump','sploinka fly',24,false)
    addLuaSprite('cta4',false)
    setObjectCamera('cta4','hud')
    makeAnimatedLuaSprite('cta5','puma/tvvt',-400,-140)
    addAnimationByPrefix('cta5','jump','tvvt fly',24,false)
    addLuaSprite('cta5',false)
    setObjectCamera('cta5','hud')
    makeAnimatedLuaSprite('ctasign','puma/sploinky',900,440)
    addAnimationByPrefix('ctasign','appear','sploinky bop',24,false)
    addAnimationByPrefix('ctasign','sign','sploinky sign',24,false)
    addLuaSprite('ctasign',false)
    setObjectCamera('ctasign','hud')

    doTweenAlpha('cta1hide','cta1',0,0.01,'linear')
    doTweenAlpha('cta2hide','cta2',0,0.01,'linear')
    doTweenAlpha('cta3hide','cta3',0,0.01,'linear')
    doTweenAlpha('cta4hide','cta4',0,0.01,'linear')
    doTweenAlpha('cta5hide','cta5',0,0.01,'linear')
    doTweenAlpha('ctasignhide','ctasign',0,0.01,'linear')
end

end

local ghost = 6;
function onBeatHit()
    playAnim('ctas','bounce',true)

    if not lowQuality then
        if curBeat % 16 == 6 then
            if ghost == 6 then
                doTweenAlpha('boo', 'ghosts', 1, 0.01, 'circInOut')
                playAnim('ghosts','scare1',true)
                doTweenAlpha('ghosttween', 'ghosts', 0.0, 1.2, 'circInOut')
                ghost = 1; 
            elseif ghost == 1 then
                doTweenAlpha('boo', 'ghosts', 1, 0.01, 'circInOut')
                playAnim('ghosts','scare2',true)
                doTweenAlpha('ghosttween', 'ghosts', 0.0, 1.2, 'circInOut')
                ghost = 2;
            elseif ghost == 2 then
                doTweenAlpha('boo', 'ghosts', 1, 0.01, 'circInOut')
                playAnim('ghosts','scare3',true)
                doTweenAlpha('ghosttween', 'ghosts', 0.0, 1.2, 'circInOut')
                ghost = 3;
            elseif ghost == 3 then
                doTweenAlpha('boo', 'ghosts', 1, 0.01, 'circInOut')
                playAnim('ghosts','scare4',true)
                doTweenAlpha('ghosttween', 'ghosts', 0.0, 1.2, 'circInOut')
                ghost = 4;
            elseif ghost == 4 then
                doTweenAlpha('boo', 'ghosts', 1, 0.01, 'circInOut')
                playAnim('ghosts','scare5',true)
                doTweenAlpha('ghosttween', 'ghosts', 0.0, 1.2, 'circInOut')
                ghost = 5;
            elseif ghost == 5 then
                doTweenAlpha('boo', 'ghosts', 1, 0.01, 'circInOut')
                playAnim('ghosts','scare6',true)
                doTweenAlpha('ghosttween', 'ghosts', 0.0, 1.2, 'circInOut')
                ghost = 6;
            end
        end
    end
end

function onUpdate()

    if songName == 'Boo' then
    	fx= fx+0.02;
    	fy= fy+0.02;
    	xx = getProperty('dad.x')
    	yy = getProperty('dad.y')

    	setProperty('dad.y',yy+math.sin(fy)*0.8)
    	setProperty('dad.x',xx+math.cos(fx)*0.8)
    end

    if getProperty('cta1.animation.curAnim.finished') then
        doTweenAlpha('cta1hide','cta1',0,0.01,'linear')
    end
    if getProperty('cta2.animation.curAnim.finished') then
        doTweenAlpha('cta2hide','cta2',0,0.01,'linear')
    end
    if getProperty('cta3.animation.curAnim.finished') then
    doTweenAlpha('cta3hide','cta3',0,0.01,'linear') 
    end
    if getProperty('cta4.animation.curAnim.finished') then
        doTweenAlpha('cta4hide','cta4',0,0.01,'linear')
    end
    if getProperty('cta5.animation.curAnim.finished') then
        doTweenAlpha('cta5hide','cta5',0,0.01,'linear')
    end

end

function onEvent(n,v1,v2)
    if n == 'eventTrigger' then
        if v1 == 'cta1' then
            playAnim('cta1','jump',true)
            doTweenAlpha('cta1show','cta1',1,0.01,'linear')
        end
        if v1 == 'cta2' then
            playAnim('cta2','jump',true)
            doTweenAlpha('cta2show','cta2',1,0.01,'linear')
        end
        if v1 == 'cta3' then
            playAnim('cta3','jump',true)
            doTweenAlpha('cta3show','cta3',1,0.01,'linear')
        end
        if v1 == 'cta4' then
            playAnim('cta4','jump',true)
            doTweenAlpha('cta4show','cta4',1,0.01,'linear')
        end
        if v1 == 'cta5' then
            playAnim('cta5','jump',true)
            doTweenAlpha('cta5show','cta5',1,0.01,'linear')
        end
        if v1 == 'ctasign' then
            playAnim('ctasign','appear',true)
            doTweenAlpha('ctasignshow','ctasign',1,0.01,'linear')
            runTimer('signshow',0.5)
        end
    end
end

function onTimerCompleted(tag,loops,loopsLeft)
    if tag == 'signshow' then
        playAnim('ctasign','sign',true)
        setProperty('ctasign.offset.y',26);
        setProperty('ctasign.offset.x',370);
        runTimer('signhide',2.1)
    end
    if tag == 'signhide' then
        doTweenAlpha('ctasignhide','ctasign',0,0.01,'linear')
    end
end