

function onUpdate(elapsed)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ONE') then
        characterPlayAnim('boyfriend', 'hey', true)
    end
    if getProperty('combo') == 20 then
        triggerEvent("Play Animation",'cheer','GF')
    end
end