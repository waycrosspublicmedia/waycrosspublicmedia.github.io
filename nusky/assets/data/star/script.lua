function onCreate()

triggerEvent('Intro','Sky','by saruky')


end
inCutscene = true
allowCountdown = false
canSkip = false
function onStartCountdown()


	if not isStoryMode and not allowCountdown then
		setProperty('camHUD.visible',false)
		playMusic('gapicity',0.8)
		characterPlayAnim('boyfriend','kitty')
		characterPlayAnim('dad','kitty')
		runTimer('skylookup',4)
		allowCountdown = true
		return Function_Stop;
	
	end
	setProperty('camHUD.visible',true)
	inCutscene = false
		return Function_Continue;



end

function onTimerCompleted(t,l,ll)

	if t == 'skylookup' then
		characterPlayAnim('boyfriend','notice')
	end

end
function onUpdatePost()

	
	if getProperty('dad.animation.finished') and not canSkip then
	canSkip = true
	characterPlayAnim('dad','dia')
	end


	if canSkip and inCutscene then
		if keyJustPressed('space') or  keyJustPressed('accept') then
			startCountdown()
		
		end
	end

end