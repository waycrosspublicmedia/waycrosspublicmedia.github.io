local zoomVal = 0.2; -- adjust this to how much you want it to zoom


function lerp(a, b, ratio)
	return a + ratio * (b - a);
end

function onCreatePost()
	if getPropertyFromClass('ClientPrefs', 'shaders') ~= false then
	initLuaShader('radialBlur')

	makeLuaSprite('shadertest', '', 0, 0);
	setSpriteShader('shadertest','radialBlur')

	setShaderFloat('shadertest','cx',0.5) --center x
	setShaderFloat('shadertest','cy',0.5) --center y
	setShaderFloat('shadertest','blurWidth',0)-- blur amount
    	addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
		trace(ShaderFilter);
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shadertest").shader)]);
	]])
	setShaderFloat('shadertest','cx',0.5)

	initLuaShader('waveWarp')
	setSpriteShader('BG','waveWarp')



	end
end





 
function onEvent(n)
	if n == 'Add Camera Zoom' then
		setShaderFloat('shadertest', 'blurWidth', getShaderFloat('shadertest', 'blurWidth') + zoomVal);
	end
end


local distortSpeed = 5
function onStepHit()
    if curStep == 1182 then
        zoomVal = 0.5
		distortSpeed = 1
    elseif curStep == 1440 then
        zoomVal = 0.2
	elseif curStep == 1952 then
		distortSpeed = 5
    end
end



--[[If you want to know the credits:
i got a ideia of the script by Washo789, 
the script is made by BF Myt.]]--

function onUpdate()
	if getProperty('camZooming') then
		setShaderFloat('shadertest','blurWidth', lerp(0, getShaderFloat('shadertest', 'blurWidth'), 0.85));
    end


		


	setShaderFloat("BG", "iTime", os.clock()/distortSpeed)


end





    


function onStartCountdown() end
function onCountdownStarted() end
function onCountdownTick(swagCounter) end
function onUpdateScore() end
function onNextDialogue(line) end
function onSkipDialogue(line) end
function eventEarlyTrigger(name) end
function onResume() end
function onSpawnNote(id, dir, type, sustain) end
function onGameOver() end
function onGameOverStart() end
function onGameOverConfirm(retry) end
function onMoveCamera(target) end
function onEndSong() end
function onGhostTap(key) end
function onKeyPress(key) end
function onKeyRelease(key) end
function noteMissPress(dir) end
function onSectionHit() end
function onRecalculateRating() end
function onTweenCompleted(tag) end
function onSoundFinished(tag) end
function onCustomSubstateCreate(name) end
function onCustomSubstateCreatePost(name) end
function onCustomSubstateUpdate(name, elapsed) end
function onCustomSubstateUpdatePost(name, elapsed) end
function onCustomSubstateDestroy(name) end
function onDestroy() end




