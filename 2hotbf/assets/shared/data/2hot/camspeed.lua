function onStepHit()
	
	if curStep == 544 or curStep == 1192 or curStep == 1024 or curStep == 1408 or curStep == 2464 or curStep == 2640 then
	
		setProperty('cameraSpeed', 99) 
		
	end
	
	if curStep == 550 or curStep == 1201 or curStep == 1040 or curStep == 1432 or curStep == 1718 or curStep == 2480 then
	
		setProperty('cameraSpeed', 1) 
		
	end
	if curStep == 1584 then
	
		setProperty('cameraSpeed', 0.5)
		end
end