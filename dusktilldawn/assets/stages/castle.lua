function onCreate()
	-- background shit

	

--PRECACHE

	precacheImage('Castle/Sky');
	precacheImage('Castle/Wall');
	precacheImage('Castle/Midground');
	precacheImage('Castle/Inkfall');
	precacheImage('Castle/Foreground');
	
--SKETCH
	--makeLuaSprite('sketch', 'castle-sketch', -1000, -350);
	--setScrollFactor('sketch', 0.9, 0.9);

	--addLuaSprite('sketch', false);

-- SKY
	makeLuaSprite('sky', 'Castle/Sky3', -950, -300);
	setScrollFactor('sky', 0.6, 0.6);

--WALL
	makeLuaSprite('wall', 'Castle/Wall2', -900, -300);
	setScrollFactor('wall', 0.94, 0.94);

--MIDGROUND
	makeAnimatedLuaSprite('midground', 'Castle/Midground', -900, -300);
	setScrollFactor('midground', 0.95, 0.95);
	addAnimationByPrefix('midground', 'idle', 'MidGround', 15, true);
	objectPlayAnimation('midground', 'idle');
--INK FALL
if not lowQuality then
	makeAnimatedLuaSprite('inkfall', 'Castle/Inkfall', 0, -300);
	setScrollFactor('inkfall', 0.95, 0.95);
	addAnimationByPrefix('inkfall', 'idle', 'ink waterfall', 15, true);
	objectPlayAnimation('inkfall', 'idle');
end
--PILLAR
	makeLuaSprite('pillar', 'Castle/Foreground', -1325, -300);
	setScrollFactor('pillar', 1.4, 1.4);


-- PLACE ALL
	addLuaSprite('sky', false);
	addLuaSprite('wall', false);
	addLuaSprite('midground', false);
	if not lowQuality then
	addLuaSprite('inkfall', false);
	end
	addLuaSprite('pillar', true);









--SPOTLIGHT
if not lowQuality then
	makeLuaSprite('spotlight1', 'spotlight', -2470, -2020);
	setScrollFactor('spotlight1', 1, 1);
    scaleObject('spotlight1', -0.9, 1);
    addLuaSprite('spotlight1', true);
    doTweenAlpha('spotlightAlphaTween', 'spotlight1', 0.0001, 0.00001, 'linear');
	setObjectOrder('spotlight1', 35);
end

--PIBBY
	-- create a lua sprite called "pibby"
	makeAnimatedLuaSprite('pibby', 'Pibby', 1100, 390);
	setScrollFactor('pibby', 1.05, 1.05);
	addAnimationByPrefix('pibby', 'idle', 'Pibby', 15, false);
	objectPlayAnimation('pibby', 'idle');
	 -- false = add behind characters, true = add over characters

	 addLuaSprite('pibby', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

