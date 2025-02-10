function onGameOverStart()
    setPropertyFromClass('GameOverSubstate', 'give up touls', 'f');
    
	makeLuaText('CountDown', 'continue ? 10', 650, 300, 30)
	setTextAlignment('CountDown', 'center')
	setObjectCamera('CountDown', 'other')
	setTextSize('CountDown', 40)
	addLuaText('CountDown')

    runTimer('CountDown', 1, 10)
end

function onTimerCompleted(d, loops, loopsleft)
    if d == 'CountDown' then
        if loopsleft == 9 then
            setTextString('CountDown', 'Continue ? 9')
        elseif loopsleft == 8 then
            setTextString('CountDown', 'Continue ? 8')
        elseif loopsleft == 7 then
            setTextString('CountDown', 'Continue ? 7')
        elseif loopsleft == 6 then
            setTextString('CountDown', 'Continue ? 6')
        elseif loopsleft == 5 then
            setTextString('CountDown', 'Continue ? 5')
        elseif loopsleft == 4 then
            setTextString('CountDown', 'Continue ? 4')
        elseif loopsleft == 3 then
            setTextString('CountDown', 'Continue ? 3')
            setTextColor('CountDown', '0xFFEB4034')
        elseif loopsleft == 2 then
            setTextString('CountDown', 'Continue ? 2')
        elseif loopsleft == 1 then
            setTextString('CountDown', 'Continue ? 1')
        elseif loopsleft == 0 then
            setTextString('CountDown', 'Continue ? 0')
            loadSong('amnesia', difficulty)
        end
    end
end

