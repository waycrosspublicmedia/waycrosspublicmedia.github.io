local check = false

function onCreate() 
    if isStoryMode and not seenCutscene and shadersEnabled then
        check = true 
    end 
end

function onStartCountdown()
    if isStoryMode then
        if check and not checking and not seenCutscene then
            setProperty("inCutscene", true)
            checking = true
            return Function_Stop
        end
	return Function_Continue
    end
end

local dotTimer = 0.5
function onCreatePost()
    if check then
        makeLuaSprite('blakScrn', nil, 0,0)
        makeGraphic('blakScrn', 1,1,'000000') 
        scaleObject('blakScrn', screenWidth, screenHeight)
        setObjectCamera('blakScrn', 'other')
        addLuaSprite('blakScrn')

        playMusic('offsetSong', 0.5, true)

        makeLuaText('checkingTxt', 'Testing Shaders', 0, 10, screenHeight-70)
        setObjectCamera('checkingTxt', 'other')
        setTextSize('checkingTxt', 30)
        addLuaText('checkingTxt')
        runTimer('checkTxt1', dotTimer)

        makeLuaText('instructions', 'In case the game crashes, please try turning off the Shaders option in\nOptions > Graphics > Shaders', 600, screenWidth-600, screenHeight-100)
        setObjectCamera('instructions', 'other')
        setTextSize('instructions', 25)
        addLuaText('instructions')

        runTimer('startTest', 7)
    end
end

local readied = false
local txtSine = 0
function onUpdate(elapsed)
    if not readied then
        txtSine = txtSine + 180 * elapsed
        setProperty('checkingTxt.alpha', 1 - math.sin((math.pi * txtSine) / 180))
        setProperty('instructions.alpha', 1 - math.sin((math.pi * txtSine) / 180))
    end
end

function onTimerCompleted(t,l,ll)
    if not readied then
        if t == 'checkTxt0' then
            setTextString('checkingTxt', 'Testing Shaders')
            runTimer('checkTxt1', dotTimer)
        end
        if t == 'checkTxt1' then
            setTextString('checkingTxt', 'Testing Shaders.')
            runTimer('checkTxt2', dotTimer)
        end
        if t == 'checkTxt2' then
            setTextString('checkingTxt', 'Testing Shaders..')
            runTimer('checkTxt3', dotTimer)
        end
        if t == 'checkTxt3' then
            setTextString('checkingTxt', 'Testing Shaders...')
            runTimer('checkTxt0', dotTimer)
        end
    end

    if t == 'startTest' then
        makeLuaSprite("tester") makeGraphic("tester", screenWidth, screenHeight) 
        initLuaShader('liquid') setSpriteShader("tester", "liquid")
        runHaxeCode([[
            game.camHUD.setFilters([
                new ShaderFilter(game.getLuaObject("tester").shader)
            ]);    
        ]])
        initLuaShader('skew') setSpriteShader("tester", "skew")
        runTimer('checkready', 0.1)
    end
    if t == 'checkready' then
        readied = true
        runHaxeCode([[game.camHUD.setFilters([]);]])
        setTextString('checkingTxt', 'Ready')
        setProperty('checkingTxt.alpha', 1)
        setProperty('instructions.alpha', 1)
        playMusic('gameOverEnd', 0.5)
        runTimer('chekoutro', 2)
    end
    if t == 'chekoutro' then
        doTweenAlpha('checkingTxtsalpha', 'checkingTxt', 0, 1)
        doTweenAlpha('instructionsalpha', 'instructions', 0, 1)
        runTimer('chekoutro1', 2)
    end
    if t == 'chekoutro1' then
        doTweenAlpha('blakScrnAlph', 'blakScrn', 0, 1)
        runTimer('startshit', 1.3)
    end
    if t == 'startshit' then
        startCountdown()
    end
end