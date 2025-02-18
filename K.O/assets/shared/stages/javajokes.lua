function onCreate()
    makeLuaSprite('jjBG', 'jjBG', -1300,-365)
    addLuaSprite('jjBG', 0, 0)

    makeLuaSprite('vignette', 'spot vignette', 0,0)
    addLuaSprite('vignette', false)
    setObjectCamera('vignette', 'hud')
    scaleObject('vignette', 1.01,1.01)
    setProperty('vignette.alpha', 0)
end

function onCreatePost()
    doTweenColor('boyfriendRecolor', 'boyfriend', 'E3D09F', 0.1, 'linear')
    doTweenColor('dadRecolor', 'dad', 'E3D09F', 0.1, 'linear')
end