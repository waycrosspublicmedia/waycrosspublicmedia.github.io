local allowCountdown = false
function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
        --Turning off Characters and HUD Elements for the Cutscene Characters
        setProperty('camHUD.visible', false);
        setProperty('dad.visible', false);
        setProperty('boyfriend.visible', false);
        setProperty('gf.visible', false);

        --TIMERS FOR CUTSCENE EVENTS
        runTimer('startCutscene', 0.1);
        runTimer('whittyTearsPoster', 2.5);
        runTimer('tearingSound', 2.75);
        runTimer('whittyBurnsPoster', 4.5);
        runTimer('whittyHearsBoyfriend', 6.5);
        runTimer('whittyTurnsAround', 7.5);
        runTimer('cameraFadesOut', 9.25);
        runTimer('cameraFadesBackIn', 10.75);
        runTimer('finishCutscene', 13);

        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onCreate()
    if isStoryMode and not seenCutscene then
        --Whitty Cutscene Sprites
        makeAnimatedLuaSprite('whittyIntroCutscene', 'cutscenes/lo-fight/whittyIntro', 260, 360);
        addAnimationByIndices('whittyIntroCutscene', 'startFrame', 'whittyIntro', '0', 24, true);
        addAnimationByIndices('whittyIntroCutscene', 'tearPoster', 'whittyIntro', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25', 24, false);
        addAnimationByIndices('whittyIntroCutscene', 'burningPoster', 'whittyIntro', '26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60', 24, false);
        addAnimationByIndices('whittyIntroCutscene', 'whittyHearsBF', 'whittyIntro', '61,62,63,64,65,66,67,68,69,70,71,72,73,74,75', 24, false);
        addAnimationByIndices('whittyIntroCutscene', 'whittyTurns', 'whittyIntro', '76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102', 24, false);

        --Boyfriend Cutscene Sprites (Just the Character Itself)
        makeAnimatedLuaSprite('boyfriendCutscene', 'characters/bf-whitty', 1650, 775);
        addAnimationByIndices('boyfriendCutscene', 'idle', 'BF IDLE', '0', 24, true);
        addAnimationByPrefix('boyfriendCutscene', 'response', 'BF UP', 24, false);
        
        --Girlfriend Cutscene Sprites (Just the Character Itself)
        makeAnimatedLuaSprite('girlfriendCutscene', 'characters/gf-whitty', 1850, 650);
        addAnimationByIndices('girlfriendCutscene', 'dancing', 'idle', '12', 24, true);
        
        --Fade
        makeLuaSprite('Fade', '', -500, -500);
        makeGraphic('Fade', 3000, 3000, '000000')
        
        --Adding Sprites in Order (Correct Layering)
        addLuaSprite('girlfriendCutscene');
        addLuaSprite('boyfriendCutscene');
        addLuaSprite('whittyIntroCutscene');
        addLuaSprite('Fade', true);
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    --Starting the Cutscene
    if tag == 'startCutscene' then
        doTweenAlpha('FadeIn', 'Fade', 0, 2, 'ease');
        doTweenZoom('cameraZoomIn', 'camGame', 0.8, 0.1, 'ease');
        playAnim('whittyIntroCutscene', 'startFrame', false, false, 0);
        playAnim('boyfriendCutscene', 'idle', false, false, 0);
        cameraSetTarget('dad');
        playSound('lo-fight/citynight', 0.6, 'nightCity');
    end

    --Whitty Tears Poster
    if tag == 'whittyTearsPoster' then
        playAnim('whittyIntroCutscene', 'tearPoster', false, false, 0);
    end
    if tag == 'tearingSound' then
        playSound('lo-fight/rip', '0.8', 'tearingPoster');
    end

    --Whitty Burns said Poster
    if tag == 'whittyBurnsPoster' then
        playAnim('whittyIntroCutscene', 'burningPoster', false, false, 0);
        playSound('lo-fight/fire', '0.8', 'burningPoster')
    end

    --Whitty Hears BF Beep at him
    if tag == 'whittyHearsBoyfriend' then
        playAnim('whittyIntroCutscene', 'whittyHearsBF', false, false, 0);
        playAnim('boyfriendCutscene', 'response', false, false, 0);
        setProperty('boyfriendCutscene.x', 1670);
        setProperty('boyfriendCutscene.y', 725);
        playSound('lo-fight/beepboop', '0.8', 'BFSpeaks');
        cameraSetTarget('boyfriend');
        doTweenZoom('cameraZoomIn', 'camGame', 0.6, 0.5, 'smootherStepOut');
    end

    --Whitty: "Da Fuq?"
    if tag == 'whittyTurnsAround' then
        playAnim('whittyIntroCutscene', 'whittyTurns', false, false, 0);
        playAnim('boyfriendCutscene', 'idle', false, false, 0);
        setProperty('boyfriendCutscene.x', 1650);
        setProperty('boyfriendCutscene.y', 775);
    end

    --Camera Fades to Black
    if tag == 'cameraFadesOut' then
        doTweenAlpha('FadeOut', 'Fade', 1, 1, 'ease');
    end

    --Camera Fades Back to Scene and Dialogue Starts
    if tag == 'cameraFadesBackIn' then
        doTweenAlpha('FadeBackIn', 'Fade', 0, 2, 'ease');
        cameraSetTarget('dad');
        setProperty('dad.visible', true);
        setProperty('boyfriend.visible', true);
        setProperty('gf.visible', true);
        setProperty('whittyIntroCutscene.visible', false);
        setProperty('boyfriendCutscene.visible', false);
        setProperty('girlfriendCutscene.visible', false);
    end

    --Finishing the Cutscene and Starting the Song
    if tag == 'finishCutscene' then
        setProperty('inCutscene', true);
        triggerEvent('startDialogue');
        startDialogue('dialogue', 'lo-fight/citynight');

        setProperty('camHUD.visible', true);
        stopSound('nightCity');
    end
end

-- All these Functions Below will serve as the Voice Line Code for the Dialogue Sequence
function onNextDialogue(dialogueCount)
    dialogueVoiceLines(dialogueCount + 1);
end

function onSkipDialogue(dialogueCount)
    stopSound('voiceLineExtra');
end

function dialogueVoiceLines(voiceLineCount)
    stopSound('voiceLine');
    stopSound('voiceLineExtra');
    playSound('lo-fight/dialogueVoiceLines/' ..voiceLineCount, 1, 'voiceLine');
    playSound('lo-fight/dialogueVoiceLines/' ..voiceLineCount, 1, 'voiceLineExtra');
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'startDialogue' then
        dialogueVoiceLines(1);
    end
end