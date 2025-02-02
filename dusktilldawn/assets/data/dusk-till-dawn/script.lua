function onBeatHit()
 --GAME EVENTS

    -- Pibby Idle
    if curBeat % 2 == 0 then
		objectPlayAnimation('pibby', 'idle');
	end
        

    -- Remove Pibby and Bring forward Pinkie & Pibby
    if curBeat == 108 then
    setObjectOrder('gfGroup', 7);
    
    setObjectOrder('pibby', 0);
    end
    
    if not lowQuality then
        -- Spotlight over Pinkie and BF
        if curBeat == 312 then
            -- move spotlight
            doTweenX('spotlightx', 'spotlight1', -2810, 0.0001, 'linear');
            doTweenY('spotlighty', 'spotlight1', -2020, 0.0001, 'linear');
        
            -- Flip spotlight
            scaleObject('spotlight1', 0.9, 1);
            
            doTweenAlpha('spotlightAlphaTween', 'spotlight1', 0.7, 1, 'linear');
        end

        --Remove Bf and Pinkie Spotlight
        if curBeat == 344 then
            doTweenAlpha('spotlightAlphaTween', 'spotlight1', 0, 1, 'linear');
        end

        -- End Laser Animation
        if curBeat == 248 then
            -- hide animation
            --setObjectOrder('twilightSpeaks', 0);
            --show gameplay sprite
            --setObjectOrder('dadGroup', 15);

            end

end
        -- Make Screen cut to Black
        if curBeat == 468 then
            if not lowQuality then
            doTweenAlpha('spotlightAlphaTween', 'spotlight1', 1, 0.01, 'linear');
            doTweenX('spotlightx', 'spotlight1', -1000, 0.0001, 'linear');
            cameraFade('game', '000000', 0.005, true);
            doTweenAlpha('turnOff', 'glitch', 0, 0.2, 'linear');
            else
            cameraFade('game', '000000', 0.005, true);
            end
        end
    --end


    
end





function onStepHit()
	
    -- Twilight Spotlight Start
    if curStep == 130 then
        if not lowQuality then
        doTweenAlpha('spotlightAlphaTween', 'spotlight1', 1, 0.00001, 'linear');
        end
        doTweenColor('twiBlack', "dad", 'FFFFFF', 0.01, 'linear');
    end

if not lowQuality then
        -- Twilight Spotlight End
        if curStep == 170 then
            doTweenAlpha('spotlightAlphaTween', 'spotlight1', 0, 1, 'linear');
        end

        -- Friendship Problem ZOOM
        if curStep == 971 then

            doTweenZoom('screenZoom', 'camGame', 1, 1.8, 'quintOut');
        end

    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	--Damage increase when miss
	if getProperty('dad.animation.curAnim.name') == 'shoot' then
		if difficulty == 2 then
            setProperty('health',getProperty('health')-0.08);
        elseif difficulty == 1 then
            setProperty('health',getProperty('health')-0.05);
        elseif difficulty == 0 then
            setProperty('health',getProperty('health')-0.03);
        end
        --doTweenColor('healthTween', 'boyfriend', '800080', 0.2, 'quintInOut');
        --noteTweenY('fallTween' .. direction, direction + 4, getProperty('note' .. '.y')+ 10, 0.5, 'bounceOut');
    --end
	end

    -- Miss Effects
        if direction == 0 then
            if getProperty('dad.animation.curAnim.name') == 'shoot' then    
                doTweenColor('missTween', 'boyfriend', '800080', 0.2, 'quintInOut'); -- Turns BF Purple
                noteTweenAngle('glitch0', direction + 4, 270, 0.3, 'bounceOut');-- Makes notes glitch
            else
                doTweenColor('missTween', 'boyfriend', '000000', 0.1, 'quintInOut'); -- Turns BF Black
                noteTweenAngle('broke0', direction + 4, -30, 0.3, 'bounceOut');-- Makes notes falter
            end
                playSound('missleft', 1);-- Plays miss sound
            
                
        elseif direction == 1 then
            if getProperty('dad.animation.curAnim.name') == 'shoot' then    -- if twilight is shooting
                
                doTweenColor('missTween', 'boyfriend', '800080', 0.2, 'quintInOut'); -- Turns BF Purple
                noteTweenAngle('glitch1', direction + 4, 270, 0.3, 'bounceOut');-- Makes notes glitch

            else                                                            -- if a regular miss

                doTweenColor('missTween', 'boyfriend', '000000', 0.1, 'quintInOut'); -- Turns BF Black
                noteTweenAngle('broke1', direction + 4, -30, 0.3, 'bounceOut');-- Makes notes falter
            end
            playSound('missdown', 1);
            
        elseif direction == 2 then
            if getProperty('dad.animation.curAnim.name') == 'shoot' then    
                doTweenColor('missTween', 'boyfriend', '800080', 0.2, 'quintInOut'); -- Turns BF Purple
                noteTweenAngle('glitch2', direction + 4, 270, 0.3, 'bounceOut');-- Makes notes glitch
            else
                doTweenColor('missTween', 'boyfriend', '000000', 0.1, 'quintInOut'); -- Turns BF Black
                noteTweenAngle('broke2', direction + 4, -30, 0.3, 'bounceOut');-- Makes notes falter
            end
            playSound('missup', 1);
            
        elseif direction == 3 then
            if getProperty('dad.animation.curAnim.name') == 'shoot' then    
                doTweenColor('missTween', 'boyfriend', '800080', 0.2, 'quintInOut'); -- Turns BF Purple
                noteTweenAngle('glitch3', direction + 4, 270, 0.3, 'bounceOut');-- Makes notes glitch
            else
                doTweenColor('missTween', 'boyfriend', '000000', 0.1, 'quintInOut'); -- Turns BF Black
                noteTweenAngle('broke3', direction + 4, -30, 0.3, 'bounceOut');-- Makes notes falter
            end
            playSound('missright', 1);
            
        end
end

function onTweenCompleted(tag) 
    if tag == 'missTween' then
        doTweenColor('normalbf', 'boyfriend', 'FFFFFF', 1, 'quintOut');
    end

    if (tag == 'broke0') or (tag == 'glitch0') then
        noteTweenAngle('fix0', 4, 0, 1, 'quadInOut');
    end
    if (tag == 'broke1') or (tag == 'glitch1')then
        noteTweenAngle('fix1', 5, 0, 1, 'quadInOut');
    end
    if (tag == 'broke2') or (tag == 'glitch2') then
        noteTweenAngle('fix2', 6, 0, 1, 'quadInOut');
    end
    if (tag == 'broke3') or (tag == 'glitch3') then
        noteTweenAngle('fix3', 7, 0, 1, 'quadInOut');
    end

    


end



