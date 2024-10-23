local allowCountdown = false

bit = 3


function onCreate()


end
function onStartCountdown()

	bit = bit - 1
	
	if isStoryMode and bit >0 then --Block the first countdown
	
	if seenCutscene then bit = 0 end
		if bit == 2 then
		startVideo('NuSky_cutscene');
		return Function_Stop;
		end
		
		if bit == 1 then
			addLuaScript('dialogue',true)
		return Function_Stop;
		end
	end
	if bit == 0 then
	return Function_Continue;
	end
end