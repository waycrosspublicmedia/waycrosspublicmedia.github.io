function onCreate()

makeLuaSprite('sky','sunset/sky',-400, -320)
addLuaSprite('sky',false)
scaleObject('sky',1.0,1.0)
setLuaSpriteScrollFactor('sky',0.1,0.1)

if not lowQuality then
    makeLuaSprite('lights','sunset/lights',-530, -200)
    addLuaSprite('lights',false)
    scaleObject('lights',1.0,1.0)
    setLuaSpriteScrollFactor('lights',0.3,0.3)

    makeLuaSprite('backbuildings','sunset/backbuildings',-530, -200)
    addLuaSprite('backbuildings',false)
    scaleObject('backbuildings',1.0,1.0)
    setLuaSpriteScrollFactor('backbuildings',0.3,0.3)
end

makeLuaSprite('midbuildings','sunset/midbuildings',-450, -332)
addLuaSprite('midbuildings',false)
scaleObject('midbuildings',1.0,1.0)
setLuaSpriteScrollFactor('midbuildings',0.4,0.4)

if not lowQuality then
    makeLuaSprite('clouds','sunset/clouds',30, -320)
    addLuaSprite('clouds',false)
    scaleObject('clouds',1.0,1.0)
    setLuaSpriteScrollFactor('clouds',0.4,0.4)
end

makeLuaSprite('frontbuildings','sunset/frontbuildings',-80, -200)
addLuaSprite('frontbuildings',false)
scaleObject('frontbuildings',1.0,1.0)
setLuaSpriteScrollFactor('frontbuildings',0.9,0.7)

makeLuaSprite('roof','sunset/roof',-50, -200)
addLuaSprite('roof',false)
scaleObject('roof',1.0,1.0)
setLuaSpriteScrollFactor('roof',1.0,1.0)

doTweenAlpha('NoBitches','gfGroup',0,0.01,'linear')

end