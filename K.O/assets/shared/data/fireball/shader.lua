local shaderName = "bloom"

function onCreate()
    if getPropertyFromClass('ClientPrefs', 'shaders') ~= false then
        shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

        makeLuaSprite("tempShader0")



        addHaxeLibrary("ShaderFilter", "openfl.filters")


    end

        
end


function onStepHit()
    if curStep == 1152 then
        runHaxeCode([[
            var shaderName = "]] .. shaderName .. [[";
            game.initLuaShader(shaderName);
            var shader0 = game.createRuntimeShader(shaderName);

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        ]])
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end


function onEvent(n,v1,v2)

end

function lerp(a, b, ratio)

end