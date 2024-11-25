function onCreate()
  --background
  makeLuaSprite('back','cup/BG-00',-700,-400)
  setScrollFactor('back',0.4,0.4)
  scaleObject('back',3,3)
  makeLuaSprite('floor','cup/Foreground',-700,-400)
  scaleObject('floor',3,3)
  makeAnimatedLuaSprite('camera','cup/oldtimey',0,0)
  addAnimationByPrefix('camera','idle','Cupheadshit_gif instance 1',24,true)
  objectPlayAnimation('camera','idle',true)
  setObjectCamera('camera','hud')
  addLuaSprite('back',false)
  addLuaSprite('floor',false)
  addLuaSprite('camera',true)
  close(true);
  end