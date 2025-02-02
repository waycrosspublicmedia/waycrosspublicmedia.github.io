leftTilt = true;
tilting = false;
loopF = 0;

function onBeatHit()
    --CAMERA STUFF

    if not lowQuality then
        -- tilt and zoom start 1
        if curBeat == 1 then
        doTweenAngle('screenTilt', 'camGame', 5, 8, 'quadInOut');
        doTweenZoom('screenZoom', 'camGame', 0.8, 8, 'quadInOut');
        end
        -- tilt and zoom end 1
        if curBeat == 16 then
            doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 0.7, 1, 'quadInOut');
        end

        
        -- tilt and zoom start 2
        if curBeat == 17 then
            doTweenAngle('screenTilt', 'camGame', -5, 8, 'quadInOut');
            doTweenZoom('screenZoom', 'camGame', 0.8, 8, 'quadInOut');
        end
        -- tilt and zoom end 2
        if curBeat == 32 then
            doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 0.7, 1, 'quadInOut');
        end

        -- Clock Is Ticking Zoom
        if curBeat == 33 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1, 4, 'quadIn');
        end

        -- Hit beat
        if curBeat == 100 or curBeat == 228 or curBeat == 452 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 0.9, 0.5, 'quintOut');
        end
        if curBeat == 102 or curBeat == 230 or curBeat == 454 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1.1, 0.4, 'quintOut');
        end
        if curBeat == 104 or curBeat == 232 or curBeat == 456 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1.3, 1, 'quintOut');
        end

        --HI GIRLS!!
        if curBeat == 168 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1.1, 1.2, 'bounceOut');
        end

        -- Dark and Lonley
        if curBeat == 312 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1, 10, 'linear');
        end
    end
        --Turn on Laser death sound
        if curBeat == 248 then
            setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'MagicalDeath');
        end
        -- Turn off laser death sound
        if curBeat == 312 then
            setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'PibbyDeath');
        end

    if not lowQuality then
        -- Good Time
        if curBeat == 376 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1.2, 5, 'linear');
        end


        -- F R I E N D (spin) mah scratch that it looks crazier with just the shake
        if curBeat == 394 then
            doTweenAlpha('filterOn', 'glitch', 1, 1, 'backOut');
            --doTweenZoom('screenZoom', 'camGame', 1.2, 5, 'linear');
        end

        if curBeat == 394 then
            doTweenAlpha('turnOn', 'glitch', 1, 1, 'linear');
            --doTweenZoom('screenZoom', 'camGame', 1.2, 5, 'linear');
        end

        -- AAAAAAAA
        if curBeat == 460 then
            --doTweenAngle('screenTilt', 'camGame', 0, 1.5, 'backOut');
            doTweenZoom('screenZoom', 'camGame', 1, 2.6, 'quintOut');
        end
    end

    if not lowQuality then
    -- TILT A WORL
        if (curBeat >= 172 and curBeat <= 236) or (curBeat >= 395 and curBeat <= 460) then

            -- add to loop timer
            loopF = loopF + 1;

                -- tilt to the right and stay tilting till tilting false again
            
            if leftTilt == true then
                if tilting == false then
                doTweenAngle('screenTilt', 'camGame', 5, 2.5, 'quadInOut');
                
                tilting = true;  
                end
                    if loopF >= 8 then
                        leftTilt = false;
                        loopF = 0;
                        tilting = false;
                    end
                
            end    
            
            -- tilt to the right and stay tilting till tilting false again
        
            if leftTilt == false then
                if tilting == false then
                doTweenAngle('screenTilt', 'camGame', -5, 2.5, 'quadInOut');
                tilting = true;  
                end
                    if loopF >= 8 then
                        leftTilt = true;
                        loopF = 0;
                        tilting = false;
                    end
                
            end


                    
        end

    -- END TILT A WORL
        if curBeat == 236 or curBeat == 460 then
            doTweenAngle('screenTilt', 'camGame', 0, 1, 'quadInOut');
        end
    end
    -- SCREAM DARKEN WORLD

    if not lowQuality then
        if curBeat == 395 then
            doTweenColor('wallColor', 'wall', 'FF0000', 1, 'quadIn');
            doTweenColor('floorColor', 'midground', 'FF0000', 1, 'quadIn');
            doTweenColor('inkfellColor', 'inkfall', 'FF0000', 1, 'quadIn');
            doTweenColor('pillarColor', 'pillar', 'FF0000', 1, 'quadIn');
            doTweenColor('turnRed', 'glitch', 'FF0000', 1, 'quadIn');
        end

        -- Brighten things back up
        if curBeat == 428 then
            --doTweenAlpha('turnOffalpha', 'glitch', 0, 5, 'quadIn');
            doTweenAlpha('turnOffalpha', 'glitch', 0, 7, 'quadIn');
            doTweenColor('wallColor', 'wall', 'FFFFFF', 7, 'quadIn');
            doTweenColor('floorColor', 'midground', 'FFFFFF', 7, 'quadIn');
            doTweenColor('inkfellColor', 'inkfall', 'FFFFFF', 7, 'quadIn');
            doTweenColor('pillarColor', 'pillar', 'FFFFFF', 7, 'quadIn');
            doTweenColor('turnNormal', 'glitch', 'FFFFFF', 7, 'quadIn');
            
            
        end
    end
end