local allowCountdown = false
function onStartCountdown()
    -- Block the first countdown, starts a timer for a fadeout camera and a timer of 1.6 seconds to play the dialogue
    if not allowCountdown and isStoryMode and not seenCutscene then
        setProperty('inCutscene', true);
        runTimer('CameraGoesBlack', 0.001)
        runTimer('FadeOut', 0.3)
        runTimer('startDialogue', 1.6);

        --Fade
        makeLuaSprite('Fade', '', -500, -500);
        makeGraphic('Fade', 3000, 3000, '000000')
        addLuaSprite('Fade', true)
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'CameraGoesBlack' then
    doTweenAlpha('FadeOut', 'Fade', 1, 0.001, 'ease');
    setProperty('camHUD.alpha', 0);
   end
   if tag == 'FadeOut' then
    doTweenAlpha('FadeOut2', 'Fade', 0, 1, 'ease');
    doTweenAlpha('Hudop', 'camHUD', 1, 1, 'smootherStepOut')
   end
    if tag == 'startDialogue' then -- Timer completed, play dialogue
        startDialogue('dialogue', 'lo-fight/citynight');
        playSound('overhead/dialogueVoiceLines/1', 1, 'firstVoiceLine');
    end
end

function onNextDialogue(dialogueCount)
    dialogueVoiceLines(dialogueCount + 1);
end

function onSkipDialogue(dialogueCount)
    stopSound('voiceLineExtra');
end

function dialogueVoiceLines(voiceLineCount)
    stopSound('voiceLine');
    stopSound('voiceLineExtra');
    playSound('overhead/dialogueVoiceLines/' ..voiceLineCount, 1, 'voiceLine');
    playSound('overhead/dialogueVoiceLines/' ..voiceLineCount, 1, 'voiceLineExtra');
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'startDialogue' then
        dialogueVoiceLines(1);
    end
end