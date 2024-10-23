-- Opp Brown camera offsets
local xx = 460;
local yy = 500;
-- BF camera offests
local xx2 = 660;
local yy2 = 500;

local ofs = 15;
--local followchars = true;
local cutsceneEnded = false

function onCreate()
    makeLuaSprite('blackBG','',-1000,-1000)
	makeGraphic('blackBG',4000,4000,'ffffff')
	addLuaSprite('blackBG', true)
	--setObjectCamera('blackBG','hud')
    setProperty('blackBG.alpha', 0.0001)

	addLuaScript('Gameover')
end

function onEndSong()
	-- song ended/starting transition (Will be delayed if you're unlocking an achievement)
	if isStoryMode and not cutsceneEnded then 
        --if score > number then
            startVideo('southpark_dog');
            cutsceneEnded = true;
            return Function_Stop --to stop the song from ending for playing a cutscene or something.
        --end
    end
	return Function_Continue;
end

function onBeatHit()
	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

	if getProperty('dad.animation.curAnim.name') == 'idle' then
		characterPlayAnim('dad','idle',true)
	end

	if curBeat == 4 then
		--followchars = true
	end

	if curBeat == 31 then
		doTweenZoom('screenZoom', 'camGame', 0.9, 0.46, 'quintIn');
	end

	if curBeat == 32 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curBeat == 60 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curBeat == 61 then
		setProperty('defaultCamZoom', 0.95)
	end

	if curBeat == 62 then
		setProperty('defaultCamZoom', 1)
	end

	if curBeat == 63 then
		setProperty('defaultCamZoom', 1.05)
	end

	if curBeat == 64 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curBeat == 83 then
		doTweenZoom('screenZoom', 'camGame', 0.85, 0.46, 'quintIn');
	end

	if curBeat == 95 then
		doTweenZoom('screenZoom', 'camGame', 0.9, 0.46, 'quintIn');
	end
 	if curBeat == 96 then
		setProperty('defaultCamZoom', 0.8)
	end

	--if you ever need this again for  the cam follow pos event, x = 600 and y = 500
	--turn off cam following shizz
	if curBeat == 159 then
		doTweenZoom('screenZoom', 'camGame', 0.85, 0.46, 'quintIn');
		--followchars = false
	end

	if curBeat == 161 then
		doTweenZoom('screenZoom', 'camGame', 0.6, 13.39, 'quadOut');
	end

	if curBeat == 190 then
		setProperty('defaultCamZoom', 0.6)
	end
-- cam follow is back
	if curBeat == 192 then
		setProperty('defaultCamZoom', 0.8)
		--followchars = true
	end

	if curBeat == 204 then
		doTweenZoom('screenZoom', 'camGame', 0.9, 9.23, 'quadIn');
		--doTweenAlpha('screenFade', 'blackBG', 1, 9, 'linear');
	end

	if curBeat == 224 then

	end

	if curBeat == 229 then
		--doTweenAlpha('hudFade', 'camHUD', 0.0001, 1, 'linear');
	end


end

function onStepHit()
	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.015*camInt,0.03*camInt)
	end

end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end
end

function onCreatePost()

	followchars = false;

--bf animated icon shit
	makeAnimatedLuaSprite('bfIcon', 'icons/icon-bf-peanuts', getProperty('iconP1.x'), getProperty('iconP1.y'))
	luaSpriteAddAnimationByPrefix('bfIcon', 'idle', 'BF p healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('bfIcon', 'losing', 'BF p hurt icon', 24, true)
	setObjectCamera('bfIcon', 'hud')
	addLuaSprite('bfIcon', true)
	setObjectOrder('bfIcon', getObjectOrder('iconP1') + 1)
	setProperty('iconP1.visible', false)
	objectPlayAnimation('bfIcon', 'idle', true)

--tankman animated icon shit
	makeAnimatedLuaSprite('dadIcon', 'icons/icon-franklin', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('dadIcon', 'idle', 'franklin healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('dadIcon', 'losing', 'franklin hurt icon', 24, true)
	setObjectCamera('dadIcon', 'hud')
	addLuaSprite('dadIcon', true)
	setObjectOrder('dadIcon', getObjectOrder('iconP2') + 1)
	setProperty('iconP2.visible', false)
	objectPlayAnimation('dadIcon', 'idle', true)
end

function onUpdate()

--bf icon shit
	setProperty('bfIcon.x', getProperty('iconP1.x') + 15)
	setProperty('bfIcon.y', getProperty('iconP1.y') - 10)
	setProperty('bfIcon.angle', getProperty('iconP1.angle'))
	scaleObject('bfIcon', getProperty('iconP1.scale.x'), getProperty('iconP1.scale.y'))
	if getProperty('healthBar.percent') < 20 then
		if getProperty('bfIcon.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('bfIcon', 'losing', true)
		end
	else
		if getProperty('bfIcon.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('bfIcon', 'idle', true)
		end
	end

	--snoopy icon shit
	setPropertyLuaSprite('dadIcon', 'flipX', true);
	setProperty('dadIcon.x', getProperty('iconP2.x') + 13)
	setProperty('dadIcon.y', getProperty('iconP2.y') + 10)
	setProperty('dadIcon.angle', getProperty('iconP2.angle'))
	scaleObject('dadIcon', getProperty('iconP2.scale.x'), getProperty('iconP2.scale.y'))
	if getProperty('healthBar.percent') > 80 then
		if getProperty('dadIcon.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('dadIcon', 'losing', true)
		end
	else
		if getProperty('dadIcon.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('dadIcon', 'idle', true)
		end
	end

	--[[if followchars == true then

		if mustHitSection == false then
			local dadAnim = getProperty('dad.animation.curAnim.name')

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
	end]]--
end



