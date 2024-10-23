--this sucks ass ik
function checkDisplayFunctions(display)
    stopSound('staticc')

    setProperty('schoool.visible', false)
    doTweenAlpha('overslayyalpha', 'overslayy', 0, 0.5)

    if display == 'omega' then
        setProperty('screen.x', 520)
        setProperty('screen.y', -155)
    elseif display == 'badschoool' then
        setProperty('screen.x', 70)
        setProperty('screen.y', -885) 
    else
        setProperty('screen.x', 520)
        setProperty('screen.y', -90)
    end

    if display == 'stage' or display == 'omega' then
        scaleObject('screen', 0.45, 0.45)
    elseif display == 'badschoool' then
        scaleObject('screen', 4.37,4.57)
    elseif display == 'school' then
        scaleObject('screen', 1.055,1.055)
    else
        scaleObject('screen', 1,1)
    end

    if display == 'teki' then
        setProperty('overslayy.color', getColorFromHex('FF0000'))
        doTweenAlpha('overslayyalpha', 'overslayy', 1, 20)
    end
    if display == 'badschoool' then
        setProperty('overslayy.color', getColorFromHex('6500FF'))
        setProperty('schoool.visible', true)
        changeNoteskin('noteSkins/NOTE_assets', true)
        doTweenAlpha('overslayyalpha', 'overslayy', 1, 0.1)
    end
    if display == 'static' then
        playSound('static', 0.1, 'staticc')
        soundFadeIn('staticc', 1, 0, 0.1)
    end
end

function changeNoteskin(skin, pixel)
    pixel = pixel or false
    if pixel then 
        runHaxeCode('PlayState.stageUI = "pixel";')
    else
        runHaxeCode('PlayState.stageUI = "normal";')
    end
    for i = 0, getProperty('playerStrums.length')-1 do
        setPropertyFromGroup('playerStrums', i, 'texture', skin);
    end
    for i = 0, getProperty('opponentStrums.length')-1 do
        setPropertyFromGroup('opponentStrums', i, 'texture', skin);
    end
    for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'texture', skin);
    end
    for i = 0, getProperty('notes.length')-1 do
        setPropertyFromGroup('notes', i, 'texture', skin);
    end  
end


local displays = {}
local curDisplay = displays[1]
function changeDisplay(index)
    playAnim('screen', displays[index])
    checkDisplayFunctions(displays[index])
    curDisplay = displays[index]
end

function onSoundFinished(t)
	if t == 'staticc' then
        playSound('static', 0.1, 'staticc')
    end
end

runHaxeCode([[
	createGlobalCallback("outer_changeDisplay", function(index:Int) {parentLua.call("changeDisplay", [index]);});
]])

local order
local pablos = 0
function createSprite(tag, image, x, y, animated)
    animated = animated or false
    if animated then
        makeAnimatedLuaSprite(tag, image, x, y)
    else
        makeLuaSprite(tag, image, x, y)
    end
    pablos = pablos + 1
    order = getObjectOrder('gf')+pablos
    setObjectOrder(tag, order)
end

local path = 'stages/outer/'
function onCreatePost()
    createSprite('liquidBg', path..'noshader', -640, -380)
    scaleObject('liquidBg', 3, 2)
    if shadersEnabled then
        initLuaShader('liquid')
        setSpriteShader('liquidBg', 'liquid')
    end
    setScrollFactor('liquidBg', 0.2,0.2)

    createSprite('wall', path..'thing', -700, -800)
    setScrollFactor('fortnite', 0.95,0.95)

    createSprite('border', path..'border', 400, -160, true)
    addAnimationByPrefix('border', 'idle', 'boarder')

    --SCREENS

    createSprite('screen', path..'screens', 520, -90, true)
    addAnimationByPrefix('screen', 'stage', 'stage')                        
    addAnimationByPrefix('screen', 'static', 'screen transition')           
    addAnimationByPrefix('screen', 'teki', 'screen teki event')             
    addAnimationByPrefix('screen', 'badschoool', 'background 2 instance 1') 
    addAnimationByPrefix('screen', 'school', 'school')                      
    addAnimationByPrefix('screen', 'canhead', 'screen supac')                        
    if flashingLights then
        addAnimationByPrefix('screen', 'omega', 'screen omega')             
    else
        addAnimationByPrefix('screen', 'omega', 'screen omega', 24, false) 
    end
    addLuaSprite('screen')

    table.insert(displays, 'stage')         --1
    table.insert(displays, 'static')        --2
    table.insert(displays, 'teki')          --3
    table.insert(displays, 'badschoool')    --4
    table.insert(displays, 'school')        --5
    table.insert(displays, 'canhead')       --6
    table.insert(displays, 'omega')         --7

    createSprite('popups', path..'popups', 520, -90, true)
    addAnimationByPrefix('popups', '1', '1', 24, false) addOffset('popups', '1', -30, -180)
    addAnimationByPrefix('popups', '2', '2', 24, false) addOffset('popups', '2', -30, -450)
    addAnimationByPrefix('popups', '3', '3')            addOffset('popups', '3', -900, -70)
    addAnimationByPrefix('popups', '4', '4', 24, false) addOffset('popups', '4', 300, 300)
    addAnimationByPrefix('popups', '5', '5', 24, false) addOffset('popups', '5', -20, -100)
    addAnimationByPrefix('popups', '6', '6')            addOffset('popups', '6', 0, -300)
    setProperty('popups.visible', false)

    initLuaShader("skew")
    createSprite('floor', path..'floor', -590, 634)
    setSpriteShader('floor', "skew")

    createSprite('bg', path..'bg', -568, -580)

    createSprite('fortnite', path..'fortnite', -480, -170)
    setScrollFactor('fortnite', 1.05,1.05)

    makeLuaSprite('overslayy', nil, 0, 00)
    makeGraphic('overslayy', 1280, 720, 'FFFFFF')
    setObjectCamera('overslayy', 'other')
    setBlendMode('overslayy', 'multiply')
    setProperty('overslayy.alpha', 0)
    addLuaSprite('overslayy')

    setScrollFactor('gf', 1.07,1.07)
    setScrollFactor('boyfriend', 1.1,1.1)
    setScrollFactor('dad', 1.1,1.1)
    if songName:lower() == 'teki' then
        changeDisplay(1)
    elseif songName:lower() == 'supacute' then
        changeDisplay(6)
        setProperty('camHUD.visible', false)
    else
        changeDisplay(2)
        setProperty('camHUD.visible', false)
    end

    nc_set_target('screen', 1183, 273)
end

function playPopup(index)
    setProperty('popups.visible', (index ~= '0')) 
    playAnim('popups', index, true)
end

local eyes = {}
function spawnEye(x,y)
    x = x or 0
    y = y or 0
    local tag = 'eye'..#eyes+1,
    createSprite(tag, path..'eyes', 520+x, -90+y, true)
    addAnimationByPrefix(tag, 'spawn', 'eye', 24, false)
    playAnim(tag, 'spawn', true)
    debugPrint('hola')
    --runTimer(tag..'unspawn', 0.6)
end

function onEvent(n,v1,v2)
    if n == 'screen_display' then
        changeDisplay(tonumber(v1))
    end
    if n == 'screen_popup' then
        playPopup(v1)
    end
    if n == 'screen_eye' then
        spawnEye(tonumber(v1),tonumber(v2))
    end
    if n == 'screen_noteskin' then
        changeNoteskin(v1, (v2 == 'true'))
        if v1 == 'greynotes' then
            runHaxeCode([[
                for (i in notes.members) {
                    i.rgbShader.enabled = false;
                }
                for (i in unspawnNotes) {
                    i.rgbShader.enabled = false;
                }
            ]])
        else 
            runHaxeCode([[
                for (i in notes.members) {
                    i.rgbShader.enabled = true;
                }
                for (i in unspawnNotes) {
                    i.rgbShader.enabled = true;
                }
            ]])
        end
    end
end

if shadersEnabled then
    function onUpdate()
        setShaderFloat('floor','skew',(getProperty('camGame.scroll.x')-560)/4800)
        setShaderFloat('liquidBg', 'iTime', os.clock()/5)
    end
end

if songName:lower() ~= 'supacute' then
    if not isStoryMode or isStoryMode and seenCutscene and songName:lower() == 'teki' then
        local startvro = false
        function onStartCountdown()
            if not startvro then
                startvro = true
                runTimer('startingvro', 1)
                return Function_Stop
            end
            return Function_Continue
        end
    end
end

function onSongStart()
    changeDisplay(1)
end

function onTimerCompleted(t,l,ll)
    if t == 'startingvro' then
        setProperty("skipCountdown", true)
        startCountdown()
    end
    for i = 1, #eyes do
        if t == 'eye'..i..'unspawn' then
            removeLuaSprite('eye'..i)
        end
    end
end