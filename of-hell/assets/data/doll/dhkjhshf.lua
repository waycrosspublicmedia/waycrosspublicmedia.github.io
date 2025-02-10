function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'cree'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
function onUpdate(elapsed)

	if curStep >= 0 then
  
	  songPos = getSongPosition()
  
	  local currentBeat = (songPos/1000)*(bpm/175)
  
	  doTweenY(dadTweenY, 'dad', 200-75*math.sin((currentBeat*0.25)*math.pi),0.001)
  
	end 
end