function onCreate()
    makeLuaSprite('BG', 'birthdayBG', -350, -300);
	addLuaSprite('BG', false);
	setLuaSpriteScrollFactor('BG',0.8,0.8)
    scaleObject('BG', 0.8, 1)
    setProperty('BG.alpha', 0.5)

    makeLuaSprite('redBG', '', 0, 0);
	makeGraphic('redBG',screenWidth*1.5,screenHeight*1.5,'ff0000')
	addLuaSprite('redBG', true);
    setObjectCamera('redBG', 'hud')
    setBlendMode('redBG', 'screen')
    setProperty('redBG.alpha', 0)

    makeLuaSprite('radBG', '', 0, 0);
	makeGraphic('radBG',screenWidth*1.5,screenHeight*1.5,'ffffff')
	addLuaSprite('radBG', false);
    setProperty('radBG.alpha', 0)
	setLuaSpriteScrollFactor('radBG',0,0)
	setProperty('radBG.scale.x',2)
	setProperty('radBG.scale.y',2)

end

function onCreatePost()
    setObjectOrder('redBG', getObjectOrder('letterbox')-1)
end

function onEvent(n)

end

function onStepHit()
    if curStep == 1182 then
        setBlendMode('redBG', 'darken')
    elseif curStep == 1440 then
        setBlendMode('redBG', 'screen')
    end
end

