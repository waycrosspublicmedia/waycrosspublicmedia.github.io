function onCreate()
    setPropertyFromClass('flixel.FlxG', 'save.data.endDialogue', false);
    setPropertyFromClass('flixel.FlxG', 'save.data.reloadedDone', false);

    makeLuaSprite('skellsMessage','skellsMessage',0,0)
    setScrollFactor('skellsMessage',0,0)
    setObjectCamera('skellsMessage','other')
    screenCenter('skellsMessage')

    makeLuaSprite('black','',0,0)
	makeGraphic('black',1280,720,'000000')

    addLuaSprite('skellsMessage',true);
    doTweenAlpha('msghide','skellsMessage',0,0.01,'linear')
    addLuaSprite('black',true)
    setScrollFactor('black',0,0)
	setObjectCamera('black','other')
    screenCenter('black')
    doTweenAlpha('blackhide','black',0,0.01,'linear')
end

-- these are the editable variables --

bg = 'week4';

--------------------------------------
    
local startedEndDialogue = false
local inMessage = false
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
    if isStoryMode and getPropertyFromClass('flixel.FlxG', 'save.data.endDialogue') and not getPropertyFromClass('flixel.FlxG', 'save.data.reloadedDone') then
        setPropertyFromClass('flixel.FlxG', 'save.data.reloadedDone', true);
        doTweenAlpha('skipTextEndshow','skipTextEnd',1,0.01,'linear')
        doTweenAlpha('skipTextEndhide2','skipTextEnd',0,0.4,'linear')
        doTweenAlpha('bgEndBye','bgEnd',0,0.6,'circOut')
        doTweenAlpha('blackshow','black',1,0.01,'circIn')
        runTimer('skellsMessageShow',0.01)
        inMessage = true;
        return Function_Stop;
    end
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
    if tag == 'skellsMessageShow' then
        doTweenAlpha('msgshow','skellsMessage',1,0.5,'linear')
        doTweenAlpha('blackhide2','black',0,1,'circOut')
	end
    if tag == 'messageEnd' then
        inMessage = false;
        endSong()
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

function onUpdatePost(elapsed)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and inMessage then
        runTimer('messageEnd',0.07)
    end
end

function onTweenCompleted(tag)
    if tag == 'bgEndBye' then
        removeLuaSprite('bgEnd',true)
    end
end