local curPhase = {}

function onCreatePost()
    for i, asd in pairs({'phs2/clouds', 'phs2/backhil', 'phs2/bulk', 'phs2/glow', 'phs2/chop', 'phs2/glow2', 'phs2/hills', 'eyebal', 'loganhedz', 'evilghost', 'hill1', 'hill2', 'hill3', 'fireparticles', 'gradient', 'lovingfamily', 'statid', 'question', 'axehouse'}) do precacheImage('underworld/' .. asd) end

    makeLuaSprite('eye', 'underworld/eyebal', 1200)
    setScrollFactor('eye', 0.95, 1)
    addLuaSprite('eye', true)

    makeLuaSprite('lungun', '', 1300, -500)
    loadGraphic('lungun', 'underworld/loganhedz', 337, 438)
    addAnimation('lungun', 'idle', {0, 1, 2, 3, 4}, 0)

    scaleObject('lungun', 0.2, 0.2)

    addLuaSprite('lungun', true)

    local turd = makeLuaSprite

    makeLuaSprite = function(tag, image, ...)
        turd(tag, image, ...)

        table.insert(curPhase, tag)
    end

    makeAnimatedLuaSprite('bac', 'underworld/statid')
    addAnimationByPrefix('bac', 'nightmare', 'idle', 24, true)
    scaleObject('bac', 2.7, 2.7)
    addLuaSprite('bac')

    for i = 1, 3 do
        makeLuaSprite(i, 'underworld/hill' .. i)
        addLuaSprite(i)

        scaleObject(i, 2.7, 2.7)

        setScrollFactor(i, i / 2, 1)
    end

    makeAnimatedLuaSprite('hose', 'underworld/axehouse', -390, 30)
    scaleObject('hose', 2.7, 2.7)
    addLuaSprite('hose')

    makeLuaSprite('evil', 'underworld/evilghost', 1550, 780)
    setScrollFactor('evil', 0.5, 1)
    scaleObject('evil', 0.5, 0.5)
    addLuaSprite('evil')

    makeLuaSprite('bars', 'underworld/bars', 0, -260)
    setObjectCamera('bars', 'other')
    addLuaSprite('bars')

    makeAnimatedLuaSprite('love', 'underworld/lovingfamily', 450, 400) 
    addLuaSprite('love', true) 
    setProperty('love.alpha', 0)

    cameraFade('camGame', '000000', 0)

    setProperty('timeBar.visible', false) setProperty('timeBarBG.visible', false) setProperty('timeTxt.visible', false)
    
    addCharacterToList('dad', 'behemoth') addCharacterToList('dad', 'johnny') addCharacterToList('dad', 'the-big')
    addCharacterToList('boyfriend', 'pussy') addCharacterToList('boyfriend', 'daddy') addCharacterToList('boyfriend', 'father')
    
    addHaxeLibrary('ColorSwap')

	runHaxeCode([[
		color = new ColorSwap();
		setVar('bright', color);

		game.camGame.setFilters([new ShaderFilter(color.shader)]);
	]])
end

function evil()
    makeAnimatedLuaSprite('fire', 'underworld/fireparticles', 800, 500)
    addAnimationByPrefix('fire', 'idle', 'burn', 24, true)
    scaleObject('fire', 4, 3)
    addLuaSprite('fire')
    
    for i, group in pairs({'strumLineNotes', 'unspawnNotes', 'grpNoteSplashes'}) do
        runHaxeCode([[
            for (turd in game.]] .. group .. [[)
            {  
                turd.cameras = [game.camGame];
                turd.scrollFactor.set(1, 1);

                turd.x += 700;
                turd.y += 500;
            }
        ]])
    end

    setProperty('RATING_X', getProperty('RATING_X') + 700)

    makeLuaSprite('grad', 'underworld/gradient', 100, 400)
    scaleObject('grad', 5, 6)
    addLuaSprite('grad')
end

function house2()
    for i, asd in pairs({'clouds', 'backhil', 'bulk', 'glow', 'chop', 'glow2', 'hills'}) do
        makeLuaSprite(asd, 'underworld/phs2/' .. asd)
        if stringStartsWith(asd, 'glow') then setBlendMode(asd, 'add') end

        addLuaSprite(asd, i == 7)
    end

    setScrollFactor('hills', 1.2, 1)

    removeLuaSprite('lungun', true)
    removeLuaSprite('eye', true)
    removeLuaSprite('hose', true)

    cancelTimer('fart')

    setProperty('gf.visible', false)
end

function reloadStage(func)
    for i, trash in pairs(curPhase) do
        removeLuaSprite(trash, true)
    end

    cameraFlash('camGame', 'ff0000', 1)

    func()
end

function onMoveCamera(focus)
    if curStep >= 3312 then setProperty('defaultCamZoom', focus == 'dad' and 0.6 or 0.75) end
end

function onUpdate(elapsed)
    local y = math.cos(curDecBeat / 2) * 10
    local f = getProperty('lungun.scale.x')

    if f ~= nil then
        setProperty('lungun.offset.y', y) setProperty('eye.offset.y', y)
        setProperty('eye.y', getProperty('lungun.y') + 154)

        setProperty('eye.scale.x', f) setProperty('eye.scale.y', f)
    end

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultOpponentStrumX' .. i] + getRandomFloat(-5, 5) - (curStep >= 3312 and 1000 or 0))
        setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY' .. i] + getRandomFloat(-5, 5))
    end

    setProperty('bright.brightness', lerp(getProperty('bright.brightness'), 0, elapsed * 3))

    setProperty('evil.alpha', math.sin(curDecBeat / 4))
end

function lerp(a, b, c)
	return a + c * (b - a)
end

local turd = {0.7, 0.1, 0.1, 1.2, 0.2}

function reloadHead()
    local queer = ((getSongPosition() % 3000 < 500) and 4 or (getSongPosition() % 15000 < 4000) and 3) or (getProperty('lungun.animation.curAnim.curFrame') + 1) % 3

    runTimer('fart', turd[queer + 1])

    return queer
end

function onTimerCompleted(tag)
    if tag == 'fart' then
        setProperty('lungun.animation.curAnim.curFrame', reloadHead())
    end
end

function onStepHit()
    if curStep % getProperty('stepDivider') == getProperty('stepOffset') and getProperty('cameraTwn') ~= 'cameraTwn' then
        cameraShake('camGame', 0.005, 0.2)

        if curStep >= 3312 then setProperty('bright.brightness', 1)

        setProperty('grad.alpha', 0.7) end
    end
end

local color = {'purple0', 'blue0', 'green0', 'red0'}

local f = 0

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote and curStep >= 3312 then
        f = f + 1
        makeAnimatedLuaSprite(f, 'NOTE_assets', getRandomInt(0, 64) * 40, 200)
        addAnimationByPrefix(f, 'fart', color[direction + 1])

        addLuaSprite(f, true)

        doTweenY('arrow' .. f, f, defaultOpponentY + 300, 2, 'circOut')
        doTweenAlpha('bye' .. f, f, 0, 2, 'circOut')
    end
end

function onTweenCompleted(tag)
    if stringStartsWith(tag, 'arrow') then
        removeLuaSprite(tag:gsub('arrow', ''), true)
    end
end

function onEvent(name, value1, value2)
    if name == 'do anything' then
        if value1 ~= '' then loadstring(value1)() end if value2 ~= '' then runHaxeCode(value2) end
    end
end

function onPause()
    return Function_Stop
end