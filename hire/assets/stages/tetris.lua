function onCreate()
	-- background shit

	makeLuaSprite('bg', 'tetris/tetrisbg', -2100, -170)

	addLuaSprite('bg', true)
	setProperty('bg.antialiasing',false)

	setObjectOrder('gfGroup', 2)


end

