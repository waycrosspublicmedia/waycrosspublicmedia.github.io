function onCreate()

makeLuaSprite('bg','chan/cracker',-228.05,-224)
addLuaSprite('bg',false)
setScrollFactor('bg',0.9,0.9)


makeLuaSprite('fg','chan/thefunnycloversite',-278,-372)
addLuaSprite('fg',true)
setScrollFactor('fg',1.2,1.2)

end

function onCreatePost()

setProperty('gf.visible',false)

end