function onCreate()

--code by MinerGuyBr

makeLuaSprite('FadeName', '', 0, -50)

makeGraphic('FadeName', 1920, 1920, '000000')

addLuaSprite('FadeName', true)

setObjectCamera('FadeName', 'game')

end

function onSongStart()

doTweenAlpha('FadeAlpha', 'FadeName', 0, 19, 'easeOut')

end

--code by rs after this bc i needed a script to put this in
function onGameOver()
    makeLuaSprite('blackout', '', 0, -50)
    makeGraphic('blackout', 1920, 1920, '000000')
    addLuaSprite('blackout', true)
    setObjectCamera('blackout', 'hud')
    restartSong(false)
    return Function_Stop
end