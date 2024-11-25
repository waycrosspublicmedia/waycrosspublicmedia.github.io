function onCreate()

makeLuaSprite('cheese','x/cheese',-155, -145)
addLuaSprite('cheese',false)
setLuaSpriteScrollFactor('cheese',0.95,1.1)
scaleObject('cheese',0.6,0.6)

if not lowQuality then
	makeAnimatedLuaSprite('boppers','x/boppers',-155, -145)
    addAnimationByPrefix('boppers','bop','wk1 layer2 idle',24,false)
    setLuaSpriteScrollFactor('boppers',0.95,1.1)
    addLuaSprite('boppers',false)
    scaleObject('boppers',0.6,0.6)	

    makeLuaSprite('backglow','x/backglow',-155, -145)
    addLuaSprite('backglow',false)
    setLuaSpriteScrollFactor('backglow',1.0,1.0)
    scaleObject('backglow',0.6,0.6)
end



makeLuaSprite('hall','x/hall',-155, -145)
addLuaSprite('hall',false)
setLuaSpriteScrollFactor('hall',1.0,1.0)
scaleObject('hall',0.6,0.6)

if not lowQuality then
    makeAnimatedLuaSprite('frontboppers','x/frontboppers',-156, -145)
    addAnimationByPrefix('frontboppers','bop','wk1 layer5 idle',24,false)
    addLuaSprite('frontboppers',false)
    setLuaSpriteScrollFactor('frontboppers',1.0,1.0)
    scaleObject('frontboppers',0.6,0.6)
end

makeLuaSprite('lamppost','x/lamppost',-155, -145)
addLuaSprite('lamppost',true)
setLuaSpriteScrollFactor('lamppost',1.1,1.1)
scaleObject('lamppost',0.6,0.6)	

doTweenAlpha('NoBitches','gfGroup',0,0.01,'linear')

end

function onBeatHit()
    if not lowQuality then
		playAnim('boppers','bop',true)
        playAnim('frontboppers','bop',true)
    end
end