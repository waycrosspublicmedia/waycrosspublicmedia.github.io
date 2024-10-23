
function onCreatePost()
    for i, bg in pairs({'order2','order1'}) do
        makeLuaSprite(bg, 'stage_bg/spongeboy_order/spongeboy_'..bg)
        scaleObject(bg, 0.6, 0.6)
        addLuaSprite(bg, i>1)
    end

    runHaxeCode('FlxG.camera.bgColor = 0xFFF0F5F6;')
    triggerEvent('Camera Follow Pos', '750', '500')
end


function onGameOver() runHaxeCode('FlxG.camera.bgColor = 0x00000000;') end
function onDestroy() onGameOver() end