function onCreate()
    makeLuaSprite('labBG', 'labBG', -700,-275)
    addLuaSprite('labBG', 0, 0)


    makeAnimatedLuaSprite('kobackgroundbop', 'kobackgroundbop', 350,395)
    addAnimationByPrefix('kobackgroundbop', 'kobackgroundbop', 'idle', 24, false)
    addLuaSprite('kobackgroundbop', 0, 0)


end

function onCreatePost()
    setProperty('gf.alpha', 1)
end

function onBeatHit()
    if curBeat % 2 == 0 then
    objectPlayAnimation('kobackgroundbop', 'kobackgroundbop', false)
    end
end