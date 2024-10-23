--too lazy to make this part of the event
function onBeatHit()
    if curBeat == 239 then
        for i = 0, 3 do
            noteTweenAlpha('brah'..i, i, 0, 0.5, 'quadout')
        end
        for i = 4, 7 do
            noteTweenX('bfnots'..i, i, getPropertyFromGroup('strumLineNotes', i, 'x')-300, 0.5, 'quadout')
        end
    end
    if curBeat == 302 then
        for i = 0, 3 do
            noteTweenAlpha('brah'..i, i, 1, 0.5, 'linear')
        end
        for i = 4, 7 do
            noteTweenX('bfnots'..i, i, getPropertyFromGroup('strumLineNotes', i, 'x')+300, 0.5, 'quadout')
        end
    end
end