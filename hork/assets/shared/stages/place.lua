function onCreate()
 -- no guys,the second background it's not inside the TLC okay? It's inside of the head of METAL LEAFY!!!!
	
	makeLuaSprite('fa', 'fadeBG', 0, -645);
	setLuaSpriteScrollFactor('fa', 0.9, 0.9);
	scaleObject('fa', 1.5, 1.5);
	makeLuaSprite('bg2', 'bg2', 0, -500);
	scaleObject('bg2', 1.5, 1.5);
	setLuaSpriteScrollFactor('bg2', 0.9, 0.9);
	makeLuaSprite('pillar', 'pillar', 730, 750);
	scaleObject('pillar', 1.5, 1.5);
	setLuaSpriteScrollFactor('pillar', 0.9, 0.9);
	makeLuaSprite('what', 'yoyle', -800, 320);
	setLuaSpriteScrollFactor('what', 0.9, 0.9);
	makeLuaSprite('what2', 'nightsky', -2500, -1000);
	setLuaSpriteScrollFactor('what2', 0.9, 0.9);
	scaleObject('what2', 4, 4);
	makeLuaSprite('what3', 'night', -400, 0);
	setLuaSpriteScrollFactor('what3', 0.9, 0.9)
	scaleObject('what3', 3, 3);
	makeLuaSprite('wa', 'unknownPlace', -450, 0);
	setLuaSpriteScrollFactor('wa', 0.9, 0.9);
	scaleObject('wa', 3, 3);

	addLuaSprite('what3', true);
	addLuaSprite('what2', false);
	addLuaSprite('what', false);

end

function onStepHit()
	if curStep == 1776 then
		removeLuaSprite('what', false)
		removeLuaSprite('what2', false)
		removeLuaSprite('what3', false)
		addLuaSprite('wa',false);
	end
	if curStep == 2304 then
	removeLuaSprite('wa', false)
		addLuaSprite('fa', true);
	addLuaSprite('bg2', false);
	addLuaSprite('pillar', false);
	end
end