local xx = 430;
local yy = 200;
local xx2 = 820;
local yy2 = 350;
local ofs = 30;
local ofs2 = 15;
local angleshit = 0.5;
local anglevar = 0.5;
local followchars = true;
function onCreate()
	-- background shit
	makeLuaSprite('sky', 'beachhouse/sky', -600, -400);
	setLuaSpriteScrollFactor('forest', 1, 1);
	scaleObject('sky', 3, 3);

	makeLuaSprite('forest', 'beachhouse/forest', -300, -390);
	setLuaSpriteScrollFactor('forest', .7, .7);
	scaleObject('forest', 0.6, 0.6);

    makeAnimatedLuaSprite('glitch1', 'beachhouse/glitch1', -240, -280);
    addAnimationByPrefix('glitch1', 'Symbol 1', 'Symbol 1', 24);
    setLuaSpriteScrollFactor('glitch1', 1, 1);
    scaleObject('glitch1', 1, 1);

	makeLuaSprite('sandfloor', 'beachhouse/sandfloor', -600, -475);
	setLuaSpriteScrollFactor('sandfloor', 1, 1);
	scaleObject('sandfloor', .6, .6);

	makeLuaSprite('tree', 'beachhouse/tree', -600, -370);
	setLuaSpriteScrollFactor('tree', .9, .9);
	scaleObject('tree', .7, .7);

	makeLuaSprite('water', 'beachhouse/water', -700, 520);
	setLuaSpriteScrollFactor('water', 1, 1);
	scaleObject('water', .7, .6);
	
	
	makeAnimatedLuaSprite('glitch', 'static', -600, -300);
	scaleObject('glitch', 2, 2);
	addAnimationByPrefix('glitch', 'glitchout', 'static glitch', 24, true);
	objectPlayAnimation('glitch', 'glitchout');
	
	addLuaSprite('sky', false);
	addLuaSprite('forest', false);
    addLuaSprite('glitch1', false);
	addLuaSprite('sandfloor', false);
	addLuaSprite('tree', false);
	addLuaSprite('water', false);
	addLuaSprite('glitch', true); -- false = add behind characters, true = add over characters
end

function onStepHit()
    --cameraShake('hud', 0.003, 0.2);
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('pibby','bounce',true)
    end
end

function opponentNoteHit()	
    local luckyRoll = math.random(1, 50)
    local luckyRoll2 = math.random(1, 50)
    
    if mustHitSection == false then
        if (luckyRoll >= 45) then
            cameraShake('hud', 0.08, 0.05);
        end
    end
    if mustHitSection == false then
        if (luckyRoll2 >= 45) then
            cameraShake('game', 0.08, 0.05);
        end
    end
end

function onUpdate()
	currentBeat = (getSongPosition()/1000)*(bpm/120)
	doTweenY(waterTweenY, 'water', 530 -80 * math.sin((currentBeat * 0.10) * math.pi), 0.001)
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.8)
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
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
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
            setProperty('defaultCamZoom',1.1)
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
    else
        triggerEvent('Camera Follow Pos','','')
    end
end