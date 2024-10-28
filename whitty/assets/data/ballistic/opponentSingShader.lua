chromatic = 0;
function onCreatePost()
--add shader 
initLuaShader("glitchChromatic")
    
    makeLuaSprite("temporaryShader1")
--spriteShaderEffect
    setSpriteShader("temporaryShader1", "glitchChromatic")
    
    makeLuaSprite('shaderXb',nil,0,0)
--runShader   
   runHaxeCode([[

			trace(ShaderFilter);

			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(game.getLuaObject("temporaryShader1").shader)]);
		]])
		
triggerEvent('glitchy transition', '0.022')
end

function onEvent(name, value1, value2)
if name == 'glitchy transition' then
chromatic = chromatic + value1

end
end

function boundTo(value, min, max)
return math.max(min, math.min(max, value))
end

function math.lerp(from,to,i)
return from+(to-from)*i
end

function opponentNoteHit(id,noteData,noteType,isSusNote)
if noteType =='GF Sing But Not Visible Note' then
notGF = false
else
notGF = true
end


if notGF and math.random(1,2) == 1 then
    setProperty('shaderXb.x',chromatic * getRandomFloat(-2, 2) )
    doTweenX('shaderbLol','shaderXb',0,0.3,'linear')
    
--    setProperty('shaderXr.x',chromatic * getRandomFloat(-2, 2) )
 --   doTweenX('shaderrLol','shaderXr',0,0.2,'linear')
    
--  setProperty('shaderXg.x',chromatic * getRandomFloat(-2, 2) )
--  doTweenX('shadergLol','shaderXg',0,0.2,'linear')
end
end
    


function onUpdate(elapsed)
--setShaderFloat("temporaryShader1", "bOffset", chromeOffset * 0);
--    setShaderFloat("temporaryShader1", "rOffset", chromeOffset * 0);
--    setShaderFloat("temporaryShader1", "gOffset", chromeOffset * 0);
setShaderFloat('temporaryShader1', "iTime", os.clock())
  local  Value1 = getProperty('shaderXb.x')
     setShaderFloat('temporaryShader1', "GLITCH", Value1)
     
--     local  Value2 = getProperty('shaderXr.x')
  --   setShaderFloat('temporaryShader1', "rOffset", Value2)
     
--     local  Value3 = getProperty('shaderXg.x')
  --   setShaderFloat('temporaryShader1', "gOffset", Value3)
        
end

function onTweenCompleted(tag)
    if tag == 'shaderbLol' then
        setProperty('shaderXb.x',0)
    end
    
    if tag == 'shaderrLol' then
        setProperty('shaderXr.x',0)
    end
    
    if tag == 'shadergLol' then
        setProperty('shaderXg.x',0)
    end
end

function onSongStart()
--triggerEvent('glitchy transition', '0.01')
end
