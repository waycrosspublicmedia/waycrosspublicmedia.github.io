function onCreate()

makeLuaSprite('mania','stages/maniabackdrop',0,0)
addLuaSprite('mania', true);
setObjectCamera('mania','hud')

setProperty('gf.visible',false);
setProperty('dad.visible',false);
setProperty('boyfriend.visible',false)

end
