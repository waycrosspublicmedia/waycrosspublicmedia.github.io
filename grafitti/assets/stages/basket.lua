function onCreate()
	makeLuaSprite('bg', 'basket/city_shit', -1100, -750)
	addLuaSprite('bg', false)
	makeLuaSprite('court', 'basket/floor', -1100, -750)
	addLuaSprite('court', false)

   	makeAnimatedLuaSprite('cassette', 'cd', 500, 600)
	addAnimationByPrefix('cassette', 'idle', 'boombox', 24, false);
	addLuaSprite('cassette', false)
	
	if songPath ~= 'philly-nice' then --Pico & Nene
		makeAnimatedLuaSprite('fgNene', 'basket/nene', -600, 660)
		setScrollFactor('fgNene', 1.6, 1.2);
		addAnimationByPrefix('fgNene', 'bop', 'nene bop', 24, false);
		scaleObject('fgNene', 1.6, 1.6);
		addLuaSprite('fgNene', true);
		
		makeAnimatedLuaSprite('fgOther', 'basket/pico', 1500, 600)
		setScrollFactor('fgOther', 1.9, 1.2);
		addAnimationByPrefix('fgOther', 'bop', 'pico bop', 24, false);
		scaleObject('fgOther', 1.6, 1.6);
		addLuaSprite('fgOther', true);
	else --Darnell & Nene on bg
		makeAnimatedLuaSprite('fgNene', 'basket/nene', 1500, 640)
		setScrollFactor('fgNene', 1.9, 1.2);
		addAnimationByPrefix('fgNene', 'bop', 'nene bop', 24, false);
		scaleObject('fgNene', 1.6, 1.6);
		addLuaSprite('fgNene', true);
		setProperty('fgNene.flipX', true)
		
		makeAnimatedLuaSprite('fgOther', 'basket/darnell', -600, 600)
		setScrollFactor('fgOther', 1.7, 1.2);
		addAnimationByPrefix('fgOther', 'bop', 'darnell bop', 24, false);
		scaleObject('fgOther', 1.6, 1.6);
		addLuaSprite('fgOther', true);
		setProperty('fgOther.flipX', true)
	end

	setPropertyFromClass('GameOverSubstate', 'characterName', 'skarlet-darnell-dead');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'deathDarnell');
end

local defaultNotePos = {}
local spin = 2

function onSongStart()
	for i = 0, 7 do
		defaultNotePos[i] = {
			getPropertyFromGroup('strumLineNotes', i, 'x'),
			getPropertyFromGroup('strumLineNotes', i, 'y')
		}
	end
end

function onUpdate(elapsed)
	if curStep >= 0 and curStep < 5000 then
		local songPos = getPropertyFromClass('Conductor', 'songPosition') / 1000 --How long it will take.
		setProperty("camHUD.angle", spin * math.sin(songPos))
	end

	if curStep >= 5000 then
		setProperty("camHUD.angle", 0)
	end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
		objectPlayAnimation('fgNene', 'bop', true);
		objectPlayAnimation('fgOther', 'bop', true);
	end
end

function onBeatHit()
	playAnim("cassette", "idle", true)

	if curBeat % 2 == 0 then
		objectPlayAnimation('fgNene', 'bop', true);
		objectPlayAnimation('fgOther', 'bop', true);
	end
end