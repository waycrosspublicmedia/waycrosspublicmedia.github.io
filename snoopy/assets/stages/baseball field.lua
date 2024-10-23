function onCreate()
	-- background shit
	makeLuaSprite('bg','',-2000,-900)
	makeGraphic('bg',4000,4000,'CCCCCC')
	addLuaSprite('bg',false)	

	makeAnimatedLuaSprite('theClouds', 'backyard/cloud bg', -400, 100);
	addAnimationByPrefix('theClouds','clouds moving','clouds',24,true);
	setLuaSpriteScrollFactor('theClouds', 0.4, 0.4);
	addLuaSprite('theClouds', false);
	scaleObject('theClouds', 1.2, 1.2);	
	
	makeAnimatedLuaSprite('theFence', 'baseball field/ball fence', -600, 300);
	addAnimationByPrefix('theFence','fence move','base fence',24,true);
	setLuaSpriteScrollFactor('theFence', 0.6, 0.6);
	addLuaSprite('theFence', false);

	makeAnimatedLuaSprite('theField', 'baseball field/hill ground', -500, 630);
	addAnimationByPrefix('theField','field move','base ground',24,true);
	setLuaSpriteScrollFactor('theField', 0.95, 0.95);
	addLuaSprite('theField', false);

end

function onUpdate()
	setProperty('gf.visible',false);

	setProperty('theClouds.x',getProperty('theClouds.x')+0.02)
end