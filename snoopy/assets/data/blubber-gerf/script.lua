local xx = 500;
local yy = 540;
local xx2 = 800;
local yy2 = 550;
local ofs = 15;
local followchars = true;

function onCreate()
    --the cum image
    makeLuaSprite('gerfImage1', 'gerf slideshow/Gerf1', 100, 30)
    setObjectCamera('gerfImage1','hud')
    addLuaSprite('gerfImage1',true)
    scaleObject('gerfImage1', 3.8, 3.8);
    setProperty('gerfImage1.alpha', 0.0001);

    --the big body little head image
    makeLuaSprite('gerfImage2', 'gerf slideshow/Gerf2', 230, 10)
    setObjectCamera('gerfImage2','hud')
    addLuaSprite('gerfImage2',true)
    scaleObject('gerfImage2', 3.6, 3.6);
    setProperty('gerfImage2.alpha', 0.0001);

    --the garfield death image
    makeLuaSprite('gerfImage3', 'gerf slideshow/Gerf3', 120, 30)
    setObjectCamera('gerfImage3','hud')
    addLuaSprite('gerfImage3',true)
    scaleObject('gerfImage3', 2.6, 2.6);
    setProperty('gerfImage3.alpha', 0.0001);

    --Andrew Garfield
    makeLuaSprite('gerfImage4', 'gerf slideshow/Gerf4', 0, 0)
    setObjectCamera('gerfImage4','hud')
    addLuaSprite('gerfImage4',true)
    scaleObject('gerfImage4', 2.6, 2.6);
    setProperty('gerfImage4.alpha', 0.0001);

    --EVERYONE LAUGH AND BOO HIS ASS LMAO
    makeLuaSprite('gerfImage5', 'gerf slideshow/LAUGH', 0, 0)
    setObjectCamera('gerfImage5','hud')
    addLuaSprite('gerfImage5',true)
    scaleObject('gerfImage5', 1.8, 1.4);
    setProperty('gerfImage5.alpha', 0.0001);
    --Sonic the Hedghog rodent
    makeLuaSprite('gerfImage6', 'gerf slideshow/Sonic', 0, 0)
    setObjectCamera('gerfImage6','hud')
    addLuaSprite('gerfImage6',true)
    scaleObject('gerfImage6', 2.6, 2.6);
    setProperty('gerfImage6.alpha', 0.0001);
end

function onBeatHit()
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        characterPlayAnim('dad','idle', true)
    end

    if curBeat == 8 then
        doTweenX('bfScaleXIn','boyfriend.scale',10, 420,'linear')
        setProperty('gerfImage1.alpha', 0.8)
        doTweenAlpha('gerfImage1AlphaTween', 'gerfImage1', 0.0001, 1.6, 'linear');
    end

    if curBeat == 24 then
        setProperty('gerfImage2.alpha', 0.8)
        doTweenAlpha('gerfImage2AlphaTween', 'gerfImage2', 0.0001, 1.6, 'linear');
    end

    if curBeat == 48 then
        setProperty('gerfImage3.alpha', 0.8)
        doTweenAlpha('gerfImage3AlphaTween', 'gerfImage3', 0.0001, 1.6, 'linear');
    end

    if curBeat == 80 then
        setProperty('gerfImage4.alpha', 0.8)
        doTweenAlpha('gerfImage4AlphaTween', 'gerfImage4', 0.0001, 1.6, 'linear');
    end
-- laugh after the "BOO YOU STINK"
    if curBeat == 95 then
        setProperty('gerfImage5.alpha', 0.8)
        doTweenAlpha('gerfImage5AlphaTween', 'gerfImage5', 0.0001, 3, 'linear');
    end

    if curBeat == 112 then
        setProperty('gerfImage6.alpha', 0.8)
        doTweenAlpha('gerfImage6AlphaTween', 'gerfImage6', 0.0001, 1.6, 'linear');
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
    
    --cam following shit
    if followchars == true then
        if mustHitSection == false then

            --DAD
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
            --BOYFRIEND
            setProperty('defaultCamZoom',0.9)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'hey' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end

        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
