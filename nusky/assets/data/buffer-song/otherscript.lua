local allowCountdown = false

bit = 2


function onCreate()


end
function onEndSong()


	bit = bit - 1
	if isStoryMode and bit >0 then --Block the first countdown
	
	if seenCutscene then bit = 1 end
		if bit == 2 then
			debugPrint('diastart')
			addLuaScript('dialogue',true)
			return Function_Stop;
		end
		if bit == 1 then
			addLuaScript('data/manifest')
			return Function_Stop;
		end
	end
	if bit<= 0 then
	return Function_Continue;
	end
end
function onStartCountdown()

	bit = bit - 1
	if not isStoryMode or seenCutscene  then bit = 0 end
	if isStoryMode and not seenCutscene and bit >0 then --Block the first countdown
	
		if bit == 1 then
			addLuaScript('dialogue',true)
		end
		return Function_Stop;
	end
	if bit == 0 then
	bit = 3
	return Function_Continue;
	end
end