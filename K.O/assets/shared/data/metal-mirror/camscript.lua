                
				
xx = 600;
yy = -300;
xx2 = 600;
yy2 = -300;
xx3 = 1300;
yy3 = 200;
ofs = 10;
followchars = false;
del = 0;
del2 = 0;

function onCreatePost()
    triggerEvent('Camera Follow Pos', 600, -300)
    
end

function onSongStart()
    doTweenY('cameraMoveY', 'camFollowPos', 490, 4, 'sineInOut')
    doTweenZoom('zoomies', 'camGame', 0.8, 4, 'sineInOut')
    setProperty('defaultCamZoom', 0.8)
    setProperty('cameraSpeed', 0)
end

function onEvent(tag)
    if tag == "followchars on" then
        followchars = true
    elseif tag == "followchars off" then
        followchars = false
    end
end

function onTweenCompleted(n)
    if n == 'cameraMoveY' then

    end
end

function onStepHit()
    if curStep == 128 then
        xx = 730
        yy = 490
        xx2 = 450
        yy2 = 490
        
        setProperty('cameraSpeed', 2)
        followchars = true
    end

    if curStep >= 904 and curStep <= 958 then

        xx = 1030
        yy = 400
        
        xx2 = 150
        yy2 = 400
    end

    if curStep == 959 then
        setProperty('defaultCamZoom', 0.9)
    end

    if curStep >= 959 and curStep <= 1269 then
        
        xx = 730
        yy = 400

        xx2 = 450
        yy2 = 400
    end

    if curStep >= 1343 and curStep <= 1598 then
        xx = 800
        yy = 400

        xx2 = 380
        yy2 = 400
    end

    if curStep >= 1599 and curStep <= 1870 then
        xx = 720
        yy = 440

        xx2 = 520
        yy2 = 440
    end

    if curStep >= 1871 and curStep <= 1983 then
        xx = 980
        yy = 430

        xx2 = 300
        yy2 = 430
    end

    if curStep >= 1984 and curStep <= 2063 then
        xx = 720
        yy = 440

        xx2 = 520
        yy2 = 440
    end

    if curStep >= 2064 then
        xx = 600
        yy = 400

        xx2 = 600
        yy2 = 400

    end
end

function onUpdatePost()



	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end


    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('Metal Sonic.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('Metal Sonic.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('Metal Sonic.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('Metal Sonic.animation.curAnim.name') == 'singDOWN' then
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
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        end

        if gfSection == true then
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
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
				end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            elseif mustHitSection == true then
                
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('Sonic.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('Sonic.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('Sonic.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('Sonic.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end