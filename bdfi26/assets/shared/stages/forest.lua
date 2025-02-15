local speed = -100
local amount = 0

function onSongStart()
    setProperty('camZooming', true)
    setProperty('isCameraOnForcedPos', true)
    setProperty('cameraSpeed',1000)
    setProperty('camFollow.x',getProperty('boyfriend.x')-200)
    setProperty('camFollow.y',getProperty('boyfriend.y')-100)
    setProperty('camGame.zoom',3)
	doTweenX('camX3', 'camFollow',getProperty('boyfriend.x')-60,12,'cubeInOut')
	doTweenY('camY4', 'camFollow',getProperty('boyfriend.y')+100,13.5,'cubeInOut')
    doTweenZoom('camGamehihi2','camGame',getProperty('defaultCamZoom'),14.5,'cubeInOut')
    
end

function onCreate() 
setProperty('dad.visible',false)
setProperty('camHUD.alpha',0)

makeLuaSprite('flash', '', 0, 0);
setProperty('flash.visible',false)
  addLuaSprite('flash',false);

	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

    createInstance('floor', 'flixel.addons.display.FlxBackdrop', {nil, 0x01})
    loadGraphic('floor', 'backgrounds/whos-there/forestfloor')
    setProperty('floor.velocity.x', speed);
    setProperty('floor.y', 650)
    addInstance('floor')
    scaleObject('floor',1.6,1.6)

    createInstance('trees2', 'flixel.addons.display.FlxBackdrop', {nil, 0x01})
    loadGraphic('trees2', 'backgrounds/whos-there/runningtreesback')
    setProperty('trees2.velocity.x', speed);
    setProperty('trees2.y', -200)
    addInstance('trees2')
    setScrollFactor('trees2',0.95,0.95)

    scaleObject('trees2',2,2)

    createInstance('trees1', 'flixel.addons.display.FlxBackdrop', {nil, 0x01, -150})
    loadGraphic('trees1', 'backgrounds/whos-there/runningtreesfront')
    setProperty('trees1.velocity.x', speed);
    setProperty('trees1.y', -100)
    addInstance('trees1')
    scaleObject('trees1',2,2)

    createInstance('floore', 'flixel.addons.display.FlxBackdrop', {nil, 0x01})
    loadGraphic('floore', 'backgrounds/whos-there/bfdia 5b floor')
    setProperty('floore.velocity.x', speed);
    addInstance('floore')
    setProperty('floore.y', 950)
    scaleObject('floore',2,2)
setProperty('floore.alpha',0.0001)

    makeAnimatedLuaSprite('walklegs', 'characters/walkinglegss',995,903)
    addAnimationByPrefix('walklegs', 'walk', 'walkinglegs',24,true)
    addLuaSprite('walklegs',false)
    setProperty('walklegs.visible',true)

    makeAnimatedLuaSprite('runlegs', 'characters/runninghattylegs',995,904.5)
    addAnimationByPrefix('runlegs', 'run', 'runninglegs',24,true)
    addLuaSprite('runlegs',false)
    setProperty('runlegs.visible',false)

    makeLuaSprite('v', 'backgrounds/whos-there/vignette',0,0)
	setProperty('v.alpha',0.35)
    scaleObject('v',0.75,0.75)
	setObjectCamera('v','camHUD')
    addLuaSprite('v',false)

    makeLuaSprite('logo', 'rendersnlogos/whostheretitle',0,0)
    scaleObject('logo',0.75,0.75)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)

    makeLuaSprite('el', 'rendersnlogos/evilleafyrender',1350,-250)
    setProperty('el.alpha',0)
    setObjectCamera('el','camHUD')
    addLuaSprite('el',true)
end

function onCreatePost()
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes',i,'alpha',0)
        end
    
    bfstuff = getProperty('boyfriend.x')
    legstuff = getProperty('walklegs.x')
    doTweenX('bfstuff','boyfriend',bfstuff+20,3,'quadInOut')
    doTweenX('legstuff','walklegs',legstuff+20,3,'quadInOut')
    doTweenX('legstuff2','runlegs',legstuff+20,3,'quadInOut')

    setProperty('dad.visible',false)
if (shadersEnabled) then
    initLuaShader("adjustColor");
	initLuaShader('scroll')

    setSpriteShader('trees1','scroll')
    setSpriteShader('trees2','scroll')
    setSpriteShader('floore','scroll')
                
                makeLuaSprite("temporaryShader");
                makeGraphic("temporaryShader", screenWidth, screenHeight);
                
                setSpriteShader("temporaryShader", "adjustColor");
                
                addHaxeLibrary("ShaderFilter", "openfl.filters");
                runHaxeCode([[
                    trace(ShaderFilter);
                    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
                    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
                ]]);
            end
end

function onUpdatePost()
setProperty('camGame.zoom', 1.7)
setShaderFloat('trees1','iTime',os.clock()/speed)
setShaderFloat('trees2','iTime',os.clock()/speed)
setShaderFloat('floore','iTime',os.clock()/speed)

setShaderFloat('temporaryShader','contrast',amount)

amount = getProperty('flash.x')
end

function onEvent(name,v1,v2)
if name == 'Change Character' then
if v1 == 'bf' and v2 == 'runhat' then
    cameraFlash('camGame','000000',1)
    setProperty('runlegs.visible',true)
    setProperty('walklegs.visible',false)
    setProperty('dad.visible',true)
    doTweenX('camX4', 'camFollow',bfstuff+60,3,'quadInOut')
    setProperty('cameraSpeed',1)
    setProperty('isCameraOnForcedPos',true)
    setProperty('floor.velocity.x', -1500);
    setProperty('trees2.velocity.x', -100);
    setProperty('trees1.velocity.x', -1500);
   setProperty('floore.velocity.x', -1500);
elseif v1 == 'bf' and v2 == 'walkhat' then
    setProperty('runlegs.visible',false)
    setProperty('walklegs.visible',true)
    cancelTween('camX4')
    cancelTween('camX5')
    speed = 6
end
end
end

function onBeatHit()
if curBeat % 1 == 0 and getProperty('dad.visible') == true and getProperty("dad.animation.curAnim.name") ~= 'idle-alt' then
    triggerEvent('Play Animation','idle','dad')
    triggerEvent('Add Camera Zoom','','')
	setProperty('v.alpha',1)
    setProperty('flash.x',100)

    runTimer('thestuff',0.355)

    cancelTween('alphav')
    cancelTween('amountdie')

    doTweenAlpha('alphav','v',0.5,0.5,'quadOut')
    doTweenX('amountdie','flash',0,1,'quadOut')
end
end


function onTweenCompleted(tag)
if tag == 'bfstuff' then
    doTweenX('bfstuff2','boyfriend',bfstuff-10,3,'quadInOut')
    doTweenX('legstuff3','walklegs',legstuff-10,3,'quadInOut')
    doTweenX('legstuff4','runlegs',legstuff-10,3,'quadInOut')
elseif tag == 'bfstuff2' then
    doTweenX('bfstuff','boyfriend',bfstuff+20,3,'quadInOut')
    doTweenX('legstuff','walklegs',legstuff+20,3,'quadInOut')
    doTweenX('legstuff2','runlegs',legstuff+20,3,'quadInOut')
elseif tag == 'camX4' and getProperty('dad.visible') == true then
	doTweenX('camX5', 'camFollow',bfstuff-120,3,'quadInOut')
elseif tag == 'camX5' and getProperty('dad.visible') == true then
	doTweenX('camX4', 'camFollow',bfstuff+60,3,'quadInOut')
end
end