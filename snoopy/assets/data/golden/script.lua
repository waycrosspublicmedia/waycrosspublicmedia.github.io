-- Opp Brown camera offsets
local xx = 605;
local yy = 680;
-- BF camera offests
local xx2 = 605;
local yy2 = 650;

local ofs = 25;
local followchars = true;

local allowCountdown = false
local incutscene = false

function onStartCountdown()
	if not allowCountdown and not isStoryMode then
	setProperty('camHUD.visible',false)
		makeLuaSprite('charlesBrown', 'charles/Charles S Brown', -400, 30);
		addLuaSprite('charlesBrown', false);
		setProperty('charlesBrown.alpha', 0.0001)

		
		incutscene = true
		allowCountdown = true
		setProperty('inCutscene', true);
		setProperty('camGame.zoom', 0.9);
		playSound('playtime_theme',1, 'creepyMusic')
		runTimer('cutsceneTime', 57.07)
		runTimer('charlesNotHere', 3.0)
		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('camHUD.visible',true)
	return Function_Continue;

end

function onTimerCompleted(t,l,ll)

	if t == 'cutsceneTime' then
		setProperty('charlesBrown.visible',false)
		runTimer('creepyPause', 4.0)
		setProperty('realCharlesBrown.alpha', 1.0)
		stopSound('creepyMusic', true)
	end

	if t == 'charlesNotHere' then
		doTweenAlpha('charlesBrownAppear', 'charlesBrown', 1.0, 13, 'linear')
	end

	if t == 'creepyPause' then
		startCountdown();
	end


end

function onUpdatePost()
	if incutscene then
		if keyboardJustPressed('BACKSPACE') then
			cancelTimer('cutsceneTime', true)
			cancelTween('charlesBrownAppear')
			setProperty('charlesBrown.visible',false)
			runTimer('creepyPause', 4.0)
			setProperty('realCharlesBrown.alpha', 1.0)
			stopSound('creepyMusic', true)
			return Function_Continue;
		end
	end

end

function onCreate()

	makeLuaSprite('realCharlesBrown', 'charles/Charles S Brown REAL', 700, 360);
	addLuaSprite('realCharlesBrown', true);
	scaleObject('realCharlesBrown', 0.6, 0.6);
	setProperty('realCharlesBrown.alpha', 0.0001)

	-- cool cenimatic aspect ratio/black bars
	makeLuaSprite('bartop','',-200,-30)
	makeGraphic('bartop',2000,100,'000000')
	addLuaSprite('bartop',false)
    setScrollFactor('bartop',0,0)
    setObjectCamera('bartop','hud')

    makeLuaSprite('barbot','',-200,650)
	makeGraphic('barbot',2000,100,'000000')
	addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

end

function onBeatHit()

end

function onCreatePost()
	setProperty('dad.visible', false)

	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y',130)
		setPropertyFromGroup('opponentStrums',i,'x',-9999)
	end
end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end

end

function onStepHit()
	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.015*camInt,0.05*camInt)
	end
end

function onUpdate()
	setProperty('gf.visible', false)
	--setProperty('boyfriend.x', 4000)
	setProperty('dad.x', 420)
	setProperty('dad.y', 420)
	if followchars == true then

		if mustHitSection == false then
			local dadAnim = getProperty('dad.animation.curAnim.name')
			setProperty('defaultCamZoom',0.8)

			if dadAnim == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			elseif dadAnim == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			elseif dadAnim == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			elseif dadAnim == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			elseif dadAnim == 'idle' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end

		else
			local bfAnim = getProperty('boyfriend.animation.curAnim.name')
			setProperty('defaultCamZoom',0.6)

			if bfAnim == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
			elseif bfAnim == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
			elseif bfAnim == 'singUP' then
				triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
			elseif bfAnim == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
			elseif bfAnim == 'idle' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
    
end


