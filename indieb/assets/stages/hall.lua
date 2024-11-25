function onCreate()
  --background
  makeLuaSprite('bg','sans/hall',-195,-185)
  makeLuaSprite('bg2','sans/waterfall',-4300,-175)
  makeLuaSprite('bg3','sans/battle',-195,-185)
  scaleObject('bg2',1.3,1.3)
  scaleObject('bg',1.2,1.1)
  addLuaSprite('bg3',false)
  addLuaSprite('bg2',false)
  addLuaSprite('bg',false)
end