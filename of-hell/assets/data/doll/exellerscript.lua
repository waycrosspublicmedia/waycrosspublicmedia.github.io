function onCreate()
	counter = getPropertyFromClass('PlayState', 'deathCounter');
	if counter == 0 then --quite long but too lazy to make an actual smooth code
		makeLuaSprite('progress', 'progress', 1190, 620);
		scaleObject('progress', 0.05, 0.02);
	end
	if counter == 1 then
		makeLuaSprite('progress', 'progress', 1190, 540);
		scaleObject('progress', 0.05, 0.10);
	end
	if counter == 2 then
		makeLuaSprite('progress', 'progress', 1190, 490);
		scaleObject('progress', 0.05, 0.15);
	end
	if counter == 3 then
		makeLuaSprite('progress', 'progress', 1190, 450);
		scaleObject('progress', 0.05, 0.185);
	end
	if counter == 4 then
		makeLuaSprite('progress', 'progress', 1190, 420);
		scaleObject('progress', 0.05, 0.22);
	end
	if counter == 5 then
		makeLuaSprite('progress', 'progress', 1190, 380);
		scaleObject('progress', 0.05, 0.26);
	end
	if counter == 6 then
		makeLuaSprite('progress', 'progress', 1190, 350);
		scaleObject('progress', 0.05, 0.3);
	end
	if counter == 7 then
		makeLuaSprite('progress', 'progress', 1190, 300);
		scaleObject('progress', 0.05, 0.35);
	end
	if counter >= 8 then
		makeLuaSprite('progress', 'progress', 1190, 240);
		scaleObject('progress', 0.05, 0.4);
	end --end of long af lazy code 
	setScrollFactor('progress', 0, 0);
	addLuaSprite('progress', true);
	setObjectCamera('progress', 'camHUD');
	makeLuaSprite('bar', 'bar', 1090, 160);
	setScrollFactor('bar', 0, 0);
	scaleObject('bar', 0.5, 0.5);
	addLuaSprite('bar', true);
	setObjectCamera('bar', 'camHUD');
	makeAnimatedLuaSprite('execum', 'execum', -250, -100);
	setScrollFactor('execum', 0, 0);
	scaleObject('execum', 0.5, 0.5);
	setObjectCamera('execum', 'camOTHER');

	if counter >= 8 then --when your death is coming
		runTimer("timer", 0.01, 0); --hehe the counter is only 0.01 seconds but forever so it will call 100 "onTimerCompleted" /sec ur death is coming o-o
		--debugPrint("everything's working fine !")
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	--debugPrint("yeah !") --don't add when ur death is here or else consequences. I told you
	if tag == "timer" then
		if (keyReleased('left') or keyReleased('right') or keyReleased('up') or keyReleased('down')) then --kinda long

			addAnimationByPrefix('execum','boouscared','',16,false);
			playSound('sceamer');
			addLuaSprite('execum', true);
			setProperty('vocals.volume', 0) --it's not working yet
			setProperty('inst.volume', 0) --idk why
			runTimer("da-end", 1.71426, 1);
		end
	end
	if tag == "da-end" then
		setProperty('dad', 'dokfgkrto') --ouch, it will just crash lmao and the music will BEE . BOO . *death*
	end
end