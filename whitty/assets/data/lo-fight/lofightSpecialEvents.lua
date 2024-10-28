function onCreate()
    setProperty('healthBar.alpha', 0);
    setProperty('iconP1.alpha', 0);
    setProperty('iconP2.alpha', 0);
    setProperty('scoreTxt.alpha', 0);
    setProperty('timeBar.alpha', 0);
    setProperty('timeTxt.alpha', 0);

    makeLuaSprite('Fade', '', -500, -500);
        makeGraphic('Fade', 3000, 3000, '000000')
        addLuaSprite('Fade', true)
        setProperty('Fade.alpha', 0);

        noteTweenAlpha('noteop1', 0, 0, 0.001, 'smootherStepOut')
        noteTweenAlpha('noteop2', 1, 0, 0.001, 'smootherStepOut')
        noteTweenAlpha('noteop3', 2, 0, 0.001, 'smootherStepOut')
        noteTweenAlpha('noteop4', 3, 0, 0.001, 'smootherStepOut')
        noteTweenAlpha('notepl1', 4, 0, 0.001, 'smootherStepOut')
        noteTweenAlpha('notepl2', 5, 0, 0.001, 'smootherStepOut')
        noteTweenAlpha('notepl3', 6, 0, 0.001, 'smootherStepOut')
        noteTweenAlpha('notepl4', 7, 0, 0.001, 'smootherStepOut')
    end
    function onStepHit()
        if curStep == 23 then 
            noteTweenAlpha('notepl1', 4, 1, 2, 'smootherStepOut')
            noteTweenAlpha('notepl2', 5, 1, 2, 'smootherStepOut')
            noteTweenAlpha('notepl3', 6, 1, 2, 'smootherStepOut')
            noteTweenAlpha('notepl4', 7, 1, 2, 'smootherStepOut')            
    end
    if curStep == 23 then
        noteTweenAlpha('noteop1', 0, 1, 2, 'smootherStepOut')
        noteTweenAlpha('noteop2', 1, 1, 2, 'smootherStepOut')
        noteTweenAlpha('noteop3', 2, 1, 2, 'smootherStepOut')
        noteTweenAlpha('noteop4', 3, 1, 2, 'smootherStepOut')
    end
    if curStep == 32 then
        doTweenAlpha('healthop', 'healthBar', 1, 2, 'smootherStepOut')
        doTweenAlpha('health2op', 'healthBarBG', 1, 2, 'smootherStepOut')
        doTweenAlpha('icon1hop', 'iconP1', 1, 2, 'smootherStepOut')       
        doTweenAlpha('icon2hop', 'iconP2', 1, 2, 'smootherStepOut')
        doTweenAlpha('scoreop', 'scoreTxt', 1, 2, 'smootherStepOut')
end
if curStep == 1376 then
    doTweenAlpha('hudop', 'camHUD', 0, 2, 'smootherStepOut')
elseif curStep == 1388 then
        doTweenAlpha('fadeop', 'Fade', 1, 3.7, 'smootherStepOut')
    
end
end
