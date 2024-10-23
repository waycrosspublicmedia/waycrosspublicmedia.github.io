function onCreate()
	-- background shit
	makeLuaSprite('bg','',-1000,-1000)
	makeGraphic('bg',8000,8000,'ffffff')
	addLuaSprite('bg',false)	
	if not lowQuality then

		makeAnimatedLuaSprite('theClouds', 'backyard/cloud bg', -300, 100);
		addAnimationByPrefix('theClouds','clouds moving','clouds',24,true);
		setLuaSpriteScrollFactor('theClouds', 0.4, 0.4);
		addLuaSprite('theClouds', false);
		--scaleObject('theClouds', 1.2, 1.2);

	end

	makeAnimatedLuaSprite('theTree', 'thinking tree/thinking tree', -300, -500);
	addAnimationByPrefix('theTree','tree moving','thinking tree',24, true);
	setLuaSpriteScrollFactor('theTree', 0.8, 0.8);
	addLuaSprite('theTree', false);

	makeAnimatedLuaSprite('theGrassPlayer', 'junkyard bg/grass player', 50, 760);
	addAnimationByPrefix('theGrassPlayer','pGrassMove','grass shadow player',24,true);
	setLuaSpriteScrollFactor('theGrassPlayer', 0.95, 0.95);
	addLuaSprite('theGrassPlayer', false);

	makeAnimatedLuaSprite('theGrassOpp', 'junkyard bg/grass opponent', 700, 760);
	addAnimationByPrefix('theGrassOpp','oGrassMove','grass shadow opp',24,true);
	setLuaSpriteScrollFactor('theGrassOpp', 0.95, 0.95);
	addLuaSprite('theGrassOpp', false);

end

function onBeatHit()
	
end

function onUpdate()
	setProperty('theClouds.x',getProperty('theClouds.x')+0.03)
end