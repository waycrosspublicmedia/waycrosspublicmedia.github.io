local pixelScale = 3

function onCreate()
    initLuaShader('blue');
    makeLuaSprite('bluej', nil, -1280, -370)
	addLuaSprite('bluej', false)
    setSpriteShader('bluej', 'blue')
    setProperty('skipCountdown', true)
end
function onCreatePost()
    makeLuaSprite('whiteScreen', nil, 0, 0)
    makeGraphic('whiteScreen', 1280, 720, 'FFFFFF')
    addLuaSprite('whiteScreen')
    setObjectCamera('whiteScreen', 'other')
    setCameraShader('game', 'bluej')
    setCameraShader('hud', 'bluej')
    makeLuaText('songCreditText', [[
* Now Playing: Kero
* Song by Shyfire and Tiktakt
* Art by Ghospel
* Chart by Farsy
* Coded by Rodrigo and Burgerballs
]], 800,0,snap(100))
    setTextAlignment('songCreditText', 'left')
    screenCenter('songCreditText', 'x')
    addLuaText('songCreditText')
    setObjectCamera('songCreditText', 'camOther')
    setTextSize('songCreditText', 72)
    setTextBorder('songCreditText', 0, '000000')
    setTextColor('songCreditText', '000000')
    setProperty('songCreditText.visible', false)
    setProperty('whiteScreen.color', getColorFromHex('000000'))

    makeLuaSprite('bbar',nil,0,0)
    makeGraphic('bbar', 106, 720, '000000')
    addLuaSprite('bbar')
    setObjectCamera('bbar', 'other')

    makeLuaSprite('bbar2',nil,1280 - 106,0)
    makeGraphic('bbar2', 106, 720, '000000')
    addLuaSprite('bbar2')
    setObjectCamera('bbar2', 'other')

end

function onSongStart()
    setProperty('songCreditText.visible', true)
    setProperty('whiteScreen.color', getColorFromHex('FFFFFF'))
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    setShaderBool('bluej', 'miss', true)
    cancelTimer('missTmr')
    runTimer('missTmr', crochet/4000, 1)
end
function onTimerCompleted(tag, loops, loopsLeft)
    setShaderBool('bluej', 'miss', false)
end

function onBeatHit()
    if curBeat % 8 == 0 then
        setProperty('songCreditText.visible', true)
    elseif (curBeat % 8 == 3) then
        setProperty('songCreditText.visible', false)
    end

    if curBeat == 15 then
        setProperty('songCreditText.visible', true)
        setTextColor('songCreditText', 'FFFFFF')
        setTextString('songCreditText', 'GET READY!!!')
        setProperty('whiteScreen.color', getColorFromHex('000000'))
        doTweenX('f', 'songCreditText', 1280, crochet/1000, 'linear')
        doTweenY('fy', 'songCreditText', 720, crochet/1500, 'sineOut')
    elseif curBeat == 16 then
        setProperty('whiteScreen.visible', false)
        setProperty('songCreditText.alpha', 0)
    end
end

function onUpdatePost(elapsed)
end

function snap(a)
    return math.floor(a/pixelScale) * pixelScale
end