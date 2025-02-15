function onCreate()


    setProperty('boyfriend.x', 900)
    setProperty('boyfriend.y', 260)
    setProperty('gf.x', getProperty('gf.x')+100)




    makeLuaSprite('letterbox', 'letterbox', 0,0)
    addLuaSprite('letterbox', true)
    setProperty('letterbox.alpha', 0)
    setObjectCamera('letterbox', 'hud')
    setObjectOrder('letterbox', 4)

    makeLuaSprite('vignette', 'vignette', 0,0)
    addLuaSprite('vignette', true)
    setProperty('vignette.alpha', 0)
    setObjectCamera('vignette', 'hud')
    setObjectOrder('vignette', 3)


      
      
end

function onCreatePost()
    
end
    
function onCountdownStarted()
    noteTweenX('oppStrumsOut1', 0, -412, 1, 'backIn')
    noteTweenX('oppStrumsOut2', 1, -524, 1.05, 'backIn')
    noteTweenX('oppStrumsOut3', 2, -636, 1.1, 'backIn')
    noteTweenX('oppStrumsOut4', 3, -748, 1.15, 'backIn')



    setObjectOrder('strumLineNotes', 1)
    setObjectOrder('notes', 2)
    setProperty('bodegaBGfake.alpha', 1)

    for i = 0,3 do
    setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
    if downscroll then
    noteTweenDirection('oppDirection' ..i, i, 270, 0.01, 'linear')
    end
    end

end



function onBeatHit()
    if curBeat % 2 == 0 then
        for i = 0,3 do
            setPropertyFromGroup('opponentStrums', i, 'y', -10)
            noteTweenY('oppNotesUp' .. i, i, -20, 0.122, 'sineOut')
        end
        
    end

    
end

function onUpdatePost(elapsed)
	noteCount = getProperty('notes.length')
	for i = 0, noteCount-1 do
		noteData = getPropertyFromGroup('notes', i, 'noteData')
        if getPropertyFromGroup('notes', i, 'isSustainNote') and not getPropertyFromGroup('notes', i, 'mustPress') then
            setPropertyFromGroup('notes', i, 'alpha', 0)
        end
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
            if (getPropertyFromGroup('notes', i, 'mustPress')) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'direction') - 90)
            else
				
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'direction') - 90)
            end	
		else
            if (noteData >= 4) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'angle'))
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'angle'))
            end	
		end
	end
end




function onTweenCompleted(n)
    if n == 'oppStrumsOut4' then
        runHaxeCode([[
            for (strum in game.opponentStrums)
            {
                strum.camera = game.camGame;
                strum.scrollFactor.set(1, 1);
            }
    
            for (note in game.unspawnNotes)
            {
                if (!note.mustPress) {
                    note.camera = game.camGame;
                    note.scrollFactor.set(1, 1);
                }
            }
        ]])
        noteTweenX('oppStrumsOut1', 0, 412, 1, 'backOut')
        noteTweenX('oppStrumsOut2', 1, 524, 1.05, 'backOut')
        noteTweenX('oppStrumsOut3', 2, 636, 1.1, 'backOut')
        noteTweenX('oppStrumsOut4', 3, 748, 1.15, 'backOut')
        
    end



end


