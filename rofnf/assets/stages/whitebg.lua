function onCreate()
	-- background shit

	makeLuaSprite('WHITEPEOPLE', 'WHITEPEOPLE', -1000, -500);
	setScrollFactor('WHITEPEOPLE', 0.8, 0.8);
	scaleObject('WHITEPEOPLE', 3, 3);

	addLuaSprite('WHITEPEOPLE', false);

	makeLuaSprite('mycouch', 'mycouch', 400, 400);
	setScrollFactor('mycouch', 1, 1);
	scaleObject('mycouch', 1, 1);
    
    addLuaSprite('mycouch', false);
	
	setProperty('mycouch.alpha', 0)

	function onBeatHit() 
		doTweenY('wahoo', 'mycouch', getProperty('mycouch.y') + 100, duration, 'cubeIn')

		if curBeat == 193 then
			doTweenAlpha('uhoh', 'mycouch', 1, 20, 'linear')
		end

	end
	
	function onTweenCompleted(tag)
		if tag == 'wahoo' then


			doTweenY('wahooback', 'mycouch', getProperty('mycouch.y') - 100, duration, 'cubeOut')
		end
	end



end
function onCreatePost()
	duration = getPropertyFromClass('Conductor', 'stepCrochet') * 2 / 1100
end
