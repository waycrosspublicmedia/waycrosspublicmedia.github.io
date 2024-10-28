function onCreate()
	-- background shit

	makeLuaSprite('paintbg', 'paintbg', -700, -460);
	setScrollFactor('paintbg', 1, 1);
	scaleObject('paintbg', 1, 1);


	makeLuaSprite('paint', 'paint', -10, -55);
	setScrollFactor('paint', 0, 0);
	scaleObject('paint', 1.2, 1.2);

	makeLuaSprite('WHITEPEOPLE', 'WHITEPEOPLE', -1000, -500);
	setScrollFactor('WHITEPEOPLE', 0.8, 0.8);
	scaleObject('WHITEPEOPLE', 3, 3);

	setObjectCamera('paint', 'other')
	
	addLuaSprite('paintbg', false);
	addLuaSprite('WHITEPEOPLE', true);
	addLuaSprite('paint', true);

	setProperty('camHUD.alpha', 0)
end

function onUpdate()

	if curBeat == 295 then 
		setObjectOrder('WHITEPEOPLE', 1)
		setObjectOrder('paintbg', 2)
		setProperty('WHITEPEOPLE.alpha', 1)
		doTweenAlpha('fnbbye', 'dadGroup', 0, 5, 'Linear')
		doTweenAlpha('bgbye', 'paintbg', 0, 5, 'Linear')
	end

	if curBeat == 305 then 
		doTweenAlpha('ffbye', 'boyfriendGroup', 0, 3, 'Linear')
		doTweenAlpha('nomorenotes', 'camHUD', 0, 4, 'Linear')

	end

	if curBeat == 24 then
		doTweenAlpha('noteshi', 'camHUD', 1, 2, 'cubeOut')
	end
	if curBeat == 31 then
		setProperty('WHITEPEOPLE.alpha', 0)
	end
end