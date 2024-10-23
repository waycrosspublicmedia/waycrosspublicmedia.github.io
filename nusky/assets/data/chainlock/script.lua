local allowCountdown = false

bit = 2


function onUpdatePost()

if getProperty('endingSong') then

	if keyJustPressed('accept') then
		endSong(true)
	end

end

end
function onEndSong()


	bit = bit - 1
	if isStoryMode and bit >0 then --Block the first countdown
	
		if bit == 1 then
			rank = 'good'
			if ratingFC == 'Clear' then
			rank = 'bad'
			end
			makeLuaSprite('ending','endings/sky'..rank,0,0)
			addLuaSprite('ending',false)
			scaleObject('ending',2,2)
			screenCenter('ending')
			setProperty('ending.antialiasing',false)
			setObjectCamera('ending','other')
			playMusic(rank..'end',1,false)
		return Function_Stop;
		end
	end
	if bit == 0 then
	return Function_Continue;
	end
end
function onStartCountdown()

	bit = bit - 1
	if isStoryMode and bit >0 then --Block the first countdown
	
		if seenCutscene then bit = 0 end
		if bit == 1 then
			addLuaScript('dialogue',true)
		return Function_Stop;
		end
	else
	return Function_Continue;
	end
	if bit == 0 then
	bit = 2
	return Function_Continue;
	end
end