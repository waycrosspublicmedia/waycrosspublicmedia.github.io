function onCreate()
	makeLuaSprite('basement','stages/basement',-571,-411)
	makeAnimatedLuaSprite('lightbulb','stages/lightbulb',182,-126)
	makeLuaSprite('box','stages/box',-571,119)
	addAnimationByPrefix('lightbulb','idle','Frame_',24,true)
	objectPlayAnimation('lightbulb','idle')

	scaleObject('lightbulb',0.79,0.79)
	setGraphicSize('box',675,789)
	setGraphicSize('basement',2220,1301)

	addLuaSprite('basement',false)
	addLuaSprite('lightbulb',false)
	addLuaSprite('box',true)
end