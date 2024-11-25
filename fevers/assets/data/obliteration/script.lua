function onCreate()
    addLuaScript('funnyscripts/cams')
    if isStoryMode then
        setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', false);
    else
        setPropertyFromClass('flixel.FlxG', 'save.data.dialogueDone', true);
    end
    setPropertyFromClass('flixel.FlxG', 'save.data.endDialogue', false);
end