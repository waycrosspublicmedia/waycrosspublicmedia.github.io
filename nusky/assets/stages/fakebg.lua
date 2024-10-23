function onCreate()

makeLuaSprite('bgsky','skybg/bgsky',-444.6,-1041.5)
addLuaSprite('bgsky')

makeLuaSprite('bgcity','skybg/bgcity',-770.6,-414.15)
addLuaSprite('bgcity')
setScrollFactor('bgcity',0.3,0.3)

makeLuaSprite('bgtrees','skybg/bgtrees',-991.45,-31.4)
addLuaSprite('bgtrees')
setScrollFactor('bgtrees',0.6,0.6)

makeLuaSprite('ground','skybg/ground',-2727.05,-27)
addLuaSprite('ground')
setScrollFactor('ground',0.9,0.9)

makeLuaSprite('tree','skybg/tree',-1449.3,-803.2)
addLuaSprite('tree')
setScrollFactor('tree',0.9,0.9)

makeLuaSprite('path','skybg/path',-2673.25,657.4)
addLuaSprite('path')
setScrollFactor('path',1.01,1,01)

makeLuaSprite('bench','skybg/bench',334.9,415)
addLuaSprite('bench')
setScrollFactor('bench',0.95,0.95)

makeAnimatedLuaSprite('speaker','skybg/speaker',879.5,471.7)
addAnimationByPrefix('speaker','speaker','speaker',24,false)
addLuaSprite('speaker')
setScrollFactor('speaker',0.95,0.95)

makeLuaSprite('blak','',0,0)
makeGraphic('blak',1280,720,'000000')
addLuaSprite('blak')
setProperty('blak.visible',false)
setScrollFactor('blak',0,0)



makeAnimatedLuaSprite('manifBOOM','manifGLOW',-177.35,-923)
addAnimationByPrefix('manifBOOM','boom','manifestglow',24,true)
addLuaSprite('manifBOOM')
setProperty('manifBOOM.visible',false)
setScrollFactor('manifBOOM',1,1)

end
function onStartSong()

objectPlayAnimation('speaker','speaker',true)

end
function onBeatHit()

objectPlayAnimation('speaker','speaker',true)



end


