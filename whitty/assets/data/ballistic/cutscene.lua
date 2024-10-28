--local allowCountdown = false
playVideo = true;
playDialogue = true;
function onStartCountdown()
    if isStoryMode and not seenCutscene then
        if playVideo then
            startVideo('ballistic');
            playVideo = false;
            return Function_Stop;
        elseif playDialogue then
            startDialogue('dialogue', 'ballistic/grit');
            playSound('ballistic/dialogueVoiceLines/1', 1, 'firstVoiceLine');
            playDialogue = false;
            return Function_Stop;
        end
    end
    return Function_Continue;
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
    playSound('ballistic/dialogueVoiceLines/' ..voiceLineCount, 1, 'voiceLine');
    playSound('ballistic/dialogueVoiceLines/' ..voiceLineCount, 1, 'voiceLineExtra');
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'startDialogue' then
        dialogueVoiceLines(1);
    end
end