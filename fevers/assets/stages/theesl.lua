function onCreate()

makeLuaSprite('floor','theesl/floor',-500, -40)
scaleObject('floor', 1,0.75)
addLuaSprite('floor',false)
setLuaSpriteScrollFactor('floor',1.02,1.0)

if not lowQuality then
    makeLuaSprite('pillar','theesl/pillar',-100, 0)
    scaleObject('pillar', 0.7,0.7)
    addLuaSprite('pillar',false)
    setLuaSpriteScrollFactor('pillar',1.04,1.0)

    makeLuaSprite('painting','theesl/painting',-100, -40)
    scaleObject('painting', 0.7,0.7)
    addLuaSprite('painting',false)
    setLuaSpriteScrollFactor('painting',1.03,1.0)

    makeLuaSprite('pot','theesl/pot',-100, -40)
    scaleObject('pot', 0.7,0.7)
    addLuaSprite('pot',false)
    setLuaSpriteScrollFactor('pot',1.04,1.0) 
end

makeLuaSprite('table','theesl/table',360, -80)
scaleObject('table', 0.7,0.7)
addLuaSprite('table',false)
setLuaSpriteScrollFactor('table',1.03,1.0)

makeLuaSprite('limo','theesl/limo',-520, -40)
scaleObject('limo', 0.7,0.7)
addLuaSprite('limo',false)
setLuaSpriteScrollFactor('limo',1.06,1.0)

if not lowQuality then
    makeAnimatedLuaSprite('tophatgang','theesl/tophatgang',1050, 340)
    addAnimationByPrefix('tophatgang','bop','tophatgang',24,false)
    addLuaSprite('tophatgang',false)
    setLuaSpriteScrollFactor('tophatgang',1.02,1.0) 
end

makeLuaSprite('gun','theesl/gun',140, 900)
setLuaSpriteScrollFactor('gun',1.0,1.0)
setProperty('gun.angle',290)
if dadName == 'berserktheesl' then
    addLuaSprite('gun',false)
end

makeLuaSprite('briefcase','theesl/briefcase',-200, -30)
scaleObject('briefcase', 0.7,0.7)
addLuaSprite('briefcase',false)
setLuaSpriteScrollFactor('briefcase',1.0,1.0)

end

function onBeatHit()
    if not lowQuality then
    playAnim('tophatgang','bop',true)
    end
end

function onUpdatePost()
    if dadName == 'berserktheesl' then
        if getProperty('dad.animation.curAnim.name') == 'shoot' then
            doTweenAlpha('gunshoot','gun',0,0.01,'linear')
        elseif getProperty('dad.animation.curAnim.name') == 'reload' then
            doTweenAlpha('gunreload','gun',0,0.01,'linear')
        elseif getProperty('dad.animation.curAnim.name') == 'mag' then
            doTweenAlpha('gunmag','gun',0,0.01,'linear')
        else
            doTweenAlpha('gunshow','gun',1,0.01,'linear')
        end
    end
end
