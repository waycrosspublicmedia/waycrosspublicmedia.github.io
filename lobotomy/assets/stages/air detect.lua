function onCreate()
	precacheSound('crash');
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'auto-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'auto_gameover_sfx');

	makeLuaSprite('bg', 'hous/lobotomy/air/bg', -1500, -1000);
	setScrollFactor('bg', 0.5, 0.5);
	
	makeLuaSprite('gr', 'hous/lobotomy/air/datgroundomg', -1600, -320);
	scaleObject('gr', 2.75, 2.5)

	makeLuaSprite('hous', 'hous/lobotomy/air/abnormal_house', -1800, -400);
	scaleObject('hous', 1.5, 1.5)

	makeLuaSprite('fith', 'hous/lobotomy/air/ad', -400, -100);
	setScrollFactor('fith', 0.75, 0.75);

	addLuaSprite('bg', false);
	addLuaSprite('fith', false);
	addLuaSprite('gr', false);
	addLuaSprite('hous', false);

	makeLuaText('credits', 'Song cover - Satellite Picnic',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', '0xFFFFFFFF')

	makeLuaText('credits2', 'Composed by - Saruky & SaltedSporks',0, -700, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', '0xFFFFFFFF')

	makeLuaText('credits3', 'From - Hotline 024',0, -700, 245);
	setObjectCamera('credits3', 'hud')
    addLuaText('credits3')
    setTextSize('credits3', 30);
    setProperty('credits3.color', '0xFFFFFFFF')

	makeLuaText('credits4', '[Satellite Picnic Cover]',0, 473, 30);
	setObjectCamera('credits4', 'hud')
	setTextAlignment('credits4', 'CENTER')
    addLuaText('credits4')
    setTextSize('credits4', 25);
    setProperty('credits4.color', '0xFFFFFFFF')
end

function onSectionHit()
	if curStep >= 304 then
	doTweenColor("wow","bg", "d8b8ff", 0.01, "linear")
	doTweenColor("wow2","gr", "d8b8ff", 0.01, "linear")
	end
end

function onUpdate()
	if inGameOver == true then
        setProperty('camFollow.y',getMidpointY('boyfriend')-1000)
        setProperty('camFollow.x',getMidpointX('boyfriend'))
    end
	if boyfriendName == 'auto-face' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", 'a8a8a8') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', 'f2ad63') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', 'ff250d') -- winning
		end
	end
	if curBeat == 1 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
		doTweenX('credi3', "credits3", 10, 1.4, "quartOut")
	end
	if curBeat == 9 then
		doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -700, 1.2, "quartIn")
		doTweenX('credi3', "credits3", -700, 1.4, "quartIn")
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
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
end