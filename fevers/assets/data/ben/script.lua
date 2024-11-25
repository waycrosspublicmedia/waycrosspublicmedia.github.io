function onCreate()
    addLuaScript('funnyscripts/cams')
    if isStoryMode then
        setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', false);
    else
        setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', true);
    end
    setPropertyFromClass('flixel.FlxG', 'save.data.endDialogue', false);
end

function onStepHit()
    
end

function onUpdatePost(elasped)
    if curStep >= 56 and curStep <= 68 then
        setProperty('camFollowPos.x',900)
		setProperty('camFollowPos.y',460)
    end
    if curStep == 56 then
        setProperty('camGame.zoom',1.1)
        setProperty('defaultCamZoom', 1.1)
    end
    if curStep == 60 then
        setProperty('defaultCamZoom', 0.7)
    end
end