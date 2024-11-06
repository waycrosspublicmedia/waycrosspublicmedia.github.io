function onCreate()
	addHaxeLibrary('Character');
	runHaxeCode([[
		game = PlayState.instance;
		pump = new Character(game.dad.x + 230, game.dad.y - 80, 'pump');
		game.insert(game.members.indexOf(game.dadGroup) - 1, pump);
	]]);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	note = 'notes.members['..id..']';
	if noteType == 'Alt Character' or noteType == 'Both Characters' then
		anim = getProperty('singAnimations['..direction..']');
		runHaxeCode([[
			pump.holdTimer = 0;
			pump.playAnim(']]..anim..[[', true);
		]]);
	end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
		pumpDance();
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		if not getProperty('inCutscene') then
			runHaxeCode([[
				singing = StringTools.startsWith(pump.animation.curAnim.name, 'sing');
				if((singing && pump.holdTimer > Conductor.stepCrochet * 0.0011 * pump.singDuration) || !singing)
				{
					pump.dance();
				}
			]]);
		end
	end
end

function pumpDance()
	if not getProperty('inCutscene') then
		runHaxeCode([[
			pump.dance();
		]]);
	end
end