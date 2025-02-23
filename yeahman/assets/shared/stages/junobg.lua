--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
    makeLuaSprite('bg', 'stages/neeb/bulletin', 100, 0);
    makeLuaSprite("vig", "yeahvignette", -400 , -200);
    scaleObject("bg", 2.0, 2.0);
    scaleObject("vig", 0.45, 0.45);
    addLuaSprite('bg', false);
    addLuaSprite("vig", true);
    setScrollFactor("vig", 0.0, 0.0);
end



function onUpdate()
    setProperty("bg.antialiasing", false)
    setProperty('gf.visible', false)
    end
    