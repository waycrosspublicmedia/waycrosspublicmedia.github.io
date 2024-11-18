function onCreate()
xx = 830;
yy = 290;
xx2 = 830;
yy2 = 350;
xx3 = defaultGirlfriendX + 400;
yy3 = defaultGirlfriendY + 100;
ofs = 60;
ofs2 = 120;
followchars = false;
del = 0;
del2 = 0;
customcamera = false;

end

function onBeatHit()
    if curBeat == 1 then
        followchars = true;
        --customcamera = true;
    end

    if curBeat == 52 then
        --followchars = true;
        --customcamera = true;
        doTweenZoom('lightzoom', 'camGame', 1.2, 1.8, 'quadOut');
    end

    if curBeat == 132 then
        --followchars = true;
        --customcamera = true;
        doTweenZoom('lightzoom', 'camGame', 1.3, 1.9, 'quadOut');
    end

    if curBeat == 152 then
        --followchars = true;
        --customcamera = true;
        doTweenZoom('lightzoom', 'camGame', 1.4, 2, 'quadOut');
    end

    if curBeat == 170 then
        --followchars = true;
        --customcamera = true;
        doTweenZoom('lightzoom', 'camGame', 1.3, 1, 'quadOut');
    end
    
end

function onUpdate()
    
    -- PINKIE ALTS
    --if curBeat >= 248 and curBeat <= 311 then
        
    --end

    if mustHitSection == true then
        --FOCUSED ON BF
        setProperty('defaultCamZoom', 0.9);
    else

        --FOCUSED ON SPINEL
        if customcamera == false then
        setProperty('defaultCamZoom', 0.95);
        end
    end



    --CAMERA FOLLOW Updates    
    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then

            --DAD
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
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
                setProperty('defaultCamZoom', 0.8);
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
                setProperty('defaultCamZoom', 0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
                setProperty('defaultCamZoom', 0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
                setProperty('defaultCamZoom', 0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
                setProperty('defaultCamZoom', 0.8)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            --BOYFRIEND
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
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end

            --GIRLFRIEND
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end

        end
    else
        if customcamera == false then
        triggerEvent('Camera Follow Pos','','')
        end
    end

    
end