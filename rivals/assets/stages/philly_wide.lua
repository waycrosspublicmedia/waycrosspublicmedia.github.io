local t = 0
local s = 0
--Default Values
local dxx = 1550
local dyy = 1250
local dxx2 = 1550
local dyy2 = 1250
--Current Cam Values, you can change these
local xx = 1500
local yy = 1120
local xx2 = 1500
local yy2 = 1120
local ofs = 0
local followchars = true

local locX = 400
local locY = 500
local scale = 0.55

function onCreate()
	--setProperty('skipCountdown',true)

	makeLuaSprite('bgback', 'bg/bg', locX, locY)
	setScrollFactor('bgback', 1, 1)
	scaleObject('bgback', scale, scale)
	
	makeLuaSprite('fore', 'bg/fore', locX, locY)
	setScrollFactor('fore', 1, 1)
	scaleObject('fore', scale, scale)
	
	makeAnimatedLuaSprite('back_bf', 'bg/bf bop', 1410, 1400)
    addAnimationByPrefix('back_bf', 'idle', 'BF BOP', 24, false)
	setScrollFactor('back_bf', 1, 1)
	makeAnimatedLuaSprite('back_gf', 'bg/gf bop', 1320, 1375)
    addAnimationByPrefix('back_gf', 'idle', 'gf bop', 24, false)
	setScrollFactor('back_gf', 1, 1)
	makeAnimatedLuaSprite('back_pico', 'bg/pico bop', 1480, 1410)
    addAnimationByPrefix('back_pico', 'idle', 'pico bop', 24, false)
	setScrollFactor('back_pico', 1, 1)
	
	makeLuaSprite('bartop', 'bg/bar', 0, 680)
	makeLuaSprite('barbot', 'bg/bar', 0, -160)
	setObjectCamera('bartop', 'hud')
	setObjectCamera('barbot', 'hud')
	
	addLuaSprite('bgback', false)
	addLuaSprite('fore', false)
	addLuaSprite('back_bf', false)
	addLuaSprite('back_pico', false)
	addLuaSprite('back_gf', false)
	addLuaSprite('bartop', false)
	addLuaSprite('barbot', false)
end

function onEvent(name, value1, value2)
	
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('back_pico', 'idle')
		objectPlayAnimation('back_gf', 'idle')
		objectPlayAnimation('back_bf', 'idle')
	end
end


function onUpdate(elapsed)
	--Follow Cam Stuff LMAO
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
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
	else
        triggerEvent('Camera Follow Pos','','')
	end
end