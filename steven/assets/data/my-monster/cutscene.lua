local allowCountdown = false
local cutsceneEnded = false

--OPENING CUTSCENE
function onStartCountdown()
    if not lowQuality then
        if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
            startVideo('MMClipFINAL');
            allowCountdown = true;
            return Function_Stop;
        end
        
    end
    return Function_Continue;
end

function onEndSong()
	-- song ended/starting transition (Will be delayed if you're unlocking an achievement)
    if not lowQuality then
        if isStoryMode and not cutsceneEnded then
            if difficulty == 2 then
                
                --if score > number then
                    --startVideo('DTD_Endscreen');
                    --cutsceneEnded = true;
                    --return Function_Stop --to stop the song from ending for playing a cutscene or something.
                --end
            end
        end
    end   
    
        return Function_Continue;
end