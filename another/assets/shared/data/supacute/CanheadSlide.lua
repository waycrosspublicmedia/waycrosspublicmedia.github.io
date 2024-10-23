local slided = false
function onStartCountdown()
    if not slided then
        slided = true
        playAnim('dad', 'slide')
        runTimer('start', 2.4)
        playSound('supacuteStart')
        return Function_Stop
    end
	return Function_Continue
end

function onTimerCompleted(t,l,ll)
    if t == 'start' then
        setProperty("skipCountdown", true)
        playAnim('dad', 'idle')
        startCountdown()
    end
end