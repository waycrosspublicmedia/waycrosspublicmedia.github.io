function onCreate()
    gay = getRandomInt(1, 20)

if gay == 1 then

    
    setProperty('camHUD.visible', 0)

    
	makeLuaSprite('smooch', 'kiss', -0, 300);
    setProperty('smooch.alpha', 0)
	scaleObject('smooch', 2.5, 2.5);
    setScrollFactor('smooch',1,1)
    addLuaSprite('smooch', true);

    function onCountdownTick(counter)
        if counter == 2 then

         doTweenX('FFkiss', 'boyfriend', 0, 2, 'backIn')
         doTweenX('FNBkiss', 'dad', 0, 2, 'backIn')

        end

        -- there is suppossed to be an easter egg here so like if oyu see this its because there was suippossed to be an easter egg here
    end




else


    makeLuaSprite('flashstart', '', 0, 0);
    makeGraphic('flashstart',1500,900,'000000')
      setScrollFactor('flashstart',0,0)
      setProperty('flashstart.scale.y',2)
      setProperty('flashstart.scale.x',2)
      setProperty('flashstart.alpha',1)
      addLuaSprite('flashstart', true);
    setProperty('flashstart.alpha',0)

    makeAnimatedLuaSprite('ff', 'bitch', 1300, -0)addAnimationByPrefix('ff','the bopping','the bopping',24,false)
	setScrollFactor('ff', 0, 0);
	scaleObject('ff', 0.6, 0.6);
    addLuaSprite('ff', true);

    makeAnimatedLuaSprite('fnb', 'fucker', -800, -0)addAnimationByPrefix('fnb','the bopping','the bopping',24,false)

	setScrollFactor('fnb', 0, 0);
	scaleObject('fnb', 0.6, 0.6);
    addLuaSprite('fnb', true);

    makeLuaSprite('vs', 'vs_sign', 500, -400)
	setScrollFactor('vs', 0, 0);
	scaleObject('vs', 1.5, 1.5);
    addLuaSprite('vs', true);
    setProperty('vs.antialiasing',false) 


    setProperty('camHUD.visible', 0)

    makeLuaSprite('whiteflashstart', '', 0, 0);
    makeGraphic('whiteflashstart',1500,900,'ffffff')
      setScrollFactor('whiteflashstart',0,0)
      setProperty('whiteflashstart.scale.y',2)
      setProperty('whiteflashstart.scale.x',2)
      setProperty('whiteflashstart.alpha',1)
      addLuaSprite('whiteflashstart', true);
    setProperty('whiteflashstart.alpha',0)

end
end

function onUpdate()

    if curBeat == 2 then
    doTweenAlpha('hello','flashstart',0.8,0.4,'cubeIn')
    doTweenX('movementstart', 'ff', 700, 0.4, 'backIn')
    doTweenAngle('movementvs', 'vs', 360, 0.5, 'backOut')
    doTweenY('movemenfallvs', 'vs', 400, 0.6, 'backOut')
    doTweenX('movementevilstart', 'fnb', -100, 0.4, 'backIn')
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
     setProperty('vs.angle', 15)
     doTweenAngle('beatvs', 'vs', 0, 0.8, 'backOut')
     objectPlayAnimation('fnb','the bopping',true)
     objectPlayAnimation('ff','the bopping',true)
    end
end


function onTweenCompleted(tag)
    if tag == 'FFkiss' then
        setProperty('boyfriend.alpha', 0)
        setProperty('dad.alpha', 0)
        setProperty('smooch.alpha', 1)
        playSound('smooch', 1)
        runTimer('smoochend', 1)
    end
    if tag == 'movementstart' then
        playSound('smash', 0.8);
        runTimer('hello', 7) 
        setProperty('whiteflashstart.alpha',1)
        doTweenAlpha('whitebye','whiteflashstart',0,0.5,'cubeIn')
    end
end 

function onTimerCompleted(tag)
    if tag == 'smoochend' then
        setProperty('health', 0)
    end
    if tag == 'hello' then
        doTweenX('movementbye', 'ff', 1500, 0.3, 'cubeIn')
        doTweenX('movementevilbye', 'fnb', -1100, 0.3, 'cubeIn')
        playSound('swoosh', 0.7);
        setProperty('camHUD.visible', 1)
        doTweenAlpha('bye','flashstart',0,0.3,'cubeIn')
        doTweenY('movemenfallvsback', 'vs', 800, 0.5, 'backIn')
        setProperty('defaultCamZoom',0.6)
        runTimer('bye', 2) 
    end
    if tag == 'bye' then
        setProperty('ff.visible', false)
        setProperty('fnb.visible', false)
        setProperty('vs.visible', false)
    end
end

