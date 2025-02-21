function onCreate()

	makeLuaSprite('back', 'candy/back',-500 , -680);
	setScrollFactor('back', 0.7, 0.7);
	scaleObject('back', 1, 1);
	setObjectOrder('back', 0 );
	
	makeAnimatedLuaSprite('stars', 'candy/stars',-300 , -100);
	setScrollFactor('stars', 0, 0);
	scaleObject('stars', 1, 1);
	setObjectOrder('stars', 1 );
	
	makeLuaSprite('mid', 'candy/mid',650 , 130);
	setScrollFactor('mid', 0.8, 0.8);
	scaleObject('mid', 1, 1);
	setObjectOrder('mid', 2 );
	
	makeLuaSprite('front', 'candy/front',-220 , -420);
	setScrollFactor('front', 1, 1);
	scaleObject('front', 1, 1);
	setObjectOrder('front', 3 );
	
	makeAnimatedLuaSprite('kat', 'candy/kat',300 , 470);
	setScrollFactor('kat', 1, 1);
	scaleObject('kat', 1, 1);
	setObjectOrder('kat', 4 );
	
	makeAnimatedLuaSprite('carmint', 'candy/carmint',1430 , 380);
	setScrollFactor('carmint', 1, 1);
	scaleObject('carmint', 1, 1);
	setObjectOrder('carmint', 4 );
	
	makeAnimatedLuaSprite('normy', 'candy/normy',2100 , 560);
	setScrollFactor('normy', 1, 1);
	scaleObject('normy', 1, 1);
	setObjectOrder('normy', 4 );
	
	makeLuaSprite('bars', 'candy/bars',-426 , -240);
	setScrollFactor('bars', 0, 0);
	scaleObject('bars', 1.71, 1.71);
	setObjectOrder('bars', 6 );
	
	addLuaSprite('back', false);
	addAnimationByPrefix('stars', 'idle', 'star', 14, false);
	addLuaSprite('stars', false);
	addLuaSprite('mid', false);
	addLuaSprite('front', false);
	addAnimationByPrefix('kat', 'idle', 'kat idle', 14, false);
	addLuaSprite('kat', false);
	addAnimationByPrefix('carmint', 'idle', 'carmint idle', 14, false);
	addLuaSprite('carmint', false);
	addAnimationByPrefix('normy', 'idle', 'normy idle', 14, false);
	addLuaSprite('normy', false);
	addLuaSprite('bars', false);
end
function onBeatHit()
	if curBeat % 1== 0 then
	objectPlayAnimation('stars', 'idle', false);
	objectPlayAnimation('kat', 'idle', false);
	objectPlayAnimation('carmint', 'idle', false);
	objectPlayAnimation('normy', 'idle', false);
end
end