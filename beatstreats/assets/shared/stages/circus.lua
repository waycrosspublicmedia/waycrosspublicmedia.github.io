function onCreate()

	makeLuaSprite('back', 'circus/back',-500 , -680);
	setScrollFactor('back', 0.7, 0.7);
	scaleObject('back', 1, 1);
	setObjectOrder('back', 0 );
	
	makeAnimatedLuaSprite('bopback', 'circus/bopback',-550 , 50);
	setScrollFactor('bopback', 0.7, 0.7);
	scaleObject('bopback', 1, 1);
	setObjectOrder('bopback', 1 );
	
	makeLuaSprite('mid', 'circus/middle',300 , -200);
	setScrollFactor('mid', 1, 1);
	scaleObject('mid', 1, 1);
	setObjectOrder('mid', 2 );

	makeLuaSprite('lamps', 'circus/lamps',440 , -150);
	setScrollFactor('lamps', 1.2, 1.2);
	scaleObject('lamps', 1, 1);
	setObjectOrder('lamps', 5 );
	
	makeAnimatedLuaSprite('bop', 'circus/bop',150 , 700);
	setScrollFactor('bop', 1.3, 1.3);
	scaleObject('bop', 1, 1);
	setObjectOrder('bop', 6 );
	
	makeLuaSprite('bars', 'circus/bars',-426 , -240);
	setScrollFactor('bars', 0, 0);
	scaleObject('bars', 1.71, 1.71);
	setObjectOrder('bars', 7 );
	
	addLuaSprite('back', false);
	addAnimationByPrefix('bopback', 'idle', 'bopb', 14, false);
	addLuaSprite('bopback', false);
	addLuaSprite('mid', false);
	addLuaSprite('front', false);
	addAnimationByPrefix('bop', 'idle', 'bop', 14, false);
	addLuaSprite('bop', false);
	addLuaSprite('bars', false);
end
function onBeatHit()
	if curBeat % 1== 0 then
	objectPlayAnimation('bopback', 'idle', false);
	objectPlayAnimation('bop', 'idle', false);
end
end