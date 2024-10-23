playVideo = true;
playCutscene = true;

function onStartCountdown()
	if isStoryMode and not seenCutscene then 
		if playVideo then
			startVideo('takistart')
			playSound('cutscene')
			playVideo = false
			return Function_Stop
		elseif playCutscene then
			playCutscene = false
			playAnim('cutscenedad', 'anim')
			runTimer('pedroporro', 5)
			runTimer('shake', 1.7)
			return Function_Stop
		end
	end
	return Function_Continue
end

function onCreate()
	precacheSound('cutscene')
end

if isStoryMode and not seenCutscene then
	function onCreatePost()
		initLuaShader('invert')
		nc_snap_target('screen')
		nc_snap_zoom('game', 1)
		setPosition('dad', getProperty('dad.x')-300, getProperty('dad.y')+300)
		setPosition('boyfriend', getProperty('boyfriend.x')+120, getProperty('boyfriend.y')+120)

		makeAnimatedLuaSprite('fakegf', 'gfcuts', 1008, 100)
		addAnimationByPrefix('fakegf', 'tooscared', 'gf_cutscene', 24, false)
		addAnimationByPrefix('fakegf', 'scared', 'gf_scared')
		scaleObject('fakegf', 0.43,0.43)
		addLuaSprite('fakegf')

		makeAnimatedLuaSprite('cutscenedad', 'cutscenedad', 800, 50)
		addAnimationByPrefix('cutscenedad', 'anim', 'cutscenedad', 24, false)
		scaleObject('cutscenedad', 0.43,0.43)
		addLuaSprite('cutscenedad')

		makeLuaSprite('fakestrums', 'cutredemierda', 645, -50)
		scaleObject('fakestrums', 0.7,0.7)	
		addLuaSprite('fakestrums')

		makeAnimatedLuaSprite('widowbreak', 'break', 1000, -50)
		setProperty('widowbreak.alpha', 0.65)
		addAnimationByPrefix('widowbreak', 'break', 'Símbolo 2', 24, false)
		scaleObject('widowbreak', 0.43,0.43)
		addLuaSprite('widowbreak')
		setProperty('widowbreak.visible', false)

		setProperty('gf.visible', false)
	end

	function onUpdate()
		if keyPressed('back') then exitSong() end
		if keyboardJustPressed('ONE') then restartSong() end
	end

	local pedroporro = true
	function onTimerCompleted(t,l,ll)
		if t == 'shake' then
			playAnim('fakegf', 'tooscared')
			nc_shake('game', 10,10, 1, 'linear')
			setSpriteShader('screen', 'invert')
			runTimer('bgblend', 0.1)
			runTimer('windowBreal', 0.4)
		end
		if t == 'bgblend' and pedroporro then
			removeSpriteShader('screen')
			setBlendMode('screen', 'multiply')
			runTimer('bgblend2', 0.1)
		end
		if t == 'bgblend2' then
			setSpriteShader('screen', 'invert')
			runTimer('bgblend3', 0.1)
		end
		if t == 'bgblend3' then
			pedroporro = false
			removeSpriteShader('screen')
			setBlendMode('screen', '')
			runTimer('bgblend', 0.1)
		end
		if t == 'windowBreal' then
			setProperty('widowbreak.visible', true)
			playAnim('widowbreak', 'break')
			runTimer('windowbyebye', 1)
		end
		if t == 'windowbyebye' then
			doTweenAlpha('windowtxw', 'widowbreak', 0, 2)
		end
		if t == 'pedroporro' then
			nc_focus('center', 2, 'quadinout', false)
			nc_zoom('game', 0.55, 2, 'quadinout')
			tweenPos('dadtwn', 'dad', {getProperty('dad.x')+300, getProperty('dad.y')-300}, 2 + 1.5, 'quadout')
			outer_changeDisplay(2)
			removeLuaSprite('fakestrums')
			removeLuaSprite('cutscenedad')
			removeLuaSprite('fakegf')
			tweenPos('bftwn', 'boyfriend', {getProperty('boyfriend.x')-120, getProperty('boyfriend.y')-120}, 2 + 1.5, 'quadout')
			runTimer('porro', 4)
			setProperty('boyfriend.specialAnim', true)
			playAnim('boyfriend', 'tp-loop', true)
			runTimer('boyfiran', 1)
		end
		if t == 'porro' then
			setProperty("skipCountdown", true)
			nc_reloadTargets()
			outer_changeDisplay(1)
			startCountdown()
		end
		if t == 'boyfiran' then
			playAnim('boyfriend', 'tp', true)
			runTimer('playnuim', 2)
		end
		if t == 'playnuim' then
			setProperty('gf.specialAnim', true)
			playAnim('gf', 'tp', true)
			setProperty('gf.visible', true)
			playAnim('boyfriend', 'idle', true)
		end
	end

	function tweenPos(tag, obj, pos, time, ease)
		doTweenX(tag..'X', obj, pos[1], time, ease)
		doTweenY(tag..'Y', obj, pos[2], time, ease)
	end

	function setPosition(obj,x,y)
		setProperty(obj..'.x', x)
		setProperty(obj..'.y', y)
	end
end