function onCreate()
	-- background shit
	makeLuaSprite('bg','',-2000,-900)
	makeGraphic('bg',4000,4000,'ffffff')
	addLuaSprite('bg',false)
	
	if not lowQuality then
		makeAnimatedLuaSprite('theClouds', 'backyard/cloud bg', -100, 0);
		addAnimationByPrefix('theClouds','clouds moving','clouds',24,true);
		setLuaSpriteScrollFactor('theClouds', 0.2, 0.2);
		addLuaSprite('theClouds', false);
		scaleObject('theClouds', 1.2, 1.2);
	
		makeAnimatedLuaSprite('theBackHills', 'junkyard bg/junk hill', -60, 460);
		addAnimationByPrefix('theBackHills','hillMove','giant hill',24,true);
		setLuaSpriteScrollFactor('theBackHills', 0.4, 0.4);
		addLuaSprite('theBackHills', false);

		makeAnimatedLuaSprite('theBackHouses', 'junkyard bg/back tents', -60, 420);
		addAnimationByPrefix('theBackHouses','bhMove','backtents',24,true);
		setLuaSpriteScrollFactor('theBackHouses', 0.5, 0.5);
		addLuaSprite('theBackHouses', false);
	end
	
	makeAnimatedLuaSprite('theJunkGround', 'junkyard bg/junk bg', -610, 260);
	addAnimationByPrefix('theJunkGround','junk bg move','main junk bg',24,true);
	setLuaSpriteScrollFactor('theJunkGround', 0.6, 0.6);
	addLuaSprite('theJunkGround', false);

	makeAnimatedLuaSprite('bgTankmen', 'junkyard bg/bg tankmen', -500, 340);
	addAnimationByPrefix('bgTankmen','junkmen bop','tankmen bopping',24,true);
	setLuaSpriteScrollFactor('bgTankmen', 0.7, 0.7);
	--setProperty('bgTankmen.alpha', 0.6)
	addLuaSprite('bgTankmen', false);

	makeAnimatedLuaSprite('fgTankmen', 'junkyard bg/fg tankmen', -280, 250);
	addAnimationByPrefix('fgTankmen','junkman bop','tank soldier 1 frown copy',24,true);
	setLuaSpriteScrollFactor('fgTankmen', 0.8, 0.8);
	--setProperty('fgTankmen.alpha', 0.6)
	addLuaSprite('fgTankmen', false);

	makeAnimatedLuaSprite('wreckedHouse', 'junkyard bg/plane wreck', 1100, -290);
	addAnimationByPrefix('wreckedHouse','house move','plane wreck',24,true);
	setLuaSpriteScrollFactor('wreckedHouse', 0.8, 0.8);
	addLuaSprite('wreckedHouse', false);

	makeAnimatedLuaSprite('theGrassPlayer', 'junkyard bg/grass player', 760, 760);
	addAnimationByPrefix('theGrassPlayer','pGrassMove','grass shadow player',24,true);
	setLuaSpriteScrollFactor('theGrassPlayer', 0.95, 0.95);
	addLuaSprite('theGrassPlayer', false);

	makeAnimatedLuaSprite('theGrassOpp', 'junkyard bg/grass opponent', -100, 760);
	addAnimationByPrefix('theGrassOpp','oGrassMove','grass shadow opp',24,true);
	setLuaSpriteScrollFactor('theGrassOpp', 0.95, 0.95);
	addLuaSprite('theGrassOpp', false);

end

function onBeatHit()
	objectPlayAnimation('bgTankmen', 'junkmen bop', true)
	objectPlayAnimation('fgTankmen', 'junkman bop', true)
end

function onUpdate()
	setProperty('gf.visible',false);

	setProperty('theClouds.x',getProperty('theClouds.x')+0.05)
end