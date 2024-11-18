local ratingFCnewiguess = 'N/A'
local russianRatingName = '?'
function onUpdatePost(elapsed)
	local ratePercent = getProperty('ratingPercent') -- no more round!

    local rateFull = math.max(ratePercent * 100, 0)
    local rateFullAsStr = string.format("%.2f", rateFull)
	if old == 'N/A' then
	if songName == 'Singularity' or songName == 'Rabbit Hole extended' or songName == 'Rabbit Hole' then
		if rus == true then
	setTextString('scoreTxt', 'Accuracy:  [' ..rateFullAsStr.. '%]  /  Misses:  [' ..misses.. ']  /  Rating:  [' ..ratingName.. ']  /  ['..ratingFCnewiguess..']')
		end
		end
		if eng == true then
	setTextString('scoreTxt', 'Accuracy:  [' ..rateFullAsStr.. '%]  /  Misses:  [' ..misses.. ']  /  Rating:  [' ..ratingName.. ']  /  ['..ratingFCnewiguess..']')
		end
	end
	if songName == 'Defeat' then
		old = true
	end
	if songName == 'Singularity Remix' or songName == 'Stardust Remix' then
		if rus == true then
	setTextString('scoreTxt', 'Score:  ' ..score.. '  /  Misses:  ' ..misses.. '  /  Rating:  ' ..ratingName..  '  /  Accuracy:  ' ..rateFullAsStr.. '%')
		end
		if eng == true then
	setTextString('scoreTxt', 'Score:  ' ..score.. '  /  Misses:  ' ..misses.. '  /  Rating:  ' ..ratingName..  '  /  Accuracy:  ' ..rateFullAsStr.. '%')
		end
	end
end
function onUpdate()
if difficulty == 0 then
	eng = true
end
if difficulty == 1 then
	rus = true
end
--russian rating thing
	if ratingName == 'Perfect!!' then
		russianRatingName = 'Perfect!!'
	end
	if ratingName == 'Sick!' then
		russianRatingName = 'Sick!'
	end
	if ratingName == 'Great' then
		russianRatingName = 'Great'
	end
	if ratingName == 'Nice' then
		russianRatingName = 'Nice'
	end
	if ratingName == 'You Suck!' then
		russianRatingName = 'You Suck!'
	end
	if ratingName == 'Meh' then
		russianRatingName = 'Meh'
	end
	if ratingName == 'Good' then
		russianRatingName = 'Good'
	end
	if ratingName == 'Bruh' then
		russianRatingName = 'Bruh'
	end
	if ratingName == 'Shit' then
		russianRatingName = 'Shit'
	end
	if ratingName == 'Bad' then
		russianRatingName = 'Bad'
	end
	--fuck
	if ratingFC == 'SFC' then
		ratingFCnewiguess = 'SFC'
	end
	if ratingFC == 'GFC' then
		ratingFCnewiguess = 'GFC'
	end
	if ratingFC == 'FC' then
		ratingFCnewiguess = 'FC'
	end
	if ratingFC == 'SDCB' then
		ratingFCnewiguess = 'SDCB'
	end
	if ratingFC == 'Clear' then
		ratingFCnewiguess = 'Clear'
	end
end