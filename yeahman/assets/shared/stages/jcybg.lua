function onCreate()
	
	makeLuaSprite('dabg', 'stages/jcy/jcy1', -150, -500)
	addLuaSprite('dabg', false);
	setScrollFactor('dabg', 1, 1);
	scaleObject('dabg', 0.8, 0.8);

		makeLuaSprite('dafloor', 'stages/jcy/jcy2', -150, -500)
		addLuaSprite('dafloor', false);
	setScrollFactor('dafloor', 1, 1);
	scaleObject('dafloor', 0.8, 0.8);

		makeLuaSprite('dawall', 'stages/jcy/jcy3', -150, -500)
		addLuaSprite('dawall', false);
	setScrollFactor('dawall', 1, 1);
	scaleObject('dawall', 0.8, 0.8);

			makeLuaSprite('dalight', 'stages/jcy/jcy4', -150, -500)
		addLuaSprite('dalight', true);
	setScrollFactor('dalight', 1, 1);
	scaleObject('dalight', 0.8, 0.8);


--	makeAnimatedLuaSprite('backP', 'backpack', -650, -350)
-- addAnimationByPrefix('backP','backpack idle','backpack idle',4,true)
-- addLuaSprite('backP', false)
-- objectPlayAnimation('backP','backpack idle',false)
-- scaleObject('backP', 1.2, 1.2);

	makeAnimatedLuaSprite('damari', 'stages/jcy/mari', -550, -350)
addAnimationByPrefix('damari','mari idle','mari idle',24,true)
addLuaSprite('damari', false)
objectPlayAnimation('damari','mari idle',false)
scaleObject('damari', 1.2, 1.2);

end
