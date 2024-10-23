local enabled = true

if enabled and not lowQuality then
	
local thickness = 100
function onCreate()
	makeLuaSprite("bar_upper", nil, 0, -thickness)
	makeGraphic("bar_upper", 1280, thickness, "000000")
	setObjectCamera("bar_upper", "hud")
	addLuaSprite("bar_upper", false)
	
	makeLuaSprite("bar_lower", nil, 0, 720)
	makeGraphic("bar_lower", 1280, thickness, "000000")
	setObjectCamera("bar_lower", "hud")
	addLuaSprite("bar_lower", false)
end

local toggled = false
function onEvent(n,v1,v2)
	if n == 'bars_toggle' then
		if toggled then
			toggled = false
			doTweenY("bar_upper", "bar_upper", -thickness, 2, "quintout")
			doTweenY("bar_lower", "bar_lower", 720, 2, "quintout")
		else
			toggled = true
			doTweenY("bar_upper", "bar_upper", 0, 2, "quintout")
			doTweenY("bar_lower", "bar_lower", 720 - thickness, 2, "quintout")
		end
	end
end
end

-- crash prevention
function onUpdate() end
function onUpdatePost() end
