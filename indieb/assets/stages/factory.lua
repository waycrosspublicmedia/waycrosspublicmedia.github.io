function onCreate()
  --background
  makeLuaSprite('b','bendy/bg1',-575,-500)
  makeLuaSprite('fg','bendy/bg2',-575,-500)
  makeLuaSprite('chains','bendy/Chains',-600,-600)
  makeAnimatedLuaSprite('sammy','bendy/SammyBg',600,150)
  addAnimationByPrefix('sammy','idle','Sam',24,true)
  objectPlayAnimation('sammy','idle',true)
  scaleObject('b',0.9,0.9)
  scaleObject('fg',0.9,0.9)
  addLuaSprite('b',false)
  --addLuaSprite('sammy',false)
  addLuaSprite('fg',false)
  --addLuaSprite('chains',true)
  close(true);
  end