function onCreate()
    makeLuaSprite('babystepsBG', 'babystepsBG', -130,260)
    addLuaSprite('babystepsBG', 0, 0)
    scaleObject('babystepsBG', 0.8,0.8)

    makeLuaSprite('vignette', 'vignette', 0,0)
    addLuaSprite('vignette', 0, 0)
    setObjectCamera('vignette', 'hud')

	makeLuaSprite('whiteScreen', '', 0, 0);
	makeGraphic('whiteScreen',screenWidth*1.5,screenHeight*1.5,'FFFFFF')
	addLuaSprite('whiteScreen', true);
    setObjectCamera('whiteScreen', 'hud')


end

function onCreatePost()
    setProperty('gf.visible', false)
end

function onSectionHit()
    if not mustHitSection then
        setProperty('defaultCamZoom', 1)
    else
        setProperty('defaultCamZoom', 1.1)
    end
end

function onSongStart()
    doTweenAlpha('whiteScreenOut', 'whiteScreen', 0,5,'sineIn')
end