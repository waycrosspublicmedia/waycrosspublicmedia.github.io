
function onCreate()
    for i, bg in pairs({'sky','ground','rock'}) do
	    makeLuaSprite(bg, 'stage_bg/patrick_rock/patrick_'..bg, (i<2) and -700 or -1300, (i<2) and -450 or -550)
	    if (i<2) then setScrollFactor(bg, 0.5, 0.5) end
	    addLuaSprite(bg)
	end
	
	close(true) 
end