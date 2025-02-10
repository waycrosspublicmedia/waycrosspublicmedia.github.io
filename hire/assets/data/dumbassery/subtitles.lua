function onCreate()

	makeLuaText('tails1', 'IDIOT!', 400, 442, 120)
	setTextAlignment('tails1', 'center')
	setTextSize('tails1', 30)
	setTextColor('tails1', 'e0af28')

	makeLuaText('sonic1', 'Fuck off!', 400, 442, 120)
	setTextAlignment('sonic1', 'center')
	setTextSize('sonic1', 30)
	setTextColor('sonic1', '5d80f5')

	makeLuaText('tails2', "Stupid fuck...", 400, 442, 120)
	setTextAlignment('tails2', 'center')
	setTextSize('tails2', 30)
	setTextColor('tails2', 'e0af28')

	makeLuaText('sonic2', "You're a bitch.", 400, 442, 120)
	setTextAlignment('sonic2', 'center')
	setTextSize('sonic2', 30)
	setTextColor('sonic2', '5d80f5')
end

function onStepHit()

	if curStep == 668 then
		addLuaText('tails1')
	end
	if curStep == 676 then
		removeLuaText('tails1', true)
	end
	if curStep == 732 then
		addLuaText('sonic1')
	end
	if curStep == 740 then
		removeLuaText('sonic1', true)
	end
	if curStep == 791 then
		addLuaText('tails2')
	end
	if curStep == 800 then
		removeLuaText('tails2', true)
	end
	if curStep == 856 then
		addLuaText('sonic2')
	end
	if curStep == 864 then
		removeLuaText('sonic2', true)
	end
end