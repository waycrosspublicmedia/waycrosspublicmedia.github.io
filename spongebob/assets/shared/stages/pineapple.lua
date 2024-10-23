
function onCreate()
	makeLuaSprite('SB_sky', 'stage_bg/sb_house/sb_bg', -700, -600)
	setScrollFactor('SB_sky', 0.3, 0.3)
	scaleObject('SB_sky', 1.1, 1.1)
	addLuaSprite('SB_sky')
	
	if not lowQuality then
		makeLuaSprite('SB_bghouse', 'stage_bg/sb_house/sb_houses', -1300, -590)
		setScrollFactor('SB_bghouse', 0.8, 0.99)
		addLuaSprite('SB_bghouse')
	end
	
	makeLuaSprite('SB_ground', 'stage_bg/sb_house/sb_ground', -1300, -600)
	addLuaSprite('SB_ground')
	
	makeLuaSprite('SB_House', 'stage_bg/sb_house/sb_pineapple_dx', -1052, -1622)
	addLuaSprite('SB_House')

	close(true)
end