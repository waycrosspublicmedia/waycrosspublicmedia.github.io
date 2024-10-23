
local ogCamZoom = 0

function onCreate() ogCamZoom = getProperty('defaultCamZoom') end

function onStepHit()
	if curStep == 256 then doTweenZoom('camGameZoom1', 'camGame', ogCamZoom + 0.3, 1, 'sineOut')
	
	elseif curStep == 272 then doTweenZoom('camGameZoom2', 'camGame', ogCamZoom, 2, 'sineInOut')

	elseif curStep == 656 then setProperty('defaultCamZoom', ogCamZoom + 0.2) doTweenZoom('camGameZoom3', 'camGame', ogCamZoom + 0.2, 0.9, 'sineOut') 
	
	elseif curStep == 784 then setProperty('defaultCamZoom', ogCamZoom + 0.1)
	
	elseif curStep == 911 or curStep == 1568 then setProperty('defaultCamZoom', ogCamZoom)

	elseif curStep == 1424 then setProperty('defaultCamZoom', ogCamZoom + 0.23)
	
	elseif curStep == 1552 then setProperty('defaultCamZoom', ogCamZoom + 0.05) end
end

local isPatrickTurn = false

function onEvent(name, v1, v2)
	if name == 'Global Event Handler' then
		if v1 == '1' then
			isPatrickTurn = true
		else
			isPatrickTurn = false
		end
	end
end