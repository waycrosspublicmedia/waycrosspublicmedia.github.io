function onCreate()

	makeLuaSprite('stage', 'white/stage',-600 , -600);
	setScrollFactor('stage', 1, 1);
	scaleObject('stage', 0.6, 0.6);
	setObjectOrder('stage', 0 );
	
	makeLuaSprite('bars', 'white/bars',-280 , -160);
	setScrollFactor('bars', 0, 0);
	scaleObject('bars', 1.5, 1.5);
	setObjectOrder('bars', 6 );
	
	addLuaSprite('stage', false);
	addLuaSprite('bars', false);
end