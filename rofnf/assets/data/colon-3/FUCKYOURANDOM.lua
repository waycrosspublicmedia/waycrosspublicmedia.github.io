
function onCreatePost()
	duration = getPropertyFromClass('Conductor', 'stepCrochet') * 2 / 1100
end

function onSongStart()

    setProperty('healthBarBG.visible', false)
    setProperty('healthBar.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)

    setProperty("timeBar.y",getProperty("scoreTxt.y") + -65);
    setProperty("timeTxt.y",getProperty("scoreTxt.y") + -70);
    setProperty("scoreTxt.y",getProperty("scoreTxt.y") + -35);

    setProperty("timeBar.x",getProperty("scoreTxt.x") + 500);
    setProperty("timeTxt.x",getProperty("scoreTxt.x") + 500);
    setProperty("scoreTxt.x",getProperty("scoreTxt.x") + 60);

    setTextFont("scoreTxt","comic.ttf");
	setProperty("scoreTxt.size",24);
	setProperty("scoreTxt.borderSize",1.5);

	setTextFont("timeTxt","comic.ttf");
	setProperty("timeTxt.size",32);
	setProperty('timeTxt.antialiasing', false)

    
    function onBeatHit() 
        doTweenY('wahoo', 'timeTxt', getProperty('timeTxt.y') - 20, duration, 'cubeOut')
        
        if curBeat % 2 == 0 then
            setProperty("timeTxt.angle", 5);
        else
            setProperty("timeTxt.angle", -5);
        end
    end
    
    function onTweenCompleted(tag)
        if tag == 'wahoo' then
            doTweenY('wahooback', 'timeTxt', getProperty('timeTxt.y') + 20, duration, 'cubeIn')
        end
    end

    noteTweenX('NoteMove1', 1, 290, 0.01, 'linear')
    noteTweenX('NoteMove2', 0, 180, 0.01, 'linear')
    noteTweenX('NoteMove3', 2, 400, 0.01, 'linear')
    noteTweenX('NoteMove4', 3, 510, 0.01, 'linear')

    noteTweenX('NoteMove5', 4, 800, 0.01, 'linear')
    noteTweenX('NoteMove6', 5, 910, 0.01, 'linear')
    noteTweenX('NoteMove7', 6, 1020, 0.01, 'linear')
    noteTweenX('NoteMove8', 7, 1130, 0.01, 'linear')

    
    noteTweenY('NoteMove9', 1, 80, 0.01, 'linear')
    noteTweenY('NoteMove10', 0, 80, 0.01, 'linear')
    noteTweenY('NoteMove11', 2, 80, 0.01, 'linear')
    noteTweenY('NoteMove12', 3, 80, 0.01, 'linear')

    noteTweenY('NoteMove13', 4, 80, 0.01, 'linear')
    noteTweenY('NoteMove14', 5, 80, 0.01, 'linear')
    noteTweenY('NoteMove15', 6, 80, 0.01, 'linear')
    noteTweenY('NoteMove16', 7, 80, 0.01, 'linear')


end