function onCreate()

makeLuaSprite('wall','scorp/wall',-500, -300)
scaleObject('wall',0.7,0.7)
addLuaSprite('wall',false)
setLuaSpriteScrollFactor('wall',0.1,0.1)

makeLuaSprite('platform','scorp/platform',-340, -160)
scaleObject('platform',0.6,0.6)
addLuaSprite('platform',false)
setLuaSpriteScrollFactor('platform',0.45,0.45)

if not lowQuality then
    makeLuaSprite('gear','scorp/gear',-700, -300)
    scaleObject('gear',0.6,0.6)
    addLuaSprite('gear',false)
    setLuaSpriteScrollFactor('gear',0.9,0.9)
end

makeLuaSprite('floor','scorp/floor',-740, 450)
scaleObject('floor',0.6,0.6)
addLuaSprite('floor',false)
setLuaSpriteScrollFactor('floor',1.0,1.0)

if not lowQuality then
    makeLuaSprite('claw','scorp/claw',-1200, -220)
    scaleObject('claw',0.6,0.6)
    addLuaSprite('claw',false)
    setLuaSpriteScrollFactor('claw',1.4,1.2)

    makeLuaSprite('wires','scorp/wires',-800, -200)
    scaleObject('wires',0.8,0.8)
    addLuaSprite('wires',false)
    setLuaSpriteScrollFactor('wires',0.4,0.3)
end

doTweenAlpha('NoBitches','gfGroup',0,0.01,'linear')

if dadName == 'scorp' then

makeLuaSprite('shader','scorp/shader',-1800, -800)
addLuaSprite('shader',false)
setLuaSpriteScrollFactor('shader',1.0,1.0)
setProperty('shader.alpha', 0.75);
setBlendMode('shader', 'multiply');

else

end

setObjectOrder('wall',1)
setObjectOrder('platform',2)
if not lowQuality then
    setObjectOrder('gear',3)
end
setObjectOrder('floor',4)
setObjectOrder('gfGroup',5)
setObjectOrder('dadGroup',6)
setObjectOrder('boyfriendGroup',7)
if not lowQuality then
    setObjectOrder('claw',8)
    setObjectOrder('wires',9)
end
setObjectOrder('shader',10)

end

function onEvent(n,v1,v2)
    if n == 'eventTrigger' then
        if v1 == 'lights' then
            runTimer('lightsOn1',0.01)
            runTimer('lightsOff1',0.2)
            runTimer('lightsOn2',0.4)
            runTimer('lightsOff2',0.6)
            runTimer('lightsOn3',0.8)
        end
    end
end

function onTimerCompleted(tag,loops,loopsLeft)
    if tag == 'lightsOn1' then
        doTweenAlpha('lighton','shader',0,0.15,'linear')
    elseif tag == 'lightsOff1' then
        doTweenAlpha('lightoff','shader',1,0.15,'linear')
    elseif tag == 'lightsOn2' then
        doTweenAlpha('lighton','shader',0,0.15,'linear')
    elseif tag == 'lightsOff2' then
        doTweenAlpha('lightoff','shader',1,0.15,'linear')
    elseif tag == 'lightsOn3' then
        doTweenAlpha('lighton','shader',0,2,'linear')
    end
end