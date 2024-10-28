function onCreate()
	-- background shit

	makeLuaSprite('WHITEPEOPLE', 'WHITEPEOPLE', -1000, -500);
	setScrollFactor('WHITEPEOPLE', 0.8, 0.8);
	scaleObject('WHITEPEOPLE', 3, 3);

	addLuaSprite('WHITEPEOPLE', false);
end

function onUpdate(elapsed)
	if curBeat == 242 then
		doTweenAlpha('byesonic', 'boyfriend', 0, 3, 'linear')
	end
	if curBeat == 244 then
		doTweenY('flysonic', 'boyfriend', getProperty('boyfriend.y') - 600, 2, 'linear')
	end
	if curBeat == 255 then
		doTweenAlpha('hibf', 'boyfriend', 1, 1, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'flysonic' then
		setProperty('boyfriend.y', getProperty('boyfriend.y') + 600)
	end
end

