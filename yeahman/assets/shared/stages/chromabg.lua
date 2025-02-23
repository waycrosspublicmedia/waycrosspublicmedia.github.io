--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
    setProperty("skipCountdown", true);
    makeLuaSprite('startDark', '',-1000,-1000)
	makeGraphic('startDark', 1, 1, '000000')
    scaleObject('startDark',4000,4000)
	setScrollFactor('startDark', 0, 0);
	

    setProperty("beatsPerZoom",999999999999999999)

    makeLuaSprite('sky', 'stages/chroma/SKY', -800, -980);

    setScrollFactor('sky', 0.2, 0.2);
    
    addLuaSprite('sky', false);

    scaleObject("sky", 1.65, 1.65)

    makeLuaSprite('bg', 'stages/chroma/BG', -200, -480);

    setScrollFactor('bg', 0.7, 0.7);
    
    addLuaSprite('bg', false);

    scaleObject("bg", 1.65, 1.65)

    makeLuaSprite('black', 'stages/chroma/BLACK', 0, 0);
    
    addLuaSprite('black', false);

    scaleObject("black", 1.65, 1.65)

    makeLuaSprite('mg', 'stages/chroma/MG', 0, 0);
    
    addLuaSprite('mg', false);

    scaleObject("mg", 1.65, 1.65)

    makeLuaSprite('fg', 'stages/chroma/FG', 0, 0);
    
    addLuaSprite('fg', true);

    scaleObject("fg", 1.65, 1.65)

    addLuaSprite('Dark', true)

    addLuaSprite('startDark', true)

end

function onCreatePost()
    setProperty("gf.stunned", true)
end


function onUpdate()
    setProperty("defaultCamRotation", 0.5)
end
    
function onStepHit()
    --fade in intro / outro
	
	if curStep == 1 then
		doTweenAlpha('startBlackFade', 'startDark', 0, 12, 'smootherStepInOut')
	end

	if curStep == 1 then
		doTweenZoom('tag', 'camGame', 0.55, 15, 'smootherStepInOut')
	end

    if curStep == 60 then 
        setProperty("defaultCamZoom",  0.55)
    end



    if curStep == 736 then
        setProperty("strumLineNotes.visible",false)
        setProperty("startDark.alpha",1)
        setProperty("comboGroup.visible",false)
        setProperty("healthBarGroup.visible",false)
        
    end
end



function onEvent(eventName, value1, value2, strumTime)
    
    if eventName == 'Play Animation' and value1 == 'bluetooth' and value2 == 'dad' then
        playAnim("gf", "talk")
    end

    if eventName == 'Play Animation' and value1 == 'bump' and value2 == 'dad' then
        setProperty("gf.stunned", false)
    end
end