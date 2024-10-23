local xx = -100; --dad
local yy = 280; --dad
local yyh = 300;
local xx2 = 200; --bf
local yy2 = 280; --bf
local ofs = 10;
local ofs2 = 10;
local followchars = true;
local del = 0;
local del2 = 0;

local constantFollow = false;
local camFollow = {0, -1380}

function onCreate() if not lowQuality then enabled = false; multiplier = 0; setProperty("camGame.zoom", 1.0) setProperty("camHUD.alpha", 0) setProperty("camGame.alpha", 0) followchars = false; constantFollow = true; end end

function onStepHit()
	if curStep == 1 then
		doTweenAlpha("cameraShow", "camGame", 1, 1.9, 'linear')
	elseif curStep == 64 and not lowQuality then --The amount of times this had to be changed 'cause there was a split second of cutoff
		doTweenNumber("cameraToPosY", camFollow[2], yy2, 5.4, 'cubeInOut') doTweenNumber("cameraToPosX", camFollow[1], 0, 5, 'cubeInOut')
		doTweenZoom("cameraToPosZoom", "camGame", 0.9, 4.9, 'sineInOut') doTweenAlpha("cameraHUDShow", "camHUD", 1, 1.9, 'linear')
	elseif curStep == 124 and not lowQuality then constantFollow = false; followchars = false; triggerEvent('Camera Follow Pos') end
end

function onTweenCompleted(tag) if tag == "cameraToPosZoom" and not lowQuality then setProperty("defaultCamZoom", 0.9) end end
function onNumberTweenUpdate(tag, num)
	if tag == "cameraToPosY" and not lowQuality then camFollow[2] = num; end
	if tag == "cameraToPosX"and not lowQuality then camFollow[1] = num; end
end

function onUpdate()
		if del > 0 then
			del = del - 1
		end
		if del2 > 0 then
			del2 = del2 - 1
		end
		
		if followchars == true then
			if mustHitSection == false then
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx-ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx+ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx,yy-ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx,yy+ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'Hey' then
					triggerEvent('Camera Follow Pos',xx-ofs, yyh)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
					triggerEvent('Camera Follow Pos',xx+ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
					triggerEvent('Camera Follow Pos',xx,yy-ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
					triggerEvent('Camera Follow Pos',xx,yy+ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
					triggerEvent('Camera Follow Pos',xx,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx,yy)
				end
			else

				if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
				end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx2,yy2)
				end
			end
		elseif constantFollow then
			triggerEvent('Camera Follow Pos', camFollow[1], camFollow[2])
		end
end