function onCreate()
	-- background shit
	makeLuaSprite('sback', 'sback', -2000, -900);
        scaleObject('sback', 1.1, 1.1);
	setScrollFactor('sback', 1.1, 1.1);

	makeLuaSprite('sground', 'sground', -1710, -950);
        scaleObject('sground', 1.1, 1.1);
	setScrollFactor('sground', 1.0, 1.0);

	makeLuaSprite('swall', 'swall', -2000, -650);
        scaleObject('swall', 1.1, 1.1);
	setScrollFactor('swall', 1.0, 1.0);

	makeAnimatedLuaSprite('neige', 'neige', -1680,-1000)
    addAnimationByPrefix('neige', 'a', 'lll', 24, true)
	objectPlayAnimation('neige', 'a', true)
	scaleObject('neige', 4.4, 4.4);
    setScrollFactor('neige', 1, 1);

	addLuaSprite('sback', false);
	addLuaSprite('swall', false);
	addLuaSprite('sground', false);

end

function onEvent(event, v1, v2)
	if event == 'pixelStage' then
                addLuaSprite('neige', true)
		setProperty('defaultCamZoom', 0.4)
		setProperty('camGame.zoom', 0.4)
	end
end