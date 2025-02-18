function onCreatePost()
    if getPropertyFromClass('ClientPrefs', 'shaders') ~= false then
    initLuaShader('HeatwaveShader');

    makeLuaSprite('caShader', '', 0, 0);
    setSpriteShader('caShader', 'ChromaticAbberation');
    setShaderFloat('caShader', 'amount', -0.2);

    makeLuaSprite('heatwaveShader', '', 0, 0);
    setSpriteShader('heatwaveShader', 'HeatwaveShader');
    setShaderSampler2D('heatwaveShader', 'distortTexture', 'heatwave');

    makeLuaSprite('bloomShader', '', 0,0)
    setSpriteShader('bloomShader', 'bloom')
    

    end
end

function onStepHit()
    if getPropertyFromClass('ClientPrefs', 'shaders') ~= false then
    if curStep == 2112 then
        runHaxeCode([[
        
        var filter:ShaderFilter = new ShaderFilter(game.getLuaObject('heatwaveShader').shader);
        var filter2:ShaderFilter = new ShaderFilter(game.getLuaObject('caShader').shader);
        var filter3:ShaderFilter = new ShaderFilter(game.getLuaObject('bloomShader').shader);
        
        game.camGame.setFilters([filter, filter2, filter3]);

 

    ]]);
    end
    end
end

function onUpdate(elapsed)
    if getPropertyFromClass('ClientPrefs', 'shaders') ~= false then
    setShaderFloat('heatwaveShader', 'iTime', os.clock())
    end
end