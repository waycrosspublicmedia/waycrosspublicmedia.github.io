function onCreate()
	precacheSound('crash');
	
	makeAnimatedLuaSprite('bgf','hous/lobotomy/logodomy/bgfire', -4700, -2315)
	addAnimationByPrefix('bgf','fire','bgfire inthehole', 18, true)
	scaleObject('bgf', 4.5, 4.5)

	makeLuaSprite('gr', 'hous/lobotomy/logodomy/ground', -4500, 170);
	scaleObject('gr', 2.5, 2)

	makeLuaSprite('fith', 'hous/lobotomy/fith', -450, -100);
	setScrollFactor('fith', 0.75, 0.75);

	makeLuaSprite('fith2', 'hous/lobotomy/fith', -2250, 400);
	setScrollFactor('fith2', 1.2, 1.2);
	scaleObject('fith2', 2.5, 2.5)

	addLuaSprite('bgf', false);
	addLuaSprite('fith', false);
	addLuaSprite('gr', false);
	addLuaSprite('fith2', true);
	
    makeLuaText('credits', 'Song cover - IMPENDING DOOM',0, -400, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 20);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'Composed by - Noichi',0, -400, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 20);
    setProperty('credits.color2', getColorFromHex('FFFFFF'))
end
function onCountdownStarted()
	setProperty('health', 2)
    setProperty('camHUD.alpha',0)
	setProperty('healthBar.alpha',0)
	setProperty('healthBarBG.alpha',0)
end
function onUpdatePost()
	if getProperty('health') > 1.6 then
		setHealthBarColors("bb0000", getIconColor("bf")) 
	else
		setHealthBarColors(getIconColor("dad"), getIconColor("bf"))
	end
end
function onUpdate()
	setTextString('scoreBar','FIRE IN THE HOLE - MISSES - '..misses)
	setTextString('cornerMark','FIRE IN THE HOLE - v'..version)
	setProperty('scoreBar.x', getProperty('iconP1.x')-650)
	if curStep == 32 then
        doTweenAlpha('hudhihi','camHUD',1,1,'quadInOut')
    end
    if curBeat == 9 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1, "quartOut")
	end
	if curBeat == 17 then
		doTweenY('credi', "credits", 900, 2, "quartIn")
        doTweenAngle('credi3', 'credits', 50, 2, "quartIn")
	end
    if curBeat == 18 then
		doTweenY('credi2', "credits2", 900, 2, "quartIn")
        doTweenAngle('credi4', 'credits2', -40, 2, "quartIn")
	end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
    cameraShake('game', 0.02, 0.1)
	cameraShake('hud', 0.005, 0.1)
	health = getProperty('health')
	if getProperty('health') > 0.1 then
        setProperty('health', health- 0.03);
    end
end

local songSpeed = 1
function onCreatePost()
    initLuaShader('heatwaveShader')
    makeLuaSprite('heat', 'heatwave')
    makeLuaSprite('heatwaveShader')
    setSpriteShader('heatwaveShader', 'heatwaveShader')
    setShaderSampler2D('heatwaveShader', 'distortTexture', 'polus/heatwave')
    runHaxeCode([[setVar('heatwaveShader', game.getLuaObject('heatwaveShader').shader);]])

    initLuaShader('ChromaticAbberation')
    makeLuaSprite('ChromaticAbberation')
    setSpriteShader('ChromaticAbberation', 'ChromaticAbberation')
    runHaxeCode([[setVar('ChromaticAbberation', game.getLuaObject('ChromaticAbberation').shader);]])
    runHaxeCode([[getVar('ChromaticAbberation').setFloat('amount', -0.34);]])

    runHaxeCode([[game.camGame.setFilters([new ShaderFilter(getVar('heatwaveShader')), new ShaderFilter(getVar('ChromaticAbberation'))]);]])

    runTimer('ember', 0.1)
    songSpeed = playbackRate
    -- followchars = false
end
local fadeTime = 0.75 -- i found you fader!
local heartyID = 0
local heartyName = ''
-- local alivePar = {}
local lifespan = 0
local heartEmitter = {-900, 1000}
local particleWidth = 2500.45
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ember' then
        runTimer('ember', getRandomFloat(0.3, 0.4))
        -- debugPrint(heartyID)
        heartyID = heartyID + 1
        heartyName = 'ember'..heartyID
        lifespan = getRandomFloat(4.0, 4.5) / songSpeed
        makeAnimatedLuaSprite(heartyName, 'hous/lobotomy/logodomy/ember', heartEmitter[1] + getRandomFloat(0-particleWidth, particleWidth), heartEmitter[2])
        addAnimationByPrefix(heartyName, 'ember', 'ember')
        scaleObject(heartyName, 1.75, 1.75)
        setProperty(heartyName..'.velocity.x', getRandomFloat(-50, 50) * songSpeed)
        setProperty(heartyName..'.velocity.y', getRandomFloat(-400, -800) * songSpeed)
        setProperty(heartyName..'.scale.x', getRandomFloat(0.5, 0.3) * songSpeed)
        setProperty(heartyName..'.scale.y', getRandomFloat(0.5, 0.3) * songSpeed)
        playAnim(heartyName, 'ember', true, false, getRandomInt(0,9))
        addLuaSprite(heartyName, true)
        doTweenX('vTweenX'..heartyID, heartyName..'.velocity', getRandomFloat(-100, 100) * songSpeed, lifespan, 'linear')
        doTweenY('vTweenY'..heartyID, heartyName..'.velocity', getRandomFloat(0, -800) * songSpeed, lifespan, 'linear')
        doTweenX('dTweenX'..heartyID, heartyName..'.drag', getRandomFloat(5, 10) * songSpeed, lifespan, 'linear')
        doTweenY('dTweenY'..heartyID, heartyName..'.drag', getRandomFloat(5, 10) * songSpeed, lifespan, 'linear')
        doTweenX('sTweenX'..heartyID, heartyName..'.scale', 0, lifespan, 'linear')
        doTweenY('sTweenY'..heartyID, heartyName..'.scale', 0, lifespan, 'linear')
        -- triggerEvent('Camera Follow Pos', getProperty(heartyName..'.x'), getProperty(heartyName..'.y'))
    end
end

local removeHeart = ''
function onTweenCompleted(tag)
    if string.find(tag, 'dTweenY') then
        removeHeart = 'ember'..stringSplit(tag, 'Y')[2]
        removeLuaSprite(removeHeart)
    end
end