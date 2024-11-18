local flippedSongs = {'go-crazy'} 
local iconP1Offset = 50 
local iconP2Offset = -50 

local reverseP1Offset = 100 
local reverseP2Offset = -100 

local girderAlpha = 1
function onCreatePost()

    makeLuaSprite('healthbarCustom1','tvbar',0, 580)
    screenCenter("healthbarCustom1", 'x')
    addLuaSprite("healthbarCustom1")
    setObjectCamera("healthbarCustom1", "camHUD")

    makeLuaSprite('healthbarCustom2','tvbar2',0, 580)
    setObjectCamera("healthbarCustom2", "camHUD")
    screenCenter("healthbarCustom2", 'x')
    addLuaSprite("healthbarCustom2")


    defaultWidth = getProperty("healthbarCustom1.width")
    defaultheight = getProperty("healthbarCustom1.height")

    setProperty("healthBar.visible", false)
    setProperty("healthBarBG.visible", false)
    if flipBar then
        makeLuaSprite('lightOverlay','tvbar2',0, 580)
        setProperty("healthbarCustom1.color", getColorFromHex(dadColor()))
        setProperty("healthbarCustom2.color", getColorFromHex(bfColor()))
        setFrame('healthbarCustom2','width',defaultWidth*(getHealth()/2))
    else
        makeLuaSprite('lightOverlay','tvbar',0, 580)
        setFrame('healthbarCustom2','width',defaultWidth-(defaultWidth*(getHealth()/2)))
        setProperty("healthbarCustom1.color", getColorFromHex(bfColor()))
        setProperty("healthbarCustom2.color", getColorFromHex(dadColor()))
    end
    setObjectCamera("lightOverlay", "camHUD")
    screenCenter("lightOverlay", 'x')
    addLuaSprite("lightOverlay")
    setBlendMode("lightOverlay", "screen")

    originalP1width = getProperty("iconP1.width")
    originalP2width = getProperty("iconP2.width")

    originalP1height = getProperty("iconP1.height")
    originalP2height = getProperty("iconP2.height")

    setProperty('lightOverlay.flipX', true)
    setProperty('healthbarCustom1.flipX', true)
    setProperty('healthbarCustom2.flipX', true)

    setObjectOrder('shader', 1)
    setObjectOrder('healthBarBG', 2)
    setObjectOrder('healthBar', 3)
    setObjectOrder('healthbarCustom1', 4)
    setObjectOrder('healthbarCustom2', 5)
    setObjectOrder('healthbarCustom2', 6)


    if downscroll then
        setProperty("lightOverlay.y", 0)
        setProperty("healthbarCustom1.y", 0)
        setProperty("healthbarCustom2.y", 0)
    end

end
function dadColor()
    return rgbToHex(getProperty('dad.healthColorArray'))
end
function bfColor()
    return rgbToHex(getProperty('boyfriend.healthColorArray'))
end
function rgbToHex(rgb)
    return string.format('%02x%02x%02x', math.floor(rgb[1]), math.floor(rgb[2]), math.floor(rgb[3]))
end
function onUpdatePost(elapsed)
    setProperty('iconP1.y',getProperty('healthbarCustom1.y')+((defaultheight/2)-(getProperty('iconP1.height')/2)/2)-25)
    setProperty('iconP2.y',getProperty('healthbarCustom1.y')+((defaultheight/2)-(getProperty('iconP2.height')/2)/2)-25)
    if flipBar then
        setProperty("lightOverlay.color", getProperty(getProperty('healthbarCustom2.color')))
        if getFrame('healthbarCustom2','width') > defaultWidth-2 then
            setProperty("healthbarCustom1.alpha", 0)
            setProperty("lightOverlay.visible", true)
        else
            setProperty("healthbarCustom1.alpha", 1)
            setProperty("lightOverlay.visible", false)
        end
        setProperty("iconP1.x", getProperty('healthbarCustom2.x')+getFrame('healthbarCustom2','width')-originalP2width-(getProperty("iconP1.width")/2)+reverseP1Offset)
        setProperty("iconP2.x", getProperty('healthbarCustom2.x')+getFrame('healthbarCustom2','width')+(getProperty('iconP2.width')/2)+reverseP2Offset)
        if getFrame('healthbarCustom2','width') > (defaultWidth*(getHealth()/2)) then
            setFrame('healthbarCustom2','width',(getFrame('healthbarCustom2','width')-(getFrame('healthbarCustom2','width')-((defaultWidth*(getHealth()/2))))/5))
        elseif getFrame('healthbarCustom2','width') < (defaultWidth*(getHealth()/2)) then
            setFrame('healthbarCustom2','width',(getFrame('healthbarCustom2','width')+((defaultWidth*(getHealth()/2))-getFrame('healthbarCustom2','width'))/5))
        end
    else
        setProperty("lightOverlay.color", getProperty(getProperty('healthbarCustom1.color')))
        if getFrame('healthbarCustom2','width') < 2 then
            setProperty("healthbarCustom2.alpha", 0)
            setProperty("lightOverlay.visible", true)
        else
            setProperty("lightOverlay.visible", false)
            setProperty("healthbarCustom2.alpha", 1)
        end
        setProperty("iconP1.x", getProperty('healthbarCustom2.x')+getFrame('healthbarCustom2','width')-originalP1width+(getProperty("iconP1.width")/2)+iconP1Offset)
        setProperty("iconP2.x", getProperty('healthbarCustom2.x')+getFrame('healthbarCustom2','width')-(getProperty('iconP2.width')/2)+iconP2Offset)
        if getFrame('healthbarCustom2','width') > defaultWidth-(defaultWidth*(getHealth()/2)) then
            setFrame('healthbarCustom2','width',(getFrame('healthbarCustom2','width')-(getFrame('healthbarCustom2','width')-(defaultWidth-(defaultWidth*(getHealth()/2))))/5))
        elseif getFrame('healthbarCustom2','width') < defaultWidth-(defaultWidth*(getHealth()/2)) then
            setFrame('healthbarCustom2','width',(getFrame('healthbarCustom2','width')+(defaultWidth-(defaultWidth*(getHealth()/2))-getFrame('healthbarCustom2','width'))/5))
        end
    end
    
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    setProperty('iconP1.x', x2)
    setProperty('iconP2.x', x1)
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
    --setFrame('healthbarCustom2','width',(defaultWidth-(defaultWidth*(getHealth()/2)))/getFrame('healthbarCustom2','width'))
end

function getFrame(tag,type)
    return getProperty(tag..'._frame.frame.'..type)
end

function setFrame(tag,type,value)
    setProperty(tag..'._frame.frame.'..type,value)
end

---
--- @param eventName string
--- @param value1 string
--- @param value2 string
---
function onEvent(eventName, value1, value2)
    if eventName == 'Change Character' then
        if flipBar then
            doTweenColor('changeColor1','healthbarCustom1',dadColor(),0.5,'expoOut')
            doTweenColor('changeColor2','healthbarCustom2',bfColor(),0.5,'expoOut')
        else
            doTweenColor('changeColor1','healthbarCustom1',bfColor(),0.5,'expoOut')
            doTweenColor('changeColor2','healthbarCustom2',dadColor(),0.5,'expoOut')
        end
    end
end

function onBeatHit()
    if flipBar then
        setProperty("iconP1.angle", 5)
        setProperty("iconP2.angle", -5)
    else
        setProperty("iconP1.angle", -5)
        setProperty("iconP2.angle", 5)
    end
    for i = 1,2 do
        doTweenAngle("assReturn"..i, "iconP"..i, 0, 0.3, "sineOut")
    end
    setProperty("lightOverlay.alpha", 0.75)
    doTweenAlpha("flashOut", "lightOverlay", 0, 0.5/playbackRate, "sineOut")
end
