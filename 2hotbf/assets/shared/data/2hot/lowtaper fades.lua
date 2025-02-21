function onStepHit()
	if curStep == 1 then
		doTweenAlpha('camGame','camGame',1,1.3)
		end
	if curStep == 1456 then
	
		setProperty('camGame.alpha',0)
		doTweenAlpha('camGame','camGame',1,2)
		doTweenZoom('tweeningZoom', 'camGame', 0.75, 5, 'linear')
	end
	if curStep == 1520 then
	
		doTweenZoom('tweeningZoom2', 'camGame', 1.2, 3, 'linear')
	end
	if curStep == 1616 then

		doTweenAlpha('camGame','camGame',0,8)
		doTweenZoom('tweeningZoom3', 'camGame', 1.5, 8, 'linear')
	end
	if curStep == 1744 then

		doTweenAlpha('camGame','camGame',1,11)
		doTweenZoom('tweeningZoom', 'camGame', 0.75, 11, 'linear')
	end
		if curStep == 2192 then

		
		doTweenZoom('tweeningZoom3', 'camGame', 1.5, 4, 'linear')
	end

	if curStep == 2192 then

		doTweenAlpha('camGame','camGame',0,5)
		
	end
	if curStep == 2256 then

		doTweenAlpha('camGame','camGame',1,12)
		
	end

end
function onCreatePost()
	setProperty('camGame.alpha',0)
end

function onTweenCompleted(tag)

if tag == 'tweeningZoom' then
setProperty('defaultCamZoom', 0.75)
end

if tag == 'tweeningZoom2' then
setProperty('defaultCamZoom', 1.2)
end

if tag == 'tweeningZoom3' then
setProperty('defaultCamZoom', 1.5)
end

end