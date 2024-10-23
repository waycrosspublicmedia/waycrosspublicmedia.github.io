-- Opp Brown camera offsets
local xx = 460;
local yy = 500;
-- BF camera offests
local xx2 = 660;
local yy2 = 500;

local ofs = 15;
local followchars = false;

function onCreate()
	-- background shit
	makeAnimatedLuaSprite('bgWall', 'franklins room/wall', -900, -290);
	addAnimationByPrefix('bgWall','wall move','frank walls',24,true);
	setLuaSpriteScrollFactor('bgWall', 0.65, 0.75);
	scaleObject('bgWall', 0.95, 0.95);
	addLuaSprite('bgWall', false);	

	

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

		makeAnimatedLuaSprite('bgBall', 'franklins room/beach ball', 300, 520);
		addAnimationByPrefix('bgBall','bBall move','ball',24,true);
		setLuaSpriteScrollFactor('bgBall', 0.77, 0.8);
		addLuaSprite('bgBall', false);
	
		makeAnimatedLuaSprite('bgTable', 'franklins room/table', 1100, 200);
		addAnimationByPrefix('bgTable','table move','table lamp',24,true);
		setLuaSpriteScrollFactor('bgTable', 0.77, 0.8);
		addLuaSprite('bgTable', false);	

		makeAnimatedLuaSprite('fgTable', 'franklins room/bg table front', -990, 500);
		addAnimationByPrefix('fgTable','frontTable move','table front',24,true);
		setLuaSpriteScrollFactor('fgTable', 1.3, 1.2);
		addLuaSprite('fgTable', true);	
	end

	makeAnimatedLuaSprite('theShadow', 'play stage/ground shadow', 814, 810);
	addAnimationByPrefix('theShadow','shadow move','ground shadow',24,true);
	setLuaSpriteScrollFactor('theShadow', 0.97, 0.97);
	addLuaSprite('theShadow', false);

	makeAnimatedLuaSprite('theShadow2', 'play stage/ground shadow', -60, 820);
	addAnimationByPrefix('theShadow2','shadow2 move','ground shadow',24,true);
	setLuaSpriteScrollFactor('theShadow2', 0.97, 0.97);
	addLuaSprite('theShadow2', false);




-- cool cenimatic aspect ratio/black bars
	makeLuaSprite('bartop','',-200,-30)
	makeGraphic('bartop',2000,100,'000000')
	addLuaSprite('bartop',false)
    setScrollFactor('bartop',0,0)
    setObjectCamera('bartop','hud')

    makeLuaSprite('barbot','',-200,650)
	makeGraphic('barbot',2000,100,'000000')
	addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')


end

function onUpdate()
	setProperty('gf.visible', false)
end
