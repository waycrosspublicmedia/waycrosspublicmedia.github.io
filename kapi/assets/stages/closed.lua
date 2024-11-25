function onCreate()
	-- background shit
	makeLuaSprite('closed', 'closed', -600, -300);
	setScrollFactor('closed', 0.9, 0.9);
	
	makeLuaSprite('stagefrontkapiold', 'stagefrontkapiold', -650, 600);
	setScrollFactor('stagefrontkapiold', 0.9, 0.9);
	scaleObject('stagefrontkapiold', 1.1, 1.1);
	
	makeAnimatedLuaSprite('audienceBop','upperBop',-550,-250)addAnimationByPrefix('audienceBop','dance','Upper Crowd Bob',24,true)
    objectPlayAnimation('audienceBop','dance',false)
    setScrollFactor('audienceBop', 0.9, 0.9);
	
	
	makeAnimatedLuaSprite('lightBlink','lights',-600,-300)addAnimationByPrefix('lightBlink','dance','lightblink',3,true)
    objectPlayAnimation('lightBlink','dance',false)
    setScrollFactor('lightBlink', 0.9, 0.9);
	
	makeAnimatedLuaSprite('theFreaks','bgFreaks',-600,-300)addAnimationByPrefix('theFreaks','dance','Bottom Level Boppers',28,true)
    objectPlayAnimation('theFreaks','dance',false)
    setScrollFactor('theFreaks', 0.9, 0.9);
	
	--makeLuaSprite('GODDAMNITYOUSTUPIDASSCAT', 'GODDAMNITYOUSTUPIDASSCAT', -300, -00);
	--setScrollFactor('GODDAMNITYOUSTUPIDASSCAT', 0.9, 0.9); this is an event now

	addLuaSprite('closed', false);
	addLuaSprite('stagefrontkapiold', false);
	addLuaSprite('lightBlink', false);
	addLuaSprite('theFreaks', false);
	addLuaSprite('audienceBop', true);
	--addLuaSprite('GODDAMNITYOUSTUPIDASSCAT', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end