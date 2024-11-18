local flashing = nil
local shaderName = "test"
local zoomCameraMode, camDad, camBf, camBfOffset = false, 0.6, 0.7, 350

------------- CAMERA TWEEN --------------------------------
--[[ easing formulas by robert penner http://www.robertpenner.com/easing ]]

local sin, cos, pi, sqrt, abs, asin = math.sin, math.cos, math.pi, math.sqrt, math.abs, math.asin
local eases = {

    ["cubeout"] = function(t, b, c, d)
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
        var shaderName = "]] .. shadername .. [[";
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("tempShader0").shader = shader0;
        return;
    ]])
end

function setCharPos(char, x, y)
    setProperty(char .. '.x', x)
    setProperty(char .. '.y', y)
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
    doTweenAlpha('starting', 'startBlack', 0, 2.5, 'quadInOut')
    doTweenZoom('zooming', 'camGame', 0.95, 2.4, 'quadInOut')
    cameraSetTarget('dad')
end

function onCreate()

    initLuaShader('blend');

    shaderCoordFix()

    makeLuaSprite("tempShader0")
    setTheShader('test')

    -------

    quickAdd('back', 'stage/new/bg', -737, -479, 0.6, 0.6, false, 1.2, 1.2)
    -------
    makeAnimatedLuaSprite('speakerbg', 'stage/new/speakers', -104, -104)
    addAnimationByPrefix('speakerbg', 'speakerbg', 'backspeakers', 24, false)
    setScrollFactor('speakerbg', 0.8, 0.8)
    addLuaSprite('speakerbg', false)

    quickAdd('backBase', 'stage/new/floorback', -515, 340, 0.85, 0.85, false, 1.4, 1.4)

    -------
    quickAdd('base', 'stage/new/floor', -594, 932, 1, 1, false, 1.4, 1.4)

    -------

    -------
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
    -------
    makeAnimatedLuaSprite('crowd', 'stage/new/crowd', -248, 1400)
    addAnimationByPrefix('crowd', 'bump', 'Crowd', 24, true)
    setScrollFactor('crowd', 1.1, 1.1);
    scaleObject('crowd', 0.8, 0.7);
    addLuaSprite('crowd', true)

    -----

    quickAdd('gradient', 'stage/new/grad', -350, -200, 0.6, 0.6, true, 1, 1)
    setProperty('gradient.alpha', 0.75)
    setSpriteShader('gradient', 'blend');
    screenCenter('gradient', 'xy')
    scaleObject('gradient', 1.2, 1.26);
    -------

    -----THE WORLD IS MINE!!!
    makeLuaSprite('bgPink', 'stage/TWIM/bggradient', -300, -100);
    setScrollFactor('bgPink', 0, 0);
    scaleObject('bgPink', 1.2, 1.2);
    screenCenter('bgPink', 'xy')
    addLuaSprite('bgPink', false)
    setProperty('bgPink.visible', false)
    setProperty('bgPink.active', false)

    makeLuaSprite('world', 'stage/TWIM/baseworld', 150, 900);
    addLuaSprite('world', false)
    setProperty('world.visible', false)
    setProperty('world.active', false)

    makeAnimatedLuaSprite('effect', 'stage/TWIM/effect', 0, 300)
    addAnimationByPrefix('effect', 'bump', 'effectstage', 24, false)
    addLuaSprite('effect', false)
    setProperty('effect.visible', false)
    setProperty('effect.active', false)

    makeLuaSprite('gradient2', 'stage/TWIM/Gradient', -350, -200);
    setScrollFactor('gradient2', 0.6, 0.6);
    setProperty('gradient2.alpha', 0.6)
    screenCenter('gradient2', 'xy')
    scaleObject('gradient2', 1.2, 1.26);
    addLuaSprite('gradient2', true)
    setProperty('gradient2.visible', false)
    setProperty('gradient2.active', false)

    makeAnimatedLuaSprite('mikuSCREAM', 'stage/TWIM/mikustarteventtwim', 273, 878)
    addAnimationByPrefix('mikuSCREAM', 'SCREAM', 'miku_twim_event', 24, true)
    addLuaSprite('mikuSCREAM', false)
    setScrollFactor('mikuSCREAM', 0, 0);
    setObjectCamera('mikuSCREAM', 'hud')
    setProperty('mikuSCREAM.visible', false)
    setProperty('mikuSCREAM.active', false)

    -------
    addLuaSprite('bar1', false)
    addLuaSprite('bar2', false)
    -----UTILS
    makeLuaSprite('FLASH', nil, 0, 0)
    makeGraphic('FLASH', screenWidth * 2, screenHeight * 2, 'ffffff')
    setObjectCamera('FLASH', 'camGame')
    setScrollFactor('FLASH', 0, 0);
    setProperty('FLASH.alpha', 0)
    screenCenter('FLASH', 'xy')
    addLuaSprite('FLASH', true)

    makeLuaSprite('startBlack', nil, 0, 0)
    makeGraphic('startBlack', screenWidth * 2, screenHeight * 2, '000000')
    setObjectCamera('startBlack', 'camGame')
    setScrollFactor('startBlack', 0, 0);
    setProperty('startBlack.alpha', 1)
    screenCenter('startBlack', 'xy')
    addLuaSprite('startBlack', true)

    makeLuaSprite('endBlack', nil, 0, 0)
    makeGraphic('endBlack', screenWidth * 2, screenHeight * 2, '000000')
    setObjectCamera('endBlack', 'other')
    setScrollFactor('endBlack', 0, 0);
    setProperty('endBlack.alpha', 0)
    screenCenter('endBlack', 'xy')
    addLuaSprite('endBlack', true)

    -----ROLLING GIRL

    quickAdd('backRG', 'stage/RG/back', -300, -100, 0.8, 0.8, false, 0.75, 0.75)
    quickAdd('piano', 'stage/RG/piano', -481, 552, 1, 1, true, 0.75, 0.75)
    quickAdd('gradient3', 'stage/RG/gradient', -537.8, -285.56, 0.8, 0.8, true, 1.2, 1.26)
    setSpriteShader('gradient3', 'blend3')
    setProperty('gradient3.alpha', 0.55)
    setProperty('backRG.visible', false)
    setProperty('piano.visible', false)
    setProperty('gradient3.visible', false)
    setProperty('gradient3.active', false)
    setProperty('piano.active', false)
    setProperty('backRG.active', false)

    quickAdd('backTB', 'stage/TB/bgBaka', 216, 44, 1, 1, false, 0.6, 0.6)
    setProperty('backTB.active', false)
    setProperty('backTB.visible', false)

    makeAnimatedLuaSprite('neru', 'stage/TB/neru_idle', 186 + 60, 332)
    addAnimationByPrefix('neru', 'idle', 'neru_idle', 24, false)
    setObjectOrder('neru', getObjectOrder('boyfriendGroup') + 1);
    setProperty('neru.active', false)
    setProperty('neru.visible', false)
    addLuaSprite('neru', false)

    makeAnimatedLuaSprite('teto', 'stage/TB/teto_idle', 483 + 60, 334)
    addAnimationByPrefix('teto', 'idle', 'teto_idle', 24, false)
    setProperty('teto.active', false)
    setProperty('teto.visible', false)
    addLuaSprite('teto', false)
end

function onCreatePost()
    addCharacterToList('M1KU_TWIM', 'dad')
    addCharacterToList('M1KU_RG', 'dad')
    addCharacterToList('M1KU_RG', 'dad')
    addCharacterToList('M1KU_TB', 'dad')
    addCharacterToList('bf_TB', 'boyfriend')

    setTextSize("scoreTxt", 17)
    setObjectCamera('scoreTxt', 'other')
    setProperty("scoreTxt.x", getProperty('scoreTxt.x') - 380)

    setPropertyFromGroup('opponentStrums', note, 'useRGBShader', 'false');
    setPropertyFromGroup('playerStrums', note, 'useRGBShader', 'false');

    flashing = runHaxeCode([[return ClientPrefs.flashing;]])
    runHaxeCode([[
        var shaderName = "]] .. 'test' .. [[";
        game.initLuaShader(shaderName);
        var shader0 = game.createRuntimeShader(shaderName);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        return;
    ]])

    setProperty('gf.visible', false)
    setProperty('gf.active', false)

    setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 1);
end

local destroyShit = true
function onEvent(name, value1, value2)
    if name == "ending" then
        doTweenAlpha('bye', 'endBlack', 1, 0.8, 'quadInOut')

    end
    if name == "showBars" then
        doTweenY('topTween', 'bar1', -10, value1, 'circOut')
        doTweenY('bottomTween', 'bar2', 630, value1, 'circOut')

    end
    if name == "doTweenZoom" then
        zoomCameraMode = false
        doTweenZoom('Z00M', 'camGame', value1, value2, 'quadInOut')
        setProperty('defaultCamZoom', value1)
    end

    if name == 'Fade' then
        doTweenAlpha('FADEIN', 'FLASH', value1, value2, 'easeType')
    end

    if name == 'Crowd-Appears' then
        doTweenY('crowd-appears', 'crowd', 986, 0.7, 'elasticIn')
    end
    if name == 'Flash' then
        cameraFlash('camGame', 'ffffff', value1, true);
    end

    if name == 'ROLLING-TIME' then
        mikuTime = false;
        mikuTime2 = false;
        setTheShader('')
        setScrollFactor('boyfriend', 0.8, 0.8)
        setCharPos('boyfriend', 916, 378)
        setCharPos('dad', 422, 75)
        setProperty('backRG.visible', not getProperty('backRG.visible'))
        setProperty('piano.visible', not getProperty('piano.visible'))
        setProperty('gradient3.visible', not getProperty('gradient3.visible'))
        setProperty('gradient3.active', not getProperty('gradient3.active'))
        setProperty('piano.active', not getProperty('piano.active'))
        setProperty('backRG.active', not getProperty('backRG.active'))
        ------ TWIM DEACTIVATION
        removeLuaSprite('gradient2', true)
        removeLuaSprite('effect', true)
        removeLuaSprite('bgPink', true)
        removeLuaSprite('world', true)
        -----------------
    end
    if name == 'camera' then
        zoomCameraMode = true
        camDad = value1
        camBf = value2
    end
    if name == 'TWIM-SCREAM' then
        mikuTime2 = true;
        setProperty('mikuSCREAM.visible', true)
        setProperty('mikuSCREAM.active', true)
        zoomCameraMode = true;
        doTweenY('mikuSCREAMING', 'mikuSCREAM', 0, 0.2, 'easeIn')
    end
    if name == 'fixstuff' then
        setScrollFactor('boyfriend', 1, 1)
        setCharPos('dad', 300, 530)
        setCharPos('boyfriend', 1099, 788)
        setProperty('defaultCamZoom', 0.65)
        setTheShader('test')
    end
    if name == 'fixFinal' then
        removeLuaSprite('teto', true)
        removeLuaSprite('neru', true)
        removeLuaSprite('backTB', true)
        setScrollFactor('dad', 1, 1)
        zoomCameraMode = false;
    end

    if name == 'TWIM-ON/OFF' then
        -------------- THE WORLD IS MINE ACTIVATION/DEACTIVATION -------------
        if destroyShit then
            doTweenAlpha('mikuBye', 'mikuSCREAM', 0, 0.35, 'cubeInOut')
        end
        setTheShader('test')
        destroyShit = false
        setProperty('gradient2.visible', not getProperty('gradient2.visible'))
        setProperty('gradient2.active', not getProperty('gradient2.active'))
        setProperty('effect.visible', not getProperty('effect.visible'))
        setProperty('effect.active', not getProperty('effect.active'))
        setProperty('world.visible', not getProperty('world.visible'))
        setProperty('world.active', not getProperty('world.active'))
        setProperty('bgPink.visible', not getProperty('bgPink.visible'))
        setProperty('bgPink.active', not getProperty('bgPink.active'))
        ------------------- CONCERT ACTIVATION/DEACTIVATION ----------------------------
        setProperty('gradient.visible', not getProperty('gradient.visible'))
        setProperty('gradient.active', not getProperty('gradient.active'))
        setProperty('crowd.visible', not getProperty('crowd.visible'))
        setProperty('crowd.active', not getProperty('crowd.active'))
        setProperty('speakerbg.visible', not getProperty('speakerbg.visible'))
        setProperty('speakerbg.active', not getProperty('speakerbg.active'))
        setProperty('base.visible', not getProperty('base.visible'))
        setProperty('base.active', not getProperty('base.active'))
        setProperty('backBase.visible', not getProperty('backBase.visible'))
        setProperty('backBase.active', not getProperty('backBase.active'))
        setProperty('back.visible', not getProperty('back.visible'))
        setProperty('back.active', not getProperty('back.active'))
        if value1 == 'destroyShit' then
            mikuTime = true
            zoomCameraMode = false;
            removeLuaSprite('gradient2', true)
            removeLuaSprite('effect', true)
            removeLuaSprite('bgPink', true)
            removeLuaSprite('world', true)
            removeLuaSprite('piano', true)
            removeLuaSprite('gradient3', true)
            removeLuaSprite('backRG', true)
        end
    end
    if name == 'Baka' then
        setTheShader('')
        zoomCameraMode = true;
        camDad = 1.2
        camBf = 1.4
        camBfOffset = -800;
        setProperty('teto.visible', true)
        setProperty('teto.active', true)
        setProperty('backTB.visible', true)
        setProperty('teto.active', true)
        setProperty('neru.active', true)
        setProperty('neru.visible', true)
        setProperty('defaultCamZoom', 1.2)
        setScrollFactor('dad', 1.2, 1.2)
        setProperty('dad.x', 537)
        setProperty('dad.y', 192)
        setProperty('boyfriend.x', 344)
        setProperty('boyfriend.y', 378)

        setProperty('gradient.visible', not getProperty('gradient.visible'))
        setProperty('gradient.active', not getProperty('gradient.active'))
        setProperty('crowd.visible', not getProperty('crowd.visible'))
        setProperty('crowd.active', not getProperty('crowd.active'))
        setProperty('speakerbg.visible', not getProperty('speakerbg.visible'))
        setProperty('speakerbg.active', not getProperty('speakerbg.active'))
        setProperty('base.visible', not getProperty('base.visible'))
        setProperty('base.active', not getProperty('base.active'))
        setProperty('backBase.visible', not getProperty('backBase.visible'))
        setProperty('backBase.active', not getProperty('backBase.active'))
        setProperty('back.visible', not getProperty('back.visible'))
        setProperty('back.active', not getProperty('back.active'))
    end
end
local allowCountdown = false
function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then -- Block the first countdown
        startVideo('mikumodcutscene');
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('thx4playingmockup')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end

local danced = false;
function onBeatHit(...)
    danced = not danced
    if flashing then
        playAnimations('base', 'bump', true)
    end

    if curBeat % 2 == 0 then
        playAnimations('teto', 'idle', true)
        playAnimations('neru', 'idle', true)
        playAnimations('crowd', 'bump', true)
    end

    playAnimations('speakerbg', 'speakerbg', true)
    playAnimations('effect', 'bump', true)

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
function setCameraPos(x, y, forced, quick)
    setProperty('camFollow.x', x)
    setProperty('camFollow.y', y)
    if quick then
        setProperty('cameraSpeed', 10000)
    end
    runTimer('wee', 0.1)
    if forced then
        triggerEvent('Camera Follow Pos', x, y)
    else
        triggerEvent('Camera Follow Pos', '', '')
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

