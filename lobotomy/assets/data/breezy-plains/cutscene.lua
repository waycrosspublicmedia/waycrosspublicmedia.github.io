local xx3 = -750;
local yy3 = 200;
local xx = -750;
local yy = 200;
local xx2 = 280;
local yy2 = 200;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;
local allowCountdown = false
-- cutsceneeeeeee
function onStartCountdown()
    addCharacterToList('abnormal-shoot-gf','dad')
	setProperty('defaultCamZoom', 0.5)
	if not allowCountdown then
		setProperty('camHUD.alpha', 0)
		runTimer('cutStart', 1)
		xx3 = 280;
		yy3 = 400;
		return Function_Stop;
	end
end
local allowEndShit = false
function onEndSong()
	if not allowEndShit then
        runTimer('cutending', 0.5)
		allowEndShit = true;
		return Function_Stop;
	end
    return Function_Continue;
end

function onTimerCompleted(t)
	local timerFuncs = {
		['cutStart'] = function()
			allowCountdown = true
			playSound('respawn', 1);
			playSound('respawn', 0.5);
			runTimer('cutMid', 1)
		end,
        ['cutMid'] = function()
			doTweenAlpha('girlappear','boyfriend',1,1,'linear')
			playAnim('boyfriend', 'appear')
			runTimer('cutEnd', 2)
		end,
		['cutEnd'] = function()
			startCountdown()
			doTweenAlpha('hud', 'camHUD', 1, 0.5 / playbackRate, 'quadOut')
			xx3 = -750;
			yy3 = 200;
		end,
		['cutending'] = function()
			triggerEvent('Change Character','dad','abnormal-shoot-gf')
			doTweenY('fith', 'dad', -400, 0.001, 'quartOut')
			doTweenAlpha('hud', 'camHUD', 0, 0.5 / playbackRate, 'quadOut')
			runTimer('cut2ending', 2)
			runTimer('sfx', 1.2)
			runTimer('aimgun', 1.75)
		end,
		['sfx'] = function()
			playAnim('dad', 'aim')
			playSound('big_blast_chargeup', 1);
			playSound('big_blast_chargeup', 0.5);
		end,
		['aimgun'] = function()
			playAnim('dad', 'idleaim')
		end,
		['cut2ending'] = function()
			playAnim('boyfriend', 'reaction')
			playAnim('gf', 'reactionaim')
			runTimer('cut3ending', 2)
		end,
		['cut3ending'] = function()
			playAnim('dad', 'turn')
			playAnim('gf', 'reactionturn')
			playAnim('boyfriend', 'aimreaction')
			runTimer('cut4ending', 0.5)
		end,
		['cut4ending'] = function()
			playSound('alert_explode_sfx', 1);
			playSound('alert_explode_sfx', 0.5);
			playAnim('dad', 'shoot')
			playAnim('gf', 'reactionshoot')
			playAnim('boyfriend', 'shootreaction')
			runTimer('realending', 7)
			runTimer('blackout', 0.05)
		end,
		['blackout'] = function()
			cameraShake('hud', 0.05, 5.2)
			setProperty('camGame.visible', false)
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'ffffff')
			  addLuaSprite('flash', true);
			  setLuaSpriteScrollFactor('flash',0,0)
				  setObjectCamera('flash', 'other')
			  setProperty('flash.scale.x',2)
			  setProperty('flash.scale.y',2)
			  setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,5,'linear')
		end,
		['realending'] = function()
			endSong()
		end
	}
	
	if timerFuncs[t] then
		timerFuncs[t]()
	end
end




 -- icon stufffffff
local gficontrue = false;
function onUpdate()
	if (curBeat >= 752) and (curBeat <= 767) then
		gficontrue = true
	end
	if dadName == 'abnormal-featured-1' and gfSection then
		gficontrue = true
	end
	if dadName == 'abnormal-featured-1' and not gfSection then
		gficontrue = false
	end
	if dadName == 'abnormal-featured-1' then
		local lol = math.random(1,4)
		if getProperty('health') > 1.6 then
			if (lol >= 1) then
				doTweenAngle('tt', 'iconP2', -2, stepCrochet*0.00000000009, 'circOut')
			end
			if (lol >= 2) then
				doTweenAngle('tt', 'iconP2', -1, stepCrochet*0.00000000009, 'circOut')
			end
			if (lol >= 3) then
				doTweenAngle('tt', 'iconP2', 1, stepCrochet*0.00000000009, 'circOut')
			end
			if (lol >= 4) then
				doTweenAngle('tt', 'iconP2', 2, stepCrochet*0.00000000009, 'circOut')
			end
		end
	end
	setTextString('botplayTxt', "COOLDUDECRAFTER") 
        if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if (mustHitSection == false) and (gfSection == true) then
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        elseif (mustHitSection == false) and (gfSection == false) then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy-ofs3)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
               triggerEvent('Camera Follow Pos',xx3,yy+ofs3)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
            end
        elseif (mustHitSection == true) and (gfSection == false) then

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
        elseif (mustHitSection == true) and (gfSection == true) then

            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
	        if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        end
        else
            triggerEvent('Camera Follow Pos','','')
        end
    if curBeat == 8 then
        xx3 = -250;
        yy3 = -500;
    end
	if curBeat == 584 then
		xx = -1300;
		yy = 250;
	end
	if curBeat == 656 then
		xx = -750;
		yy = 200;
	end
	if curBeat == 862 then
		xx = -280;
		yy = 0;
	end
end
	function onCreate()
		setProperty('boyfriend.alpha', 0)
		if not hideHud then
		makeAnimatedLuaSprite('icon3', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
		loadGraphic('icon3', 'icons/icon-insane-face', 150)
		addAnimation('icon3', 'icons/icon-insane-face', {0, 1}, 0, true)
		addAnimation('icon3', 'icons/icon-insane-face', {1, 0}, 0, true)
		addLuaSprite('icon3', true)
		setObjectOrder('icon3', getObjectOrder('iconP2') + 1)
		setObjectCamera('icon3', 'hud')
		setProperty('icon3.alpha', 1)

		makeLuaSprite('feature', 'icons/feature-ring', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addLuaSprite('feature', true)
		setObjectOrder('feature', getObjectOrder('iconP2') - 0.1)
		setObjectCamera('feature', 'hud')
		setProperty('feature.alpha', 1)
		end

		if not hideHud then
			makeAnimatedLuaSprite('win3', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
			loadGraphic('win3', 'icons/win-insane-face', 150)
			addLuaSprite('win3', true)
			setObjectOrder('win3', getObjectOrder('iconP2') + 1)
			setObjectCamera('win3', 'hud')
			setProperty('win3.alpha', 1)
			end
	end
	
	function onUpdatePost()
		if gficontrue == true then
			setProperty('iconP1.alpha', 0)
			setProperty('winningIcon.alpha', 0)
			if not hideHud then
				setProperty('icon3.y', getProperty('iconP1.y'))
				setProperty('icon3.x', getProperty('iconP1.x'))
				setProperty('icon3.scale.x', getProperty('iconP1.scale.x'))
				setProperty('icon3.scale.y', getProperty('iconP1.scale.y'))
				setObjectOrder('icon3', getObjectOrder('iconP1') + 1)
				setProperty('icon3.angle', getProperty('iconP1.angle'))
				setProperty('icon3.flipX', true)

				setProperty('win3.y', getProperty('iconP1.y'))
				setProperty('win3.x', getProperty('iconP1.x'))
				setProperty('win3.scale.x', getProperty('iconP1.scale.x'))
				setProperty('win3.scale.y', getProperty('iconP1.scale.y'))
				setObjectOrder('win3', getObjectOrder('iconP1') + 1)
				setProperty('win3.angle', getProperty('iconP1.angle'))
				setProperty('win3.flipX', true)
			end
			if getProperty('health') < .375 then
				setProperty('icon3.animation.curAnim.curFrame', '0')
				setProperty('icon3.alpha', 1)
				setProperty('win3.alpha', 0)
			elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
				setProperty('icon3.animation.curAnim.curFrame', '1')
				setProperty('icon3.alpha', 1)
				setProperty('win3.alpha', 0)
			elseif getProperty('health') > 1.6 then
				setProperty('icon3.alpha', 0)
				setProperty('win3.alpha', 1)
			end
		else
			setProperty('icon3.alpha', 0)
			setProperty('win3.alpha', 0)
			setProperty('iconP1.alpha', 1)
			setProperty('winningIcon.alpha', 1)
		end
		if dadName == 'abnormal-featured-1' then
			setProperty('feature.alpha', 1)
			setProperty('feature.y', getProperty('iconP2.y'))
			setProperty('feature.x', getProperty('iconP2.x'))
			setObjectOrder('feature', getObjectOrder('winningIconDad') - 0.1)
			setProperty('feature.angle', getProperty('iconP2.angle'))
		else
			setProperty('feature.alpha', 0)
		end
	end
function onBeatHit()
	if dadName == 'abnormal-featured-1' then
		if getProperty('health') < 1.6 then
			setProperty('feature.scale.x', 1.1)
			setProperty('feature.scale.y', 1.1)
			doTweenX('aswas', 'feature.scale', 1, 0.2, 'linear')
			doTweenY('aswa2s', 'feature.scale', 1, 0.2, 'linear')
		else
			setProperty('feature.scale.x', 1.5)
			setProperty('feature.scale.y', 1.5)
			doTweenX('aswas', 'feature.scale', 1.2, 0.2, 'linear')
			doTweenY('aswa2s', 'feature.scale', 1.2, 0.2, 'linear')
		end
	end
end