local xx = 350;
local yy = 550;
local xx2 = 900;
local yy2 = 600;
local ofs = 37;
local followchars = true;
function onCreate()
	
	makeLuaSprite('BGBFB','bg',-410,70)
	addLuaSprite('BGBFB',false)
	scaleObject('BGBFB', 1.1, 1.1);

	makeAnimatedLuaSprite('boppers','TheBop',230,500)
	addAnimationByPrefix('boppers','bounce','TheBop',24,false)
	addLuaSprite('boppers',false)
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('boppers','bounce',true)	
	end

end 

function onStephit()
	

end