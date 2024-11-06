function onCreate()
	makeAnimatedLuaSprite('gym', 'gym', -600, -400);
	addAnimationByPrefix('gym', 'anim', 'bg bump', 24, false);
	scaleObject('gym', 1.45, 1.45);
	addLuaSprite('gym');

	makeAnimatedLuaSprite('bag', 'bag', 1000, -200);
	addAnimationByPrefix('bag', 'idle', 'bag idle', 24, true);
	addAnimationByPrefix('bag', 'hit', 'hit', 24, false);
	addAnimationByPrefix('bag', 'knockout', 'knockout', 24, false);
	scaleObject('bag', 1.1, 1.1);
	setProperty('bag.offset.x', 0);
	setProperty('bag.offset.y', 0);
	addLuaSprite('bag', true);

	setProperty('bag.origin.y', getProperty('bag.origin.y') - 300);
	
	setPropertyFromClass('GameOverSubstate', 'characterName', 'skarlet-matt-dead');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'deathMatt');
end

function onCountdownStarted()
	if not middlescroll then
		for i = 0, 4 do
			setProperty('opponentStrums.members['..i..'].x', _G['defaultPlayerStrumX'..i]);
			setProperty('playerStrums.members['..i..'].x', _G['defaultOpponentStrumX'..i]);
		end
	end
end

angleShit = 0;
originalAngle = 1.5;
curAngle = 1.5;

bagFrameTiming = 0;
bagSwingFramerate = 12;

function onUpdate(elapsed)
	animName = getProperty('bag.animation.curAnim.name');
	if animName ~= 'idle' and getProperty('bag.animation.curAnim.finished') then
		if animName == 'knockout' then
			setProperty('bag.visible', false);
		end
		playAnim('bag', 'idle', true);
		setProperty('bag.offset.x', 0);
		setProperty('bag.offset.y', 0);
		animName = 'idle';
	end

	if animName == 'idle' then
		bagFrameTiming = bagFrameTiming + elapsed;
		while bagFrameTiming >= 1 / bagSwingFramerate do
			moveBag();
			bagFrameTiming = bagFrameTiming - (1 / bagSwingFramerate);
		end
	else
		setProperty('bag.angle', 0);
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('gym', 'anim', true);
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('notes.members['..id..'].mustPress') then
		doHit();
	end
end

function moveBag()
	angleShit = angleShit + (5 * (24 / bagSwingFramerate));
	curAngle = lerp(curAngle, originalAngle, math.min(1, 0.05));
	if math.abs(curAngle - originalAngle) < 0.5 then
		curAngle = originalAngle;
	end
	setProperty('bag.angle', math.sin(angleShit * math.pi / 180) * curAngle)
end

function doHit()
	playAnim('bag', 'hit', true);
	setProperty('bag.offset.x', 28);
	setProperty('bag.offset.y', 1);
	setProperty('bag.angle', 0);
	--curAngle = 5;
	angleShit = 0;
end

function lerp(a, b, t)
	return a + (b - a) * t
end

function onEvent(tag, value1, value2)
	if tag == 'Knockout Punchbag' then
		playAnim('boyfriend', 'frontkick', true);
		setProperty('boyfriend.debugMode', true);
		runTimer('kill bag lol', 0.33);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'kill bag lol' then
		playAnim('dad', 'dodge', true);
		setProperty('dad.debugMode', true);
		setProperty('dad.specialAnim', true);

		setObjectOrder('bag', getObjectOrder('boyfriendGroup') - 1);
		setObjectOrder('dadGroup', getObjectOrder('bag') - 1);
		playAnim('bag', 'knockout', true);
		setProperty('bag.angle', 0);
		setProperty('bag.offset.x', -150);
		setProperty('bag.offset.y', -150);
		angleShit = 0;
	end
end