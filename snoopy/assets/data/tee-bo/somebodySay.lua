
function onCreate()	
	makeLuaSprite('foxy','easter eggs/foxy jumpscare',350, 100)
	addLuaSprite('foxy',true)
    setObjectCamera('foxy','hud')
	setProperty('foxy.alpha', 0.0001)

    makeLuaSprite('blackBG','',-900,-900)
	makeGraphic('blackBG',4000,4000,'000000')
	addLuaSprite('blackBG',true)
	setObjectCamera('blackBG','hud')
    setProperty('blackBG.alpha', 0.0001)

	makeLuaSprite('mazeJumpscare','easter eggs/jumpscare',0, 0)
	addLuaSprite('mazeJumpscare',true)
    setObjectCamera('mazeJumpscare','hud')
	setProperty('mazeJumpscare.alpha', 0.0001)

	addHaxeLibrary('FlxSound', 'flixel')
	addHaxeLibrary('FlxG')
end

function onPause()


end

function onUpdate()
	if keyboardJustPressed('SPACE') then
		runTimer('boomCutscene', 4.84)
		runTimer('beforeJumpscare', 1.35)
		runTimer('beforeBlackFade', 1.84)
		runTimer('beforeMazeJumpscare', 4.03)
		
		runHaxeCode([[
			game.KillNotes();
			game.vocals.pause();
			game.vocals.volume = 0;
			FlxG.sound.music.volume = 0;
			
		]])

		playSound('somebody_boom', 1)
	end
end

function onTimerCompleted(t,l,ll)

	if t == 'boomCutscene' then
		setProperty('blackBG.alpha', 0.0001)
		setProperty('foxy.alpha', 0.0001)
		setProperty('mazeJumpscare.alpha', 0.0001)
	end

	if t == 'beforeBlackFade' then
		doTweenAlpha('blackFadeIn', 'blackBG', 1.0, 2, 'linear')

		
	end

	if t == 'beforeJumpscare' then
		setProperty('foxy.alpha', 1)
	end

	if t == 'beforeMazeJumpscare' then
		setProperty('mazeJumpscare.alpha', 1)
	end

end