function onCreate()
    makeLuaSprite('MMBG_1', 'MMBG_1',-670,-300)
    addLuaSprite('MMBG_1', 0, 0)
    scaleObject('MMBG_1', 0.9, 0.9)
    setScrollFactor('MMBG_1', 0.6, 0.6);

    makeLuaSprite('MMBG_2', 'MMBG_2',-670,-300)
    addLuaSprite('MMBG_2', 0, 0)
    scaleObject('MMBG_2', 0.9, 0.9)
    setScrollFactor('MMBG_2', 0.7, 0.7);

    makeLuaSprite('MMBG_3', 'MMBG_3',-670,-300)
    addLuaSprite('MMBG_3', 0, 0)
    scaleObject('MMBG_3', 0.9, 0.9)
    setScrollFactor('MMBG_3', 0.8, 0.8);

    makeLuaSprite('MMBG_4', 'MMBG_4',-670,-300)
    addLuaSprite('MMBG_4', 0, 0)
    scaleObject('MMBG_4', 0.9, 0.9)
    setScrollFactor('MMBG_4', 0.9, 0.9);

    makeLuaSprite('MMBG_5', 'MMBG_5',-670,-300)
    addLuaSprite('MMBG_5', 0, 0)
    scaleObject('MMBG_5', 0.9, 0.9)
end

function onCreatePost()
    setProperty('gf.alpha', 1)
end