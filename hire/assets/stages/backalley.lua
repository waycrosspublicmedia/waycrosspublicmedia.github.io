function onCreate()
	-- background shit

	makeLuaSprite('bg', 'humans/for_hire2', -130, 0)
	setScrollFactor('bg', 0.9, 0.9)
	makeLuaSprite('stuff', 'humans/for_hire1', -130, 0)

	addLuaSprite('bg', false)
	addLuaSprite('stuff', false)
end

function onCreatePost()

	setProperty('gf.visible',false)
end

