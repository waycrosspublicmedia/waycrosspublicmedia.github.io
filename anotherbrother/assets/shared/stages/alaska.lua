function onCreate()
    makeLuaSprite('horizon','stages/horizon',-750,-600)
    makeLuaSprite('back trees','stages/btrees',-600,-600)
    makeLuaSprite('front trees','stages/ftrees',-900,-300)
    makeAnimatedLuaSprite('snow','idle','sno',12,true)

    scaleObject('sno',1.5,1.5)

    addLuaSprite('horizon',false)
    addLuaSprite('back trees',false)
    addLuaSprite('front trees',true)
    addLuaSprite('sno',true)
end
