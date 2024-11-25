function onCreate()
    setPropertyFromClass('flixel.FlxG', 'save.data.endDialogue', false);
end

-- these are the editable variables --

bg = 'week2';

--------------------------------------
    
local startedEndDialogue = false
function onEndSong()
    if isStoryMode and not startedEndDialogue then
        setProperty('inCutscene', true);
        runTimer('startDialogueEnd', 3.0);
        for i = 0, 8 do
            noteTweenAlpha('hideNotesTween'..i, i, 0, 0.7, 'linear')
        end
        setPropertyFromClass('flixel.FlxG', 'save.data.endDialogue', true);
        startedEndDialogue = true;
        return Function_Stop;
    end
    doTweenAlpha('skipTextEndshow','skipTextEnd',1,0.01,'linear')
    doTweenAlpha('skipTextEndhide2','skipTextEnd',0,0.4,'linear')
    setPropertyFromClass('flixel.FlxG', 'save.data.endDialogue', false);
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogueEnd' then
        addLuaSprite('bgEnd',true)
        startDialogue('dialogueEnd');
        addLuaText('skipTextEnd')
        doTweenAlpha('skipTextEndhide','skipTextEnd',0,0.01,'linear')
        doTweenAlpha('skipTextEndshow','skipTextEnd',1,2,'linear')
        doTweenAlpha('bghide','bgEnd',0,0.01,'linear')
        doTweenAlpha('bgshow','bgEnd',1,0.3,'linear')
    end
end

function onCreatePost()
    if isStoryMode then
        makeLuaSprite('bgEnd','dialBgs/' .. bg,0,0)
        setLuaSpriteScrollFactor('bgEnd',0,0)
        setObjectCamera('bgEnd','HUD')
    end
    addLuaScript('funnyscripts/cams')
    if isStoryMode then
        makeLuaText('skipTextEnd', "Press CTRL to skip", 0, 520, 680)
        setTextAlignment('skipTextEnd', 'center')
        setTextSize('skipTextEnd', 25)
        setObjectCamera('skipTextEnd', 'other')
        setTextFont('skipTextEnd', 'Coffee Extra.ttf')
    end
end

function onNextDialogue(line)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end