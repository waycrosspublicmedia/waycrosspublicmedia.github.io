local angleshit = 0.35; -- camera tilt
local anglevar = 0.35; -- camera tilt (make sure to change both)

function onBeatHit()

    -- change the numbers of "curBeat" to a whenever point you want in the song (you can check where the beat is on the chart thingy)
	-- ">=" means where it starts, and "<=" means where it ends. you can also use "or" to make it happen in another moment of the song!!

	if curBeat >= 64.4 and curBeat <= 128 then
		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camGame.angle',angleshit*3)
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
		--doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
		xOffset = angleshit*16
	else
		cancelTween('tt')
		--cancelTween('ttrn')
		setProperty('camGame.angle',0)
		xOffset = 0
		--setProperty('camGame.x',0)
		--setProperty('camGame.y',0)
	end

end