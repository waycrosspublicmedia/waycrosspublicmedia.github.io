
local camBop = {0.015, 0.03}
local canCoolBop = false

function onStepHit()
	-- curStep has to be a step earlier or else it will skip the first beat call!
	if curStep == 159 or curStep == 687 then canCoolBop = true end
	
	if curStep == 415 or curStep == 943 then canCoolBop = false end
end

function onBeatHit()
	if canCoolBop then triggerEvent('Add Camera Zoom', tostring(camBop[1]), tostring(camBop[2])) end
end