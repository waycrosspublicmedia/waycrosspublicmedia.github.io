function onCreate()
	-- background shit
	makeLuaSprite('bg','',-300,-900)
	makeGraphic('bg',4000,4000,'ffffff')
	addLuaSprite('bg',false)	

	makeAnimatedLuaSprite('theClouds', 'backyard/cloud bg', -100, -100);
	addAnimationByPrefix('theClouds','clouds moving','clouds',24,true);
	setLuaSpriteScrollFactor('theClouds', 0.4, 0.4);
	addLuaSprite('theClouds', false);
	--scaleObject('theClouds', 1.2, 1.2);	
	
	makeAnimatedLuaSprite('theFence', 'backyard/bg fence', -600, 300);
	addAnimationByPrefix('theFence','fence move','fence',24,true);
	setLuaSpriteScrollFactor('theFence', 0.7, 0.7);
	addLuaSprite('theFence', false);

	makeAnimatedLuaSprite('theHouse', 'backyard/bg house', 400, 210);
	addAnimationByPrefix('theHouse','house move','snoopy house',24,true);
	setLuaSpriteScrollFactor('theHouse', 0.82, 0.82);
	addLuaSprite('theHouse', false);

end

function onUpdate()
	setProperty('gf.visible',false);

	setProperty('theClouds.x',getProperty('theClouds.x')+0.05)
end