function onCreate()
	-- background shit

	makeLuaSprite('livingwall', 'livingwall', -456, -322)

	makeLuaSprite('things', 'things', -589, -320)

	makeLuaSprite('couch', 'couch', -23, 163)

	makeLuaSprite('table', 'table', 337, 547)
	
	addLuaSprite('livingwall', false)
	setProperty('livingwall.antialiasing',false)
	addLuaSprite('things', false)
	setProperty('things.antialiasing',false)
	addLuaSprite('couch', false)
	setProperty('couch.antialiasing',false)
	addLuaSprite('table', true)
	setProperty('table.antialiasing',false)

end

