function onCreate()

	makeLuaText('ewj1', 'You FUCKING FREAK.', 400, 442, 120)
	setTextAlignment('ewj1', 'center')
	setTextSize('ewj1', 30)
	setTextColor('ewj1', 'EE7070')

	makeLuaText('ewjD', 'You used my suit as a DIAPER?!', 400, 442, 120)
	setTextAlignment('ewjD', 'center')
	setTextSize('ewjD', 30)
	setTextColor('ewjD', 'EE7070')

	makeLuaText('sonic1', 'Now you crossed the line, you ASSHOLE!', 400, 442, 120)
	setTextAlignment('sonic1', 'center')
	setTextSize('sonic1', 30)
	setTextColor('sonic1', '5d80f5')

	makeLuaText('ewj2', "You're DEAD, Sonic!", 400, 442, 120)
	setTextAlignment('ewj2', 'center')
	setTextSize('ewj2', 30)
	setTextColor('ewj2', 'EE7070')

	makeLuaText('sonic2', 'You mess with me, you mess with my whole family!', 400, 442, 120)
	setTextAlignment('sonic2', 'center')
	setTextSize('sonic2', 30)
	setTextColor('sonic2', '5d80f5')
end

function onStepHit()

	if curStep == 263 then
		addLuaText('ewjD')
	end
	if curStep == 287 then
		removeLuaText('ewjD', true)
	end
	if curStep == 1068 then
		addLuaText('ewj1')
	end
	if curStep == 1088 then
		removeLuaText('ewj1', true)
	end
	if curStep == 1092 then
		addLuaText('sonic1')
	end
	if curStep == 1120 then
		removeLuaText('sonic1', true)
	end
	if curStep == 1126 then
		addLuaText('ewj2')
	end
	if curStep == 1143 then
		removeLuaText('ewj2', true)
	end
	if curStep == 1148 then
		addLuaText('sonic2')
	end
	if curStep == 1176 then
		removeLuaText('sonic2', true)
	end
end