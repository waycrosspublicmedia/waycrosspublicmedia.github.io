function onCreate()
    addLuaScript('funnyscripts/cams')
    if isStoryMode then
        setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', false);
    else
        setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', true);
    end
    setPropertyFromClass('flixel.FlxG', 'save.data.endDialogue', false);
end

-- these are the editable variables --

bg = 'demonX';
song = 'pocket-void';

--------------------------------------
    
local allowCountdown = false
local startedFirstDialogue = false
function onStartCountdown()
    if not allowCountdown and isStoryMode and not startedFirstDialogue then
        setProperty('inCutscene', true);
        runTimer('startDialogue', 0.6);
        startedFirstDialogue = true;
        return Function_Stop;
    end
    if isStoryMode then
        doTweenAlpha('bgBye','bg',0,0.6,'circOut')    
    end
    stopSound(song)
    doTweenAlpha('skipTextshow','skipText',1,0.01,'linear')
    doTweenAlpha('skipTexthide2','skipText',0,0.4,'linear')
    setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', true);
    runTimer('notes',0.01);
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then
        startDialogue('dialogue');
        allowCountdown = true;
    end
    if tag == 'notes' then
        triggerEvent('eventTrigger','noteskin',0);
		triggerEvent('eventTrigger','introcard',0);
    end
end

function onCreatePost()
    if isStoryMode then
        makeLuaSprite('bg','dialBgs/' .. bg,0,0)
        setLuaSpriteScrollFactor('bg',0,0)
        setObjectCamera('bg','HUD')
        addLuaSprite('bg',false)
        playSound('dialSongs/' .. song ..'/Inst', 1, song)
    end
    addLuaScript('funnyscripts/cams')
    if isStoryMode and not getPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone') then
        makeLuaText('skipText', "Press CTRL to skip Or ESC to go back to Menus", 0, 0, 680)
        setTextAlignment('skipText', 'center')
        setTextSize('skipText', 25)
        setObjectCamera('skipText', 'other')
        setTextFont('skipText', 'Coffee Extra.ttf')
        addLuaText('skipText')
        screenCenter('skipText','X')
        doTweenAlpha('skipTexthide','skipText',0,0.01,'linear')
        doTweenAlpha('skipTextshow','skipText',1,2,'linear')
    end
end

function onUpdatePost(elapsed)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') and isStoryMode and not getPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone') then
        exitSong(false);
        return Function_Continue;
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') and isStoryMode and not getPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone') then
        restartSong(false);
        return Function_Continue;
    end
end

function onNextDialogue(line)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onTweenCompleted(tag)
    if tag == 'bgBye' then
        removeLuaSprite('bg',true)
    end
end

function onSoundFinished(tag)
    if tag == song then
        playSound('dialSongs/' .. song .. '/Inst', 1, song)
    end
end