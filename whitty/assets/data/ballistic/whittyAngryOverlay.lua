function onCreate()
    makeLuaSprite('angryOverlay', 'stages/alley-ballistic/angry', -70, -80);
    scaleObject('angryOverlay', 0.5, 0.5);
    setObjectCamera('angryOverlay', 'hud');
    setProperty('angryOverlay.alpha', 0.5);

    addLuaSprite('angryOverlay', true);
end

function onUpdate()
    --setProperty('angryOverlay.alpha', math.max(0, 1 - getHealth()/2))
    health = getHealth();
    if health <= 2 then
        setProperty('angryOverlay.alpha', health - 0.2);
    end
end