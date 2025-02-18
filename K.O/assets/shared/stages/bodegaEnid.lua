function onCreate()
    makeLuaSprite('bodegaBG', 'bodegaBG', -700,-275)
    addLuaSprite('bodegaBG', 0, 0)
    makeLuaSprite('bodegaBGfake', 'bodegaBGfake', -700,-275)
    addLuaSprite('bodegaBGfake', 0, 0)
    setProperty('bodegaBGfake.alpha', 0.001)
    makeLuaSprite('bodegaDESK', 'bodegaDESK', -700,-275)
    addLuaSprite('bodegaDESK', 0, 0)
end