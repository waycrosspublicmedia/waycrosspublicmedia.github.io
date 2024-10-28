local enabled = true

if enabled and not lowQuality then

	
	function onCreate()
		makeLuaSprite("bar_upper", nil, 0, -50)
		makeGraphic("bar_upper", 1280, 50, "000000")
		setObjectCamera("bar_upper", "hud")
		addLuaSprite("bar_upper", false)
		
		makeLuaSprite("bar_lower", nil, 0, 720)
		makeGraphic("bar_lower", 1280, 50, "000000")
		setObjectCamera("bar_lower", "hud")
		addLuaSprite("bar_lower", false)


	end

	function onStartCountdown()

      
		doTweenY("bar_upper", "bar_upper", 0, 2, "quintout")
		doTweenY("bar_lower", "bar_lower", 720 - 50, 2, "quintout")
	end

end

-- crash prevention
function onUpdate() end
function onUpdatePost() end
