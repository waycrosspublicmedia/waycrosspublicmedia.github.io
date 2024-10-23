function onCreatePost()
    local path = 'stages/stage/'

    makeLuaSprite('wall', path..'wall', -722, -500)
    setScrollFactor('wall', 0.95,1)
    addLuaSprite('wall')

    makeLuaSprite('floor', path..'floor', -960, 530)
    setScrollFactor('floor', 1,1)
    addLuaSprite('floor')

    makeLuaSprite('lights', path..'lights', -512, -180)
    setScrollFactor('lights', 0.97,1)
    addLuaSprite('lights')

    makeLuaSprite('lights lights', path..'lights lights', -22, -98)
    setBlendMode('lights lights', 'add')
    setScrollFactor('lights lights', 0.97,1)
    addLuaSprite('lights lights')

    makeLuaSprite('shading', path..'shading', -582, -404)
    setBlendMode('shading', 'multiply')
    addLuaSprite('shading')

    makeLuaSprite('overlay', path..'overlay', -410, 272)
    setBlendMode('overlay', 'add')
    addLuaSprite('overlay', true)
    doTweenAlpha('overlayTwn', 'overlay', 0.5, 1, 'linear')

    makeLuaSprite('courtains', path..'courtains', -1500, -1124)
    setScrollFactor('courtains', 1.1,1.1)
    addLuaSprite('courtains', true)
end

function onSongStart()
    setProperty('overlay.alpha', 1)
    doTweenAlpha('overlayTwn', 'overlay', 0.5, 1, 'linear')
end

function onBeatHit()
    if curBeat % 4 == 0 then
        setProperty('overlay.alpha', 1)
        doTweenAlpha('overlayTwn', 'overlay', 0.5, 1, 'linear')
    end
end