
bubbleExists = false;
function onCreate()
	makeAnimatedLuaSprite('bubbleStuff', 'bubble-trans')
	setObjectCamera('bubbleStuff', 'camHUD')
	setGraphicSize('bubbleStuff', screenWidth, screenHeight)
	addAnimationByPrefix('bubbleStuff', 'bubblePlay', 'bubbletrans', 24, false)
	addLuaSprite('bubbleStuff', true)
	setProperty('bubbleStuff.visible', false)
	
	bubbleExists = true;
end

function onStepHit() if curStep == 8 or curStep == 647 then daBubble((curStep == 647)) end end

function daBubble(erm)
	if bubbleExists then
		setProperty('bubbleStuff.visible', true)
		bubbletransitionPlaying = true;
		if erm then runTimer('bubbleIsDoneEnd', 1.4) else runTimer('bubbleIsDone', 1.4) end
		playAnim('bubbleStuff', 'bubblePlay', false)
	end
end

function onTimerCompleted(t)
	if t == 'bubbleIsDone' or t == 'bubbleIsDoneEnd' then setProperty('bubbleStuff.visible', false) if t == 'bubbleIsDoneEnd' then removeLuaSprite('bubbleStuff') bubbleExists = false; end end
end