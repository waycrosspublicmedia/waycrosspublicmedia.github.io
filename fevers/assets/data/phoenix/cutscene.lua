local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		startVideo('cucumber')
		allowCountdown = true;
		return Function_Stop;
	end
	runTimer('notes',0.01);
	setProperty('camGame.zoom',1.0)
	doTweenZoom('www','camGame',0.7,3,'quadInOut')
	
	return Function_Continue;
end

function onTimerCompleted(tag,loops,loopsLeft)
	if tag == 'notes' then
		triggerEvent('eventTrigger','noteskin',0);
		triggerEvent('eventTrigger','introcard',0);
	end
end

function onCreate()
    addLuaScript('funnyscripts/cams')
	if isStoryMode then
        setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', false);
    else
        setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', true);
    end
    setPropertyFromClass('flixel.FlxG', 'save.data.endDialogue', false);
end