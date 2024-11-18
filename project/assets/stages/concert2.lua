local flashing = nil
local shaderName = 'test'
local zoomCameraMode = false;
local camDad = 0.75;
local camBf = 0.95;
local camBfOffset = 350

------------- CAMERA TWEEN --------------------------------
--[[ easing formulas by robert penner http://www.robertpenner.com/easing ]]

local sin, cos, pi, sqrt, abs, asin = math.sin, math.cos, math.pi, math.sqrt, math.abs, math.asin
local eases = {

    ['cubeout'] = function(t, b, c, d)
        t = t / d - 1
        return c * (t ^ 3 + 1) + b
    end
}
local tweens = {{}, {}}

function tween_property(property, goal, duration, ease)
    ease = ease:lower()
    if eases[ease] then
        local start = getProperty(property)
        if start then
            tweens[1][property] = {os.clock() + duration, start, goal - start, duration, ease}
        end
    end
end

function get_tween_value(tag)
    local tween = tweens[2][tag]
    if tween then
        return tween[1]
    end
end

function tween_value(tag, start, goal, duration, ease)
    ease = ease:lower()
    if eases[ease] then
        tweens[2][tag] = {start, os.clock() + duration, start, goal - start, duration, ease}
    end
end

function update_tweens()
    for property, tween in pairs(tweens[1]) do
        if os.clock() <= tween[1] then
            setProperty(property, eases[tween[5]](tween[4] - (tween[1] - os.clock()), tween[2], tween[3], tween[4]))
        else
            tweens[1][property] = nil
        end
    end
    for tag, tween in pairs(tweens[2]) do
        if os.clock() <= tween[2] then
            tween[1] = eases[tween[6]](tween[5] - (tween[2] - os.clock()), tween[3], tween[4], tween[5])
        else
            tweens[2][tag] = nil
        end
    end
end

---------------------- TWEENS ----------------------------
function setTheShader(shadername)
    runHaxeCode([[
        var shaderName = ']] .. shadername .. [[';
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject('tempShader0').shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        return;
    ]])
end

function quickAdd(name, path, x, y, scrollFactorX, scrollFactorY, front, scaleX, scaleY) -- Feel free to use my Function for optimizing code lol - M4TR1CUL4S0 ;)
    makeLuaSprite(name, path, x, y)
    setScrollFactor(name, scrollFactorX, scrollFactorY)
    scaleObject(name, scaleX, scaleY);
    if scaleX == nil then
        scaleX = 1
    end
    if scaleY == nil then
        scaleY = 1
    end
    addLuaSprite(name, front)
end

function onSongStart()
    cameraSetTarget('boyfriend')
end

function onCreate()

    initLuaShader('blend');

    shaderCoordFix()

    makeLuaSprite('tempShader0')
    setTheShader('test')

    -------
    makeAnimatedLuaSprite('bgCrowd', 'stage/FS/bg', -104, -104)
    addAnimationByPrefix('bgCrowd', 'crowd', 'crowd', 24, false)
    setScrollFactor('bgCrowd', 0.8, 0.8)
    addLuaSprite('bgCrowd', false)

    -------
    quickAdd('floor', 'stage/FS/front', -109, 990, 1.1, 1.1, false, 1, 1)
    -----

    makeLuaSprite('bar1', '', 0, -10)
    makeGraphic('bar1', 2000, 100, '000000')
    screenCenter('bar1', 'X')
    setScrollFactor('bar1', 0, 0)
    setObjectCamera('bar1', 'hud')
    -------

    makeLuaSprite('bar2', '', 0, 630)
    makeGraphic('bar2', 2000, 100, '000000')
    setScrollFactor('bar2', 0, 0)
    screenCenter('bar2', 'X')
    setObjectCamera('bar2', 'hud')

    addLuaSprite('bar1', false)
    addLuaSprite('bar2', false)
    -----
    makeLuaSprite('endBlack', nil, 0, 0)
    makeGraphic('endBlack', screenWidth * 2, screenHeight * 2, '000000')
    setObjectCamera('endBlack', 'other')
    setScrollFactor('endBlack', 0, 0);
    setProperty('endBlack.alpha', 0)
    screenCenter('endBlack', 'xy')
    addLuaSprite('endBlack', true)
    ------
    quickAdd('gradient', 'stage/new/grad', -350, -200, 0.6, 0.6, true, 1, 1)
    setProperty('gradient.alpha', 0.75)
    setSpriteShader('gradient', 'blend');
    screenCenter('gradient', 'xy')
    scaleObject('gradient', 1.2, 1.26);
    --------------
    makeAnimatedLuaSprite('screenP', 'stage/FS/events/eventone', -1400, 1020) ---150, 20
    scaleObject('screenP', 0.8, 0.8);
    addAnimationByPrefix('screenP', 'screen', 'miku_event_one', 24, false)
    setObjectCamera('screenP', 'hud')

    addLuaSprite('screenP', true)
    -------

    makeAnimatedLuaSprite('screenR1', 'stage/FS/events/eventtwo', 1460, -40)
    scaleObject('screenR1', 0.8, 0.8);
    addAnimationByPrefix('screenR1', 'screenR1', 'eventtwo', 24, false)
    setObjectCamera('screenR1', 'hud')
    addLuaSprite('screenR1', true)

    makeAnimatedLuaSprite('screenR2', 'stage/FS/events/eventthree', 1480, -40)
    scaleObject('screenR2', 0.8, 0.8);
    addAnimationByPrefix('screenR2', 'screenR2', 'eventthree', 24, true)
    setObjectCamera('screenR2', 'hud')
    addLuaSprite('screenR2', true)

    -----UTILS
    makeLuaSprite('FLASH', nil, 0, 0)
    makeGraphic('FLASH', screenWidth * 2, screenHeight * 2, 'ffffff')
    setObjectCamera('FLASH', 'camGame')
    setScrollFactor('FLASH', 0, 0);
    setProperty('FLASH.alpha', 0)
    screenCenter('FLASH', 'xy')
    addLuaSprite('FLASH', true)

end

function onCreatePost()
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false);
    end
    setProperty('healthBar.alpha', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setTextSize('scoreTxt', 27)
    setProperty('scoreTxt.y', getProperty('scoreTxt.y') - 25)
    flashing = runHaxeCode([[return ClientPrefs.flashing;]])
    runHaxeCode([[
        var shaderName = ']] .. 'test' .. [[';
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject('tempShader0').shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        return;
    ]])

    setPropertyFromClass('GameOverSubstate', 'characterName', 'M1KU_FS')
    setProperty('gf.visible', false)
    setProperty('gf.active', false)
    setProperty('dad.visible', false)
    setProperty('dad.active', false)
    setScrollFactor('boyfriend', 1.1, 1.1)
    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'M1KU_TB');

end

function onCountdownStarted()

    for i = 0, getProperty('strumLineNotes.length') - 1 do
        if not middlescroll then
            setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') - 465)
        end
        if downscroll then
            setPropertyFromGroup('strumLineNotes', i, 'alpha', screenHeight - 165)
        end

    end

end

function tweenScreen(tags, vars, value, directionx, directiony, duration, ease)
    doTweenX(tags, vars, directionx, duration, ease)
    doTweenY(tags .. '1', vars, directiony, duration, ease)
end
local destroyShit = true
function onEvent(name, value1, value2)
    if name == "ending" then
        doTweenAlpha('bye', 'endBlack', 1, 0.8, 'quadInOut')

    end

    if name == 'screenScream' then
        tweenScreen('tween-' .. value1, value1, 1, -150, 20, 1.5, 'cubeout')
        runTimer('screenOut', 2, 1)
        runTimer('waitAction', 0.2, 1)
    end

    if name == 'Fade' then
        doTweenAlpha('FADEIN', 'FLASH', value1, value1, 'easeType')
    end
    if name == 'Flash' then
        cameraFlash('camGame', 'ffffff', value1, true);
    end
    if name == 'tweenScreenR' then
        doTweenX(value1, value1, value2, 1.5, 'cubeout')
    end
    if name == 'bye' then
        runTimer('bye', 0.1)
    end

end

local danced = false;
function onBeatHit(...)
    danced = not danced
    if curBeat % 2 == 0 then
        playAnimations('bgCrowd', 'crowd', true)
    end
    playAnimations('screenP', 'screen', true)
    if curBeat % 2 == 0 then
        playAnimations('screenR1', 'screenR1', true)
    end

end

function onTweenCompleted(tag)
    if tag == 'mikuScreamEND' then
        removeLuaSprite('mikuSCREAM', true)
        cameraFlash('camGame', 'ffffff', 0.1, true);
    end
    if tag == 'FADEIN' then
        doTweenAlpha('FADEOUT', 'FLASH', 0, 1.5, 'easeType')
    end
end

function onTimerCompleted(time)
    if time == 'flashout' then
        removeLuaSprite('white')
        removeLuaSprite('white2')
        cameraFlash('other', 'FF0000', 0.6, true)
    end
    if time == 'waitAction' then
        cameraFlash('camHUD', 'ffffff', 1, true);
    end
    if time == 'screenOut' then
        tweenScreen('tween-' .. time, 'screenP', 1, -1400, 1020, 3, 'cubeout')
    end
    if time == 'bye' then
        doTweenX('bye', 'screenR1', 1460, 1.5, 'cubeout')

    end

end

local lastCombo = 0
function noteMiss(i, d, t, s)

end

noteMissPress = noteMiss
function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        lastCombo = getProperty('combo')
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }

        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }

        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])

    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then
            temp()
        end
    end
end

function onUpdatePost(elapsed)

    if zoomCameraMode == true then
        update_tweens()
        if get_tween_value('dadZoom') then
            setProperty('defaultCamZoom', get_tween_value('dadZoom'))
        else
            if get_tween_value('bfZoom') then
                setProperty('defaultCamZoom', get_tween_value('bfZoom'))
            end
        end

        if mustHitSection == true then
            setProperty('camFollow.x', getMidpointX('boyfriend') - 100)
            setProperty('camFollow.y', getMidpointY('boyfriend') - 100)

            setProperty('camFollow.x',
                getProperty('camFollow.x') + getProperty('boyfriend.cameraPosition')[1] +
                    getProperty('boyfriendCameraOffset')[1] - camBfOffset)

            setProperty('camFollow.y', getProperty('camFollow.y') + getProperty('boyfriend.cameraPosition')[2] +
                getProperty('boyfriendCameraOffset')[2])
        end
    end
end
function playAnimations(spriteName, animName, loop)
    if getProperty(spriteName .. '.active') then
        playAnim(spriteName, animName, loop)
    end
end

function onMoveCamera(char)
    if char == 'dad' then
        tween_value('dadZoom', getProperty('defaultCamZoom'), camDad, .5, 'cubeout')
    else
        if char == 'boyfriend' then
            tween_value('bfZoom', getProperty('defaultCamZoom'), camBf, .5, 'cubeout')
        end
    end
end
