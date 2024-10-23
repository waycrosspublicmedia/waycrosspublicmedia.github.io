local originyEXE = 0
local originyRude = 0
local originyRoblox = 0
local originyAnt = 0
local originyCarmine = 0
local originyPetBF = 0
local originyJeff = 0
local originxToasty = 0
spaceEnabled = true

local specialGuest = {
    '1',
    '2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
}

function onCreate()
	makeLuaSprite('cameoPicEXE','easter eggs/cameos/cameo_sonicEXE', 1000, 350+350)
	addLuaSprite('cameoPicEXE',true)
    setObjectCamera('cameoPicEXE','hud')
    scaleObject('cameoPicEXE', 0.7, 0.7)
	setObjectOrder('cameoPicEXE', 6)

	makeLuaSprite('cameoPicRUDE','easter eggs/cameos/cameo_rude1', 970, 400+350)
	addLuaSprite('cameoPicRUDE',true)
    setObjectCamera('cameoPicRUDE','hud')
    scaleObject('cameoPicRUDE', 0.7, 0.7)
	setObjectOrder('cameoPicRUDE', 6)

	makeLuaSprite('cameoPicROB','easter eggs/cameos/cameo_roblox', 1000, 400+350)
	addLuaSprite('cameoPicROB',true)
    setObjectCamera('cameoPicROB','hud')
    scaleObject('cameoPicROB', 0.7, 0.7)
	setObjectOrder('cameoPicROB', 6)

	makeLuaSprite('cameoPicANT','easter eggs/cameos/cameo_coolAnt', 1100, 450+350)
	addLuaSprite('cameoPicANT',true)
    setObjectCamera('cameoPicANT','hud')
    scaleObject('cameoPicANT', 0.7, 0.7)
	setObjectOrder('cameoPicANT', 6)

	makeLuaSprite('cameoPicCAR','easter eggs/cameos/cameo_carmine', 1020, 380+350)
	addLuaSprite('cameoPicCAR',true)
    setObjectCamera('cameoPicCAR','hud')
    scaleObject('cameoPicCAR', 5.7, 5.7)
	setProperty('cameoPicCAR.antialiasing',false)
	setObjectOrder('cameoPicCAR', 6)

	makeLuaSprite('carmineText','easter eggs/cameos/carm_text', 540, 550)
	addLuaSprite('carmineText',true)
    setObjectCamera('carmineText','hud')
    scaleObject('carmineText', 3, 3)
	setProperty('carmineText.antialiasing',false)
	setProperty('carmineText.alpha', 0.0001)

	makeLuaSprite('cameoPicPET','easter eggs/cameos/cameo_petBF', 1100, 500+350)
	addLuaSprite('cameoPicPET',true)
    setObjectCamera('cameoPicPET','hud')
    scaleObject('cameoPicPET', 0.7, 0.7)
	setObjectOrder('cameoPicPET', 6)

	makeLuaSprite('cameoPicJK','easter eggs/cameos/cameo_jeff', 980, 380+350)
	addLuaSprite('cameoPicJK',true)
    setObjectCamera('cameoPicJK','hud')
    scaleObject('cameoPicJK', 0.7, 0.7)
	setObjectOrder('cameoPicJK', 6)

	makeLuaSprite('cameoPicTOAST','easter eggs/cameos/cameo_toasty', 980+300, 360)
	addLuaSprite('cameoPicTOAST',true)
    setObjectCamera('cameoPicTOAST','hud')
    scaleObject('cameoPicTOAST', 0.7, 0.7)
	setProperty('cameoPicTOAST.antialiasing',false)
	setObjectOrder('cameoPicTOAST', 6)

	originyEXE = getProperty('cameoPicEXE.y')
	originyRude = getProperty('cameoPicRUDE.y')
	originyRoblox = getProperty('cameoPicROB.y')
	originyAnt = getProperty('cameoPicANT.y')
	originyCarmine = getProperty('cameoPicCAR.y')
	originyPetBF = getProperty('cameoPicPET.y')
	originyJeff = getProperty('cameoPicJK.y')
	originxToasty = getProperty('cameoPicTOAST.x')
end

function onBeatHit()

end

function onEvent( name, value1,value2)
	if name == 'Mar Mar Cameos' then
		if value1 == '1' then --sonic exe
			playSound('cameo_exe_sfx', 0.9);
			doTweenY('exeYup', 'cameoPicEXE', originyEXE-350, 0.3, 'linear');
			runTimer('easterShit', 2)
		end

		if value1 == '2' then -- rude#1
			playSound('cameo_rude_sfx', 0.9);
			doTweenY('rudeYup', 'cameoPicRUDE', originyRude-350, 0.3, 'linear');
			runTimer('easterShit', 2)
		end

		if value1 == '3' then -- roblox noob
			playSound('cameo_roblox_sfx', 0.9);
			doTweenY('robYup', 'cameoPicROB', originyRude-350, 0.3, 'linear');
			runTimer('easterShit', 2)
		end

		if value1 == '4' then -- ant
			playSound('cameo_ant_sfx', 0.9);
			doTweenY('antYup', 'cameoPicANT', originyAnt-350, 0.3, 'linear');
			runTimer('easterShit', 2)
		end

		if value1 == '5' then -- carmine
			doTweenY('carYup', 'cameoPicCAR', originyCarmine-350, 0.5, 'linear');
			runTimer('easterShitCarm', 3)
		end

		if value1 == '6' then -- pet bf
			playSound('cameo_petBF_sfx', 0.9);
			doTweenY('petYup', 'cameoPicPET', originyPetBF-350, 0.3, 'linear');
			runTimer('easterShit', 2)
		end

		if value1 == '7' then -- pet bf
			playSound('cameo_jeff_sfx', 0.9);
			doTweenY('jeffYup', 'cameoPicJK', originyJeff-350, 0.3, 'linear');
			runTimer('easterShit', 2)
		end

		if value1 == '8' then -- toasty MK reference
			playSound('cameo_toasty_sfx', 0.9);
			doTweenX('toastXup', 'cameoPicTOAST', originxToasty-300, 0.3, 'linear');
			runTimer('easterShit', 1)
		end
	end
end

function onUpdate()
	
	rand= math.random( 1, 8)
    theCameos = specialGuest[rand]

	if keyboardJustPressed('SPACE') then
		if spaceEnabled == true then
			triggerEvent('Mar Mar Cameos', theCameos, '')
			spaceEnabled = false
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'carYup' then
		playSound('cameo_carmine_sfx', 0.5);
		setProperty('carmineText.alpha', 1)
	end
end

function onTimerCompleted(t,l,ll)
    if t == 'easterShit' then
		doTweenY('exeYDown', 'cameoPicEXE', originyEXE, 0.3, 'linear');
		doTweenY('rudeYDown', 'cameoPicRUDE', originyRude, 0.3, 'linear');
		doTweenY('robYDown', 'cameoPicROB', originyRoblox, 0.3, 'linear');
		doTweenY('antYDown', 'cameoPicANT', originyAnt, 0.3, 'linear');
		doTweenY('petYDown', 'cameoPicPET', originyPetBF, 0.3, 'linear');
		doTweenY('jeffYDown', 'cameoPicJK', originyJeff, 0.3, 'linear');
		doTweenX('toastXBack', 'cameoPicTOAST', originxToasty, 0.3, 'linear');
		runTimer('lastFew', 0.3)
	end

	if t == 'easterShitCarm' then
		doTweenY('carYDown', 'cameoPicCAR', originyCarmine, 0.3, 'linear');
		setProperty('carmineText.alpha', 0.0001)
		runTimer('lastFew', 0.3)
	end

	if t == 'lastFew' then
		spaceEnabled = true
	end
end