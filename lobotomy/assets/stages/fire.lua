function onCreate()

	makeLuaSprite('bg', 'hous/lobotomy/bg', -1500, -1500);
	setScrollFactor('bg', 0.5, 0.5);
	
	makeLuaSprite('gr', 'hous/lobotomy/gd ground', -1500, -320);
	scaleObject('gr', 2.5, 2.5);

	makeLuaSprite('fith', 'hous/lobotomy/fith', -450, -100);
	setScrollFactor('fith', 0.75, 0.75);

	makeAnimatedLuaSprite('dem','hous/lobotomy/etremem', -500, -315);
	addAnimationByPrefix('dem','bop','etremem bop', 24, false);
	scaleObject('dem', 0.5, 0.5);

	makeAnimatedLuaSprite('dem2','hous/lobotomy/etremem', -1500, -415);
	addAnimationByPrefix('dem2','bop','etremem bop', 24, false);
	scaleObject('dem2', 0.5, 0.5);
	setProperty('dem2.flipX', true);

	makeLuaSprite('thing', 'hous/lobotomy/thingamabobber', -20, -1500);
	setScrollFactor('thing', 1, 1);
	scaleObject('thing', 1.5, 1.5);
	setProperty('thing.alpha', 0);

	makeAnimatedLuaSprite('ded','hous/lobotomy/explode', -20, 225);
	addAnimationByPrefix('ded','bop','explode cmc', 24, false);
	scaleObject('ded', 1.3, 1.3);

	addLuaSprite('bg', false);
	addLuaSprite('fith', false);
	addLuaSprite('gr', false);
	addLuaSprite('dem', false);
	addLuaSprite('dem2', false);
	addLuaSprite('thing', true);
	addLuaSprite('ded', true);

	makeLuaText('lobotom', ' ',0, 280, 270);
    setObjectCamera('lobotom', 'other')
    addLuaText('lobotom')
    setTextSize('lobotom', 130);
    setProperty('lobotom.color', '0xFFFFFFFF'
	setTextFont('lobotom', 'fith.ttf');

	makeLuaSprite('fith2', 'hous/lobotomy/fith', -1150, 550);
	setScrollFactor('fith2', 1.3, 1.3);
	scaleObject('fith2', 1.5, 1.5);
	addLuaSprite('fith2', true);

	makeLuaText('credits', 'Song cover - SACRIFICE.FLP',0, -400, 175);
	setObjectCamera('credits', 'hud');
    addLuaText('credits');
    setTextSize('credits', 20);
    setProperty('credits.color', '0xFFFFFFFF');

	makeLuaText('credits2', 'Composed by - Sugar Moon',0, -400, 210);
	setObjectCamera('credits2', 'hud');
    addLuaText('credits2');
    setTextSize('credits2', 20);
    setProperty('credits.color2', '0xFFFFFFFF');
end
function onCountdownStarted()
    setProperty('camHUD.alpha',0)
end
function onBeatHit()
	if (curBeat % 2 == 0) then
		luaSpritePlayAnimation('dem','bop', true)
	else
		luaSpritePlayAnimation('dem2','bop', true)
	end
end
function onSectionHit()
	if curStep >= 304 then
	doTweenColor("wow","bg", "d8b8ff", 0.01, "linear")
	doTweenColor("wow2","gr", "d8b8ff", 0.01, "linear")
	end
end
function onUpdatePost()
	if getProperty('health') > 1.6 then
		setHealthBarColors("bb0000", getIconColor("bf")) 
	else
		setHealthBarColors(getIconColor("dad"), getIconColor("bf"))
	end
end
function onUpdate()
	if curStep == 304 then
        doTweenAlpha('hudhihi','camHUD',1,1,'quadInOut')
    end
	if curStep == 24 then
		setTextString('lobotom', 'LOB')
	end
	if curStep == 27 then
		setTextString('lobotom', 'LOBOT')
	end
	if curStep == 30 then
		setTextString('lobotom', 'LOBOTOM')
	end
	if curStep == 32 then
		setTextString('lobotom', 'LOBOTOMY')
	end

	if curStep == 152 then
		setTextString('lobotom', 'LOBOTOM')
	end
	if curStep == 155 then
		setTextString('lobotom', 'LOBOT')
	end
	if curStep == 158 then
		setTextString('lobotom', 'LOB')
	end

	if curStep == 200 then
		bgPulse()
	end
	if curStep == 203 then
		bgPulse()
	end
	if curStep == 206 then
		bgPulse()
	end
	if curStep == 232 then
		bgPulse()
	end
	if curStep == 235 then
		bgPulse()
	end
	if curStep == 238 then
		bgPulse()
	end
	if curStep == 264 then
		bgPulse()
	end
	if curStep == 267 then
		bgPulse()
	end
	if curStep == 270 then
		bgPulse()
	end
	if curStep == 296 then
		bgPulse()
	end
	if curStep == 299 then
		bgPulse()
	end
	if curStep == 302 then
		bgPulse()
	end

	if curStep == 160 then
		setTextString('lobotom', ' ')
		doTweenY('strentch3', "dem.scale", 0.000001, 0.1, "circOut")
		doTweenX('strentch6', "dem2.scale", 0.000001, 0.1, "circOut")
		doTweenX('strentch5', "fith.scale", 0.000001, 0.1, "circOut")
		doTweenY('move1', "fith2", 1050, 0.1, "circOut")
	end

	if curBeat == 140 then
		doTweenY('strentch', "dem.scale", 0.5, 1, "quartOut")
		doTweenX('strentch2', "dem.scale", 0.5, 1, "quartOut")
	end
	if curBeat == 172 then
		doTweenY('strentch7', "dem2.scale", 0.5, 1, "quartOut")
		doTweenX('strentch8', "dem2.scale", 0.5, 1, "quartOut")
	end
	if curBeat == 338 then
		doTweenX('strentch11', "fith.scale", 0.5, 1, "quartOut")
	end
	if curBeat == 402 then
		doTweenY('move2', "fith2", 650, 1, "quartOut")
	end
	if curBeat == 234 then
		setProperty('thing.alpha', 1)
		doTweenY('thiung', "thing", -150, 1, "bounceOut")
	end
	if curStep == 944 then
		luaSpritePlayAnimation('ded','bop', true)
	end
	if curBeat == 236 then
		setProperty('boyfriend.alpha', 0)
		doTweenX('slide1', "boyfriend", 1070, 0.01, "quartOut")
	end
	if curBeat == 237 then
		doTweenY('thiung2', "thing", -1500, 2, "circInOut")
	end
	if curBeat == 244 then
		setProperty('boyfriend.alpha', 1)
		doTweenX('slide', "boyfriend", 70, 2, "quartOut")
	end
	

	if curBeat == 77 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1, "quartOut")
	end
	if curBeat == 85 then
		doTweenX('credi', "credits", -400, 1, "quartIn")
		doTweenX('credi2', "credits2", -400, 1, "quartIn")
	end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end

function onTweenCompleted(wow)
    doTweenColor('wah', 'gr', 'FFFFFF', 0.3, 'linear')
    doTweenColor('wah2', 'bg', 'FFFFFF', 0.3, 'linear')
end
function bgPulse()
	doTweenColor("wow","bg", "b77cff", 0.01, "linear")
	doTweenColor("wow2","gr", "b77cff", 0.01, "linear")
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
end