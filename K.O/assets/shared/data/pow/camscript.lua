                
				
xx = 640; 
yy = 595; 
xx2 = 640; 
yy2 = 595; 
xx3 = 520; 
yy3 = 450; 
ofs = 15; 
followchars = true; 
del = 0;
del2 = 0;

function onCreate()
    makeLuaSprite('vignette', 'vignette', 0,0)
    addLuaSprite('vignette', true)
    setProperty('vignette.alpha', 0)
    setObjectCamera('vignette', 'other')
    setObjectOrder('vignette', 3)
    scaleObject('vignette', 1.1, 1.1)

    makeAnimatedLuaSprite('horizontalLines', 'horizontalLines', 0,0)
    addLuaSprite('horizontalLines', true)
    addAnimationByPrefix('horizontalLines', 'anim', 'anim', 20, true)
    setProperty('horizontalLines.alpha', 0)
    setObjectCamera('horizontalLines', 'other')
    setObjectOrder('horizontalLines', getObjectOrder('vignette')+1)
end

function onEvent(tag)
    if tag == "followchars on" then
        followchars = true
    elseif tag == "followchars off" then
        followchars = false
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if cameraShift == true then
    mustHitSection = true
    yy = 630
    yy2 = 630


    end



end



function onSectionHit()

end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if cameraShift == true then
    mustHitSection = false
    end



end

function onTweenCompleted(n)
    if n == 'speedLinesIn' then
        cancelTween('speedLineIn')
        cancelTween('speedLineOut')
        cancelTween('vignetteIn')
        cancelTween('vignetteOut')
        doTweenAlpha('speedLinesOut','horizontalLines', 0, 0.3, 'linear')
        doTweenColor('vignetteout', 'vignette', '0x00ffffff', 0.3, 'linear')
    end
end


previousCam = false
local kelVariable = false
local hudMove = -30

function onStepHit()
    if (curStep >= 832 and curStep <= 853) or (curStep >= 1088 and curStep <= 1094) then

        kelVariable = mustHitSection
        if previousCam == kelVariable then
        else

            if not mustHitSection then
                hudMove = 30
            else
                hudMove = -30
            end


            cancelTween('speedLineIn')
            cancelTween('speedLineOut')
            cancelTween('vignetteIn')   
            cancelTween('vignetteOut')
            cancelTween('hudMove')
            doTweenAlpha('speedLinesIn','horizontalLines', 0.9, 0.001, 'linear')
            doTweenColor('vignetteIn', 'vignette', '0x77000000', 0.001, 'linear')
            doTweenX('hudMove', 'camHUD', hudMove, 0.6, 'elasticOut')
            previousCam = kelVariable



            
        end
    end

    if curStep == 882 then
        mustHitSection = true

    end


    cameraShake('game', 0.003, getProperty('horizontalLines.alpha')/4)
    cameraShake('hud', 0.0015, getProperty('horizontalLines.alpha')/4)






    if curStep == 48 then
        xx = 380
        xx2 = 860
    end

    if curStep == 832 then
        setProperty('defaultCamZoom', 1)
    end

    if (curStep >= 832 and curStep <= 854) or (curStep >= 1088 and curStep <= 1094) then
        cameraShift = true
        setProperty('cameraSpeed', 7)
    elseif curStep >= 1098 then
        setProperty('defaultCamZoom', 0.85)
            xx = 640

            xx2 = 640

            cameraShift = false
    else
        cameraShift = false
        

    end

    if curStep == 856 or curStep == 1095 then
        setProperty('cameraSpeed', 3)
    end

    if curStep == 1094 then
        mustHitSection = true
        doTweenAlpha('speedLinesIn','horizontalLines', 0.9, 0.001, 'linear')
        doTweenColor('vignetteIn', 'vignette', '0x77000000', 0.001, 'linear')
        doTweenX('hudMove', 'camHUD', hudMove, 0.6, 'elasticOut')
    end
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
        
    end
    
end