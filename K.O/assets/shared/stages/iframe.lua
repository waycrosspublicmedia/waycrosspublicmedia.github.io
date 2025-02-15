function onCreate()
    makeLuaSprite('iframeBG', 'iframeBG', -700,-275)
    addLuaSprite('iframeBG', 0, 0)

    makeAnimatedLuaSprite('gfKO', 'characters/gfKO', 1050,-100)
    addAnimationByPrefix('gfKO', 'danceLeft', 'danceLeft', 24, false)
    addAnimationByPrefix('gfKO', 'danceRight', 'danceRight', 24, false)
    addLuaSprite('gfKO', false)
    scaleObject('gfKO', 0.5,0.5)
    setObjectOrder('gfKO', getObjectOrder('boyfriendGroup')-1)

end


local enidDance = false
function onBeatHit()


    if curBeat % 2 == 0 then
    if enidDance == false then
        objectPlayAnimation('gfKO', 'danceLeft', false)
        enidDance = true
    else
        objectPlayAnimation('gfKO', 'danceRight', false)
        enidDance = false
    end
    end
end

function onUpdatePost()
    if getProperty('gfKO.animation.curAnim.name') == 'danceLeft' then
        setProperty('gfKO.offset.x', 12);
        setProperty('gfKO.offset.y', 0);
    elseif getProperty('gfKO.animation.curAnim.name') == 'danceRight' then
        setProperty('gfKO.offset.x', 0);
        setProperty('gfKO.offset.y', 0);
    elseif getProperty('gfKO.animation.curAnim.name') == 'sad' then
        setProperty('gfKO.offset.x', 1);
        setProperty('gfKO.offset.y', 1);
    end
end