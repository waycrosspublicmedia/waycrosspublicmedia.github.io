                
				
xx = 300; 
yy = -70; 
xx2 = 930; 
yy2 = 640; 
xx3 = 550; 
yy3 = 300; 
ofs = 15; 
followchars = true; 
del = 0;
del2 = 0;

function onEvent(tag)
    if tag == "followchars on" then
        followchars = true
    elseif tag == "followchars off" then
        followchars = false
    end
end

function onCreate()
    nullZoom = 0.7

    boyfriendAnim = getProperty('boyfriend.animation.curAnim.name')
    KOAnim = getProperty('KO.animation.curAnim.name')
    enidAnim = getProperty('enid-stand.animation.curAnim.name')
    radAnim = getProperty('radup.animation.curAnim.name')
end



function onSectionHit()
    if mustHitSection == true then
        nullZoom = 0.8
    elseif mustHitSection == false and gfSection == true then
        if curStep >= 1417 then
            nullZoom = 0.8
        else
            nullZoom = 0.9
        end
    elseif mustHitSection == false then
        nullZoom = 0.7
    end
end




function onStepHit()

end

function onTimerCompleted(n)

end

function onUpdate() 
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end



    if curStep >= 966 and curStep <= 991 then
        setProperty('defaultCamZoom', 1)
    else
        setProperty('defaultCamZoom', nullZoom)
    end

yy = 270 + getProperty('dad.y')


    if curStep >= 1279 then
        xx2 = 1100
        yy2 = 520
    end

    if curStep == 1417 then
        xx3 = 400
        yy3 = 500
    end

    if curStep >= 2112 then
        setProperty('cameraSpeed', 3)

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
        end

        if gfSection == true then 
                if getProperty('Darell.animation.curAnim.name') == 'singLEFT' then 
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)              
                end
                if getProperty('Darell.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('Darell.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('Darell.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('Darell.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
				end
            end




    else
        --triggerEvent('Camera Follow Pos','','') 
    end
    
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if mustHitSection then
    if noteData == 0 then
        triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
    end
    if noteData == 1 then
        triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
    end
    if noteData == 2 then
        triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
    end
    if noteData == 3 then
        triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
    end
    end
end