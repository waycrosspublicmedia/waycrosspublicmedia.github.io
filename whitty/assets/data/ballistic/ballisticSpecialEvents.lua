local strumsDownscrollPositionY = 570;
function onCreate()
    makeAnimatedLuaSprite('whittyScream', 'cutscenes/ballistic/whittyBallisticIntro', -225, 250);
    addAnimationByIndices('whittyScream', 'whittyScreamsLoop', 'intro', '66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91', 24, true);
    addLuaSprite('whittyScream');
    setProperty('whittyScream.alpha', 0);
end

function onCreatePost()

    makeLuaSprite('FadeBlack', '', -500, -500);
    makeGraphic('FadeBlack', 3000, 3000, '000000')
    addLuaSprite('FadeBlack', true)
    setProperty('FadeBlack.alpha', 0);

    makeLuaSprite('FadeWhite', '', -500, -500);
    makeGraphic('FadeWhite', 3000, 3000, 'FFFFFF');
    setProperty('FadeWhite.alpha', 0);

    addLuaSprite('FadeWhite', true);
    setProperty('healthBar.y', 770);
    setProperty('iconP1.y', 770);
    setProperty('iconP2.y', 770);
    setProperty('scoreTxt.y', 770);
    setProperty('timeBar.y', -150);
    setProperty('timeTxt.y', -150);
    for i = 0, 7 do
        setPropertyFromGroup('opponentStrums', i, 'y', -150);
        setPropertyFromGroup('playerStrums', i, 'y', -150);
    end
    if downscroll then
        setProperty('healthBar.y', -150);
        setProperty('iconP1.y', -150);
        setProperty('iconP2.y', -150);
        setProperty('scoreTxt.y', -150);
        setProperty('timeBar.y', 770);
        setProperty('timeTxt.y', 770);
        for i = 0, 7 do
            setPropertyFromGroup('opponentStrums', i, 'y', 770);
            setPropertyFromGroup('playerStrums', i, 'y', 770);
        end
    end
end

function onUpdate()
    if curBeat == 7 then
        for i = 0, 3 do
            noteTweenY('opponentStrumMove' ..i.. 'Rise', i, _G['defaultOpponentStrumY' ..i], 2, 'smootherStepOut')
            noteTweenY('playerStrumMove' ..i.. 'Rise', i + 4, _G['defaultPlayerStrumY' ..i], 2, 'smootherStepOut')
        end
        doTweenY('healthBarMove', 'healthBar', 639, 2, 'smootherStepOut');
        doTweenY('iconP1Move', 'iconP1', 571, 2, 'smootherStepOut');
        doTweenY('iconP2Move', 'iconP2', 571, 2, 'smootherStepOut');
        doTweenY('scoreTextMove', 'scoreTxt', 680, 2, 'smootherStepOut');
        doTweenY('TimeBarMove', 'timeBar', 27, 2, 'smootherStepOut');
        doTweenY('TimeTextMove', 'timeTxt', 19, 2, 'smootherStepOut');
        if downscroll then
            doTweenY('healthBarMove', 'healthBar', 79, 2, 'smootherStepOut');
            doTweenY('iconP1Move', 'iconP1', 10, 2, 'smootherStepOut');
            doTweenY('iconP2Move', 'iconP2', 10, 2, 'smootherStepOut');
            doTweenY('scoreTextMove', 'scoreTxt', 119, 2, 'smootherStepOut');
            doTweenY('TimeBarMove', 'timeBar', 685, 2, 'smootherStepOut');
            doTweenY('TimeTextMove', 'timeTxt', 677, 2, 'smootherStepOut');
        end
    end
    if curBeat == 366 then
        setProperty('cameraSpeed',7);
        setProperty('dad.alpha', 0);
        setProperty('whittyScream.alpha', 1);
    end
    if curBeat == 368 then
        setProperty('cameraSpeed',1);
        setProperty('dad.alpha', 1);
        setProperty('whittyScream.alpha', 0);
    end
    if curBeat == 432 then
        setProperty('FadeBlack.alpha', 1);
    end
    if curBeat == 433 then
            doTweenAlpha('fadewhitealpha', 'FadeWhite', 1, 1.1, 'smootherStepOut')
    end
        if curBeat == 436 then
            doTweenAlpha('fadewhitealpha', 'FadeWhite', 0, 0.6, 'smootherStepOut')
            setProperty('FadeBlack.alpha', 0);
        end
    if curBeat == 500 then
        noteTweenAlpha('fadeOutOpponentLeft', 0, 0, 2, 'smootherStepOut')
        noteTweenAlpha('fadeOutOpponentDown', 1, 0, 2, 'smootherStepOut')
        noteTweenAlpha('fadeOutOpponentUp', 2, 0, 2, 'smootherStepOut')
        noteTweenAlpha('fadeOutOpponentRight', 3, 0, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutHealth', 'healthBar', 0, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutIconP1', 'iconP1', 0, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutIconP2', 'iconP2', 0, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutScoreText', 'scoreTxt', 0, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutTimeBar', 'timeBar', 0, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutTimeText', 'timeTxt', 0, 2, 'smootherStepOut')
    end

    if curBeat == 515 then
        for i = 0, 3 do
            noteTweenX('playerStrumMove' ..i.. 'Middle', i + 4, _G['defaultPlayerStrumX' ..i] - 320, 2, 'smootherStepOut')
        end
    end

    if curBeat == 660 then
        noteTweenAlpha('fadeOutOpponentLeft', 0, 1, 2, 'smootherStepOut')
        noteTweenAlpha('fadeOutOpponentDown', 1, 1, 2, 'smootherStepOut')
        noteTweenAlpha('fadeOutOpponentUp', 2, 1, 2, 'smootherStepOut')
        noteTweenAlpha('fadeOutOpponentRight', 3, 1, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutHealth', 'healthBar', 1, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutIconP1', 'iconP1', 1, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutIconP2', 'iconP2', 1, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutScoreText', 'scoreTxt', 1, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutTimeBar', 'timeBar', 1, 2, 'smootherStepOut')
        doTweenAlpha('fadeOutTimeText', 'timeTxt', 1, 2, 'smootherStepOut')
    end

    if curBeat == 662 then
        for i = 0, 3 do
            noteTweenX('playerStrumMove' ..i.. 'Back', i + 4, _G['defaultPlayerStrumX' ..i], 0.5, 'smootherStepOut')
        end
    end
        if curBeat == 728 then
            setProperty('FadeBlack.alpha', 1);
        end
        if curBeat == 732 then
                doTweenAlpha('hudop', 'camHUD', 0, 2, 'smootherStepOut')
    end
end
