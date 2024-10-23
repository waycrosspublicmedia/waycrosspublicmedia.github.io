
local allowCountdown = false
local incutscene = false

function onStartCountdown()

	if not allowCountdown and not isStoryMode then

		incutscene = true
		allowCountdown = true
		setProperty('inCutscene', true);
		setProperty('camGame.zoom', 1.0);
		runTimer('cutsceneTime', 7.0)

		doTweenX('move1','camGame.scroll',40, 1,'quadInOut')
        doTweenY('move2','camGame.scroll',-200, 2.1,'quadInOut')
		doTweenZoom('screenZoom', 'camGame', 1.3, 2, 'quadInOut');

		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('camHUD.visible',true)
	return Function_Continue;

end

function onTimerCompleted(t,l,ll)
	if t == 'cutsceneTime' then
		startCountdown();
		doTweenZoom('screenZoom2', 'camGame', 0.9, 10.5, 'quadInOut');
		triggerEvent('Camera Follow Pos',680,650)
		doTweenY('move4','camGame.scroll',190, 7.38,'quadInOut')
	end
end

function onTweenCompleted(t)
    if t == 'move2' then
        doTweenY('move3','camGame.scroll',290, 4,'quadInOut')
    end

	if t == 'move4' then
		triggerEvent('Camera Follow Pos','','')
    end
	
end

function onUpdate()

end

function onUpdatePost()

	if incutscene then

	end
end

function onCreate()


end

function onCreatePost()
	
end

