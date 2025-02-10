function onCreate()

	makeLuaText('mario1', 'Shing!', 400, 442, 120)
	setTextAlignment('mario1', 'center')
	setTextSize('mario1', 30)
	setTextColor('mario1', 'd43950')

	makeLuaText('mario2', "You sonuva' bitch...", 400, 442, 120)
	setTextAlignment('mario2', 'center')
	setTextSize('mario2', 30)
	setTextColor('mario2', 'd43950')

	makeLuaText('mario3', "Why is this thing here?", 400, 442, 120)
	setTextAlignment('mario3', 'center')
	setTextSize('mario3', 30)
	setTextColor('mario3', 'd43950')

	makeLuaText('mario4', "These don't occur in nature.", 400, 442, 120)
	setTextAlignment('mario4', 'center')
	setTextSize('mario4', 30)
	setTextColor('mario4', 'd43950')

end

function onStepHit()

	if curStep == 248 then
		addLuaText('mario1')
	end
	if curStep == 260 then
		removeLuaText('mario1', true)
	end
	if curStep == 1604 then
		addLuaText('mario2')
	end
	if curStep == 1628 then
		removeLuaText('mario2', true)
	end
	if curStep == 1635 then
		addLuaText('mario3')
	end
	if curStep == 1658 then
		removeLuaText('mario3', true)
		addLuaText('mario4')
	end
	if curStep == 1680 then
		removeLuaText('mario4', true)
	end
end