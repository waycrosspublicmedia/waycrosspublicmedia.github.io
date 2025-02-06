-- SOME CODE IS SHIT!!!
-- GOOD LUCK!!!
local veryLowQuality = false -- Removes BG Entirely // potato pc momentum

local bgShit = {'STARDESTROYER', 'TWOBUILDINGS', 'ENEMYBASE'}
local bgShitY = {250, -120, 247}

local inCutscene = false -- actually it IS in cutscene at start but who cares
function onCreate()
	precacheImage('atlas/TankCutscene1/spritemap')
	precacheImage('characters/Sportman')
	precacheImage('characters/Captain')
	--bg
	makeLuaSprite('sky', 'SKYBOX', -600, -530)
	scaleObject('sky', 1.4, 1.4)
	setScrollFactor('sky', 0, 0)
	addLuaSprite('sky', false)
	
	if not veryLowQuality then
		if not lowQuality then
			makeLuaSprite('clouds', 'CLOUDS', -1200, -475)
			setScrollFactor('clouds', 0.1, 0.1)
			scaleObject('clouds', 1.4, 1.4)
			addLuaSprite('clouds', false)
			
			makeLuaSprite('mount', 'MOUNTAINS', -1200, -205)
			setScrollFactor('mount', 0.2, 0.2)
			scaleObject('mount', 1.4, 1.4)
			addLuaSprite('mount', false)
			
			makeLuaSprite('city', 'CITY', -1200, -385)
			setScrollFactor('city', 0.3, 0.3)
			scaleObject('city', 1.6, 1.6)
			addLuaSprite('city', false)
		end
	
		makeLuaSprite('bf', 'BATTLEFIELD', -1200, 330)
		setScrollFactor('bf', 0.5, 0.5)
		scaleObject('bf', 1.2, 1.2)
		addLuaSprite('bf', false)
		
		makeLuaSprite('bgshit', bgShit[1], 680, bgShitY[1] - 130)
		setScrollFactor('bgshit', 0.5, 0.5)
		scaleObject('bgshit', 1.4, 1.4)
		addLuaSprite('bgshit', false)
		
		makeLuaSprite('floor', 'FLOOR', -1800, 364)
		setScrollFactor('floor', 0.9, 0.9)
		scaleObject('floor', 1.5, 1.5)
		addLuaSprite('floor', false)
		
	
	end
	--our tank boys
	if lowQuality then
		precacheImage('lowQuality/TankBadLow')
		makeAnimatedLuaSprite('tankBad', 'lowQuality/TankBadLow', -5000, 505)
	else
		precacheImage('TankBad')
		makeAnimatedLuaSprite('tankBad', 'TankBad', -5000, 505)
		addAnimationByPrefix('tankBad', 'idle', 'VehicleTankBadBeat', 24, false)
	end
	addAnimationByPrefix('tankBad', 'loop', 'VehicleTankBadLoop', 24, true)
	playAnim('tankBad', 'loop')
	setObjectOrder('tankBad', getObjectOrder('dadGroup') + 1)
	addLuaSprite('tankBad', false)
	precacheImage('Sportguy')
	makeAnimatedLuaSprite('sg', 'Sportguy')
	addAnimationByPrefix('sg', 'idle', 'TankGuy1', 24, false)
	addAnimationByPrefix('sg', 'WOW', 'SportGuySurpriseandDEATH', 24, false)
	addLuaSprite('sg', false)
	
	precacheImage('Steve')
	makeAnimatedLuaSprite('steve', 'Steve')
	addAnimationByPrefix('steve', 'idle', 'SteveIdle', 24, false)
	addLuaSprite('steve', false)
	precacheImage('Tank')
	makeAnimatedLuaSprite('tank', 'Tank', -2500, 485)
	addAnimationByPrefix('tank', 'loop', 'Tank')
	addLuaSprite('tank', false)
	
	
	
	
	--intro bar
	if not veryLowQuality then
		if not lowQuality then
			makeLuaSprite('people', 'GuysonTables', 1300, 600)
			setScrollFactor('people', 1, 1)
			scaleObject('people', 1.3, 1.3)
			addLuaSprite('people', true)
	-- se
			makeLuaSprite('fore', 'FOREGROUND', -1800, 780)
			setScrollFactor('fore', 1.1, 1.1)
			scaleObject('fore', 1.1, 1.1)
			addLuaSprite('fore', true)
		end
	end
	-- x
	
	makeLuaSprite('store', 'FrontStore', 2030, -242)
	setScrollFactor('store', 1.2, 1.2)
	scaleObject('store', 1.12, 1.12)
	addLuaSprite('store', true)
	
	makeAnimatedLuaSprite('lady', 'TankLady', 2780, 405)
	addAnimationByPrefix('lady', 'anim1', 'TankLady2', 20, false)
	addAnimationByPrefix('lady', 'anim2', 'TankLady0', 24, false)
	setScrollFactor('lady', 1.2, 1.2)
	scaleObject('lady', 1.2, 1.2)
	addLuaSprite('lady', true)
	
	
	precacheImage('PrivateSkittlesHut')
	precacheImage('atlas/SkittlesStand/spritemap')
	makeAnimatedLuaSprite('tower', 'PrivateSkittlesHut', 25200, -2800)
	addAnimationByPrefix('tower', 'anim', 'PrivateSkittlesHut', 24, false)
	addAnimationByIndices('tower', 'idle', 'PrivateSkittlesHut', '1, 1', 24)
	playAnim('tower', 'idle')
	setScrollFactor('tower', 1, 1)
	addLuaSprite('tower', true)
	
	makeAnimatedLuaSprite('towerStand', 'atlas/SkittlesStand', 25260, -1600,'tex')
	addAnimationByPrefix('towerStand', 'idle', 'idle', 24, false)
	addAnimationByPrefix('towerStand', 'anim', 'anim', 24, false)
	playAnim('towerStand', 'idle')
	setScrollFactor('towerStand', 1, 1)
	setObjectOrder('towerStand', getObjectOrder('tower') - 1)
	addLuaSprite('towerStand', true)
	
	makeAnimatedLuaSprite('cutsceneTank', 'atlas/TankCutscene1', 0, 0,'tex')
	addAnimationByPrefix('cutsceneTank', 'turn', 'turn', 24, false)
	addAnimationByPrefix('cutsceneTank', 'shoot', 'shoot', 24, false)
	addAnimationByPrefix('cutsceneTank', 'line', 'line', 24, false)
	setObjectOrder('cutsceneTank', getObjectOrder('tank'))
	playAnim('cutsceneTank', 'idle')
	setScrollFactor('cutsceneTank', 1, 1)
	addLuaSprite('cutsceneTank', true)
	setProperty('cutsceneTank.x', getProperty('tank.x') - 1000)
	setProperty('cutsceneTank.y', getProperty('tank.y') - 590)
	
end

function onSongStart()
	setProperty('cutsceneTank.alpha', 0)
	doTweenX('cameraTweenX', getProperty('camFollow'), 3100, 5 / playbackRate, 'quadInOut')
	doTweenY('cameraTweenY', getProperty('camFollow'), 600, 5 / playbackRate, 'quadInOut')
end

function onCreatePost()
	local playbackRate = getProperty('playbackRate')
end

local tacc = 'tankBad.animation.curAnim.curFrame'
local shitGenerated = 1
function onUpdate(elapsed)
	setProperty('steve.x', getProperty('tank.x') + 460)
	setCharacterX('boyfriend', getProperty('tank.x') + 50)
	
	if curBeat < 540 then
		setProperty('sg.x', getProperty('tankBad.x') + 1700)
	end
	if curBeat >= 546 then
		setProperty('sg.x', getProperty('tankBad.x') + 1700 - 493)
	end
	setCharacterX('dad', getProperty('tankBad.x') + 1360)
	
	if getProperty('tank.animation.curAnim.curFrame') == 1 then
		setProperty('steve.y', getProperty('tank.y') - 160)
		setCharacterY('boyfriend', getProperty('tank.y') - 200)
	elseif getProperty('tank.animation.curAnim.curFrame') == 2 then
		setProperty('steve.y', getProperty('tank.y') - 163)
		setCharacterY('boyfriend', getProperty('tank.y') - 203)
	elseif getProperty('tank.animation.curAnim.curFrame') == 2 then
		setProperty('steve.y', getProperty('tank.y') - 166)
		setCharacterY('boyfriend', getProperty('tank.y') - 206)
	end
	if curBeat < 546 then
	if getProperty(tacc) == 1 or getProperty(tacc) == 5 or getProperty(tacc) == 9 or getProperty(tacc) == 13 then
		setProperty('sg.y', getProperty('tankBad.y') - 300)
		setCharacterY('dad', getProperty('tankBad.y') - 600)
	elseif getProperty(tacc) == 2 or getProperty(tacc) == 4 or getProperty(tacc) == 6 or getProperty(tacc) == 8 or getProperty(tacc) == 10 or getProperty(tacc) == 12 or getProperty(tacc) == 14 or getProperty(tacc) == 16 then
		setProperty('sg.y', getProperty('tankBad.y') - 305)
		setCharacterY('dad', getProperty('tankBad.y') - 605)
	elseif getProperty(tacc) == 3 or getProperty(tacc) == 7 or getProperty(tacc) == 11 or getProperty(tacc) == 15 then
		setProperty('sg.y', getProperty('tankBad.y') - 310)
		setCharacterY('dad', getProperty('tankBad.y') - 610)
	end
	else
	if getProperty(tacc) == 1 or getProperty(tacc) == 5 or getProperty(tacc) == 9 or getProperty(tacc) == 13 then
		setProperty('sg.y', getProperty('tankBad.y') - 300 - 512)
		setCharacterY('dad', getProperty('tankBad.y') - 600)
	elseif getProperty(tacc) == 2 or getProperty(tacc) == 4 or getProperty(tacc) == 6 or getProperty(tacc) == 8 or getProperty(tacc) == 10 or getProperty(tacc) == 12 or getProperty(tacc) == 14 or getProperty(tacc) == 16 then
		setProperty('sg.y', getProperty('tankBad.y') - 305 - 512)
		setCharacterY('dad', getProperty('tankBad.y') - 605)
	elseif getProperty(tacc) == 3 or getProperty(tacc) == 7 or getProperty(tacc) == 11 or getProperty(tacc) == 15 then
		setProperty('sg.y', getProperty('tankBad.y') - 310 - 512)
		setCharacterY('dad', getProperty('tankBad.y') - 610)
	end
	end
	if getProperty('tankBad.animation.curAnim.name') == 'idle' and getProperty('tankBad.animation.curAnim.finished') then
		playAnim('tankBad', 'loop', false)
	end
	local a1 = 'lady.animation.curAnim.curFrame'
	local a2 = 'lady.animation.curAnim.name'
	if not getProperty('startingSong') then
		if getProperty(a2) == 'anim1' then
			if getProperty(a1) == 1 then
				playSound('gulp', 0.5)
			elseif getProperty(a1) == 21 then
				playSound('beer down', 0.6)
			end
		end
	end
	if curBeat <= 100 then
	if getProperty('city.velocity.x') < -199 then
		setProperty('city.acceleration.x', 0)
	end
	if getProperty('mount.velocity.x') < -99 then
		setProperty('mount.acceleration.x', 0)
	end
	if getProperty('clouds.velocity.x') < -49 then
		setProperty('clouds.acceleration.x', 0)
	end
	end
end

local endingCutscene = false
local followTank = true
function onUpdatePost(elapsed)
	if curBeat >= 360 and curBeat <= 400 then
		if getProperty('tank.velocity.x') <= 0 then
			setProperty('tank.acceleration.x', 0)
			setProperty('tank.velocity.x', 0)
		end
		if getProperty('tankBad.velocity.x') <= 0 then
			setProperty('tankBad.acceleration.x', 0)
			setProperty('tankBad.velocity.x', 0)
		end
	end
	if curBeat >= 376 and curBeat <= 384 then
		triggerEvent('Camera Follow Pos', getProperty('tank.x') - 200, getProperty('tank.y') - 60)
	end
	if endingCutscene then
		if followTank then
			triggerEvent('Camera Follow Pos', getProperty('cutsceneTank.x') + 1600, getProperty('cutsceneTank.y') + 540)
		else
			doTweenX('cameraTweenX5', getProperty('camFollow'), getProperty('dad.x') + 600, 0.2 / playbackRate, 'linear')
			doTweenY('cameraTweenY5', getProperty('camFollow'), getProperty('dad.y') + 200, 0.2 / playbackRate, 'linear')
			triggerEvent('Camera Follow Pos', getProperty('dad.x') + 600, getProperty('dad.y') + 200)
		end
	end
	if getProperty('cutsceneTank.animation.curAnim.name') == 'turn' and getProperty('cutsceneTank.animation.curAnim.finished') then
		playAnim('cutsceneTank', 'shoot', true)
	end
	if getProperty('dad.animation.curAnim.name') == 'death' and getProperty('dad.animation.curAnim.curFrame') == 18 then
		setProperty('dad.animation.paused', true)
	end
	if getProperty('sg.animation.curAnim.name') == 'WOW' and getProperty('sg.animation.curAnim.curFrame') == 49 then
		setProperty('sg.animation.paused', true)
	end
	if curBeat > 540 then
		if getProperty('tankBad.velocity.x') <= 0 then
			setProperty('tankBad.acceleration.x', 0)
			setProperty('tankBad.velocity.x', 0)
		end
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
			playAnim('steve', 'idle', true)
			if curBeat < 540 then
				playAnim('sg', 'idle', true)
			end
		if not lowQuality then
			playAnim('tankBad', 'idle', true)
		end
	end
	if curBeat == 5 or curBeat == 7 or curBeat == 9 or curBeat == 11 then
		playAnim('lady', 'anim1', true)
	end
	if curBeat == 15 then
		playSound('pass by')
	end
	if curBeat == 20 then
		setProperty('tank.velocity.x', 10000 * playbackRate)
		setProperty('tankBad.velocity.x', 10000 * playbackRate)
	end
	if curBeat == 21 then
		cameraShake('camGame', 0.005, 0.6)
		playAnim('lady', 'anim2', true)
		setProperty('lady.x', getProperty('lady.x') + 25)
		setProperty('lady.y', getProperty('lady.y') + 19)
	end
	if curBeat == 24 then
		inCutscene = false
		doTweenX('cameraTweenX2', getProperty('camFollow'), getProperty('dad.x') + 600, 1 / playbackRate, 'quadIn')
		doTweenY('cameraTweenY2', getProperty('camFollow'), getProperty('dad.y') + 300, 1 / playbackRate, 'quadIn')
		doTweenAlpha('HudTween', 'camHUD', 1, 1 / playbackRate, 'quadIn')
		setProperty('tank.velocity.x', 0)
		setProperty('tankBad.velocity.x', 0)
		setProperty('tank.y', 690)
	
		if not veryLowQuality then
		makeLuaSprite('floor1', 'FLOOR', getProperty('floor.x') + 5200, getProperty('floor.y') + 100)
		setScrollFactor('floor1', 0.5, 0.5)
		scaleObject('floor1', 1.5, 1.5)
		setProperty('floor1.velocity.x', -2000 * playbackRate)
		setObjectOrder('floor1', getObjectOrder('floor'))
		addLuaSprite('floor1', false)
	
		setProperty('bf.acceleration.x', -600 / playbackRate)
		makeLuaSprite('bf1', 'BATTLEFIELD', getProperty('bf.x') + 6000, getProperty('bf.y') + 100)
		setScrollFactor('bf1', 0.9, 0.9)
		scaleObject('bf1', 1.2, 1.2)	
		setProperty('bf1.velocity.x', -500 * playbackRate)
		setObjectOrder('bf1', getObjectOrder('bf'))
		addLuaSprite('bf1', false)
		
		if not lowQuality then
			setProperty('city.acceleration.x', -200 / playbackRate)
			makeLuaSprite('city1', 'CITY', getProperty('city.x') + 4790, getProperty('city.y'))
			setScrollFactor('city1', 0.3, 0.3)
			scaleObject('city1', 1.6, 1.6)
			setProperty('city1.velocity.x', -200 * playbackRate)
			setObjectOrder('city1', getObjectOrder('city'))
			addLuaSprite('city1', false)
			
			setProperty('mount.acceleration.x', -100 / playbackRate)
			makeLuaSprite('mount1', 'MOUNTAINS', getProperty('mount.x') + 4200, getProperty('mount.y'))
			setScrollFactor('mount1', 0.2, 0.2)
			scaleObject('mount1', 1.4, 1.4)
			setProperty('mount1.velocity.x', -100 * playbackRate)
			setObjectOrder('mount1', getObjectOrder('mount'))
			addLuaSprite('mount1', false)
			
			setProperty('clouds.acceleration.x', -50 / playbackRate)
			makeLuaSprite('clouds1', 'CLOUDS', getProperty('clouds.x') + 4200, getProperty('clouds.y'))
			setScrollFactor('clouds1', 0.1, 0.1)
			scaleObject('clouds1', 1.4, 1.4)
			setProperty('clouds1.velocity.x', -50 * playbackRate)
			setObjectOrder('clouds1', getObjectOrder('clouds'))
			addLuaSprite('clouds1', false)
			
			setProperty('fore.acceleration.x', -2400 / playbackRate)
			makeLuaSprite('fore1', 'FOREGROUND', getProperty('fore.x') + 4200, getProperty('fore.y'))
			setScrollFactor('fore1', 1.1, 1.1)
			scaleObject('fore1', 1.1, 1.1)
			setProperty('fore1.velocity.x', -2400 * playbackRate)
			setObjectOrder('fore1', getObjectOrder('fore'))
			addLuaSprite('fore1', true)
			
			setProperty('bgshit.acceleration.x', -600 / playbackRate)
			makeLuaSprite('bgshit1', bgShit[2], getProperty('bgshit.x') + 5000, bgShitY[2])
			setScrollFactor('bgshit1', 0.9, 0.9)
			scaleObject('bgshit1', 1.2, 1.2)
			setProperty('bgshit1.velocity.x', -500 * playbackRate)
			setObjectOrder('bgshit1', getObjectOrder('bgshit'))
			setProperty('bgshit1.visible', false) --lol!!!
			addLuaSprite('bgshit1', false)
		end
		
		for i = 1,5 do
			generateShit()
		end
			runTimer('generateShitTimer', 0.8 / playbackRate, 0)
		end
	end
	if curBeat == 360 then
		inCutscene = true
		doTweenX('cameraTweenX3', getProperty('camFollow'), 26000, 2 / playbackRate, 'quadIn')
		doTweenY('cameraTweenY3', getProperty('camFollow'), -2000, 2 / playbackRate, 'quadIn')
		
	end
	if curBeat == 362 then
		for i = 1,shitGenerated do
			setProperty('clouds'..i..'.velocity.x', 0)
			setProperty('mount'..i..'.velocity.x', 0)
			setProperty('city'..i..'.velocity.x', 0)
			setProperty('fore'..i..'.velocity.x', 0)
			setProperty('bgshit'..i..'.velocity.x', 0)
			setProperty('bf'..i..'.velocity.x', 0)
			setProperty('floor'..i..'.velocity.x', 0)
		end
	end
	if curBeat == 372 then
		playAnim('tower', 'anim', true)
	end
	if curBeat == 374 then
		doTweenX('cameraTweenX4', getProperty('camFollow'), 25700, 0.6 / playbackRate, 'quadIn')
		doTweenY('cameraTweenY4', getProperty('camFollow'), getProperty('dad.y') + 200, 0.6 / playbackRate, 'quadIn')
	end
	if curBeat == 376 then
		setProperty('tank.x', getProperty('tower.x') - 200)
		setProperty('tankBad.x', getProperty('tank.x') - 2500)
		setProperty('towerStand.velocity.x', -2000 * playbackRate)
		setProperty('tank.velocity.x', 2400 * playbackRate)
		setProperty('tankBad.velocity.x', 2400 * playbackRate)
		setProperty('tank.acceleration.x', -600)
		setProperty('tankBad.acceleration.x', -600)
		playAnim('towerStand', 'anim')
		for i = 1,shitGenerated do
			setProperty('clouds'..i..'.velocity.x', -50 * playbackRate)
			setProperty('mount'..i..'.velocity.x', -100 * playbackRate)
			setProperty('city'..i..'.velocity.x', -200 * playbackRate)
			setProperty('fore'..i..'.velocity.x', -2400 * playbackRate)
			setProperty('bgshit'..i..'.velocity.x', -500 * playbackRate)
			setProperty('bf'..i..'.velocity.x', -500 * playbackRate)
			setProperty('floor'..i..'.velocity.x', -2000 * playbackRate)
		end
		inCutscene = false
		removeLuaSprite('tower', true)
	end
	if curBeat == 388 then
		triggerEvent('Camera Follow Pos')
	end
	if curBeat == 540 then
		inCutscene = true
		setProperty('cameraSpeed', 2)
		for i = 1,shitGenerated do
			setProperty('clouds'..i..'.velocity.x', 0)
			setProperty('mount'..i..'.velocity.x', 0)
			setProperty('city'..i..'.velocity.x', 0)
			setProperty('fore'..i..'.velocity.x', 0)
			setProperty('bgshit'..i..'.velocity.x', 0)
			setProperty('bf'..i..'.velocity.x', 0)
			setProperty('floor'..i..'.velocity.x', 0)
		end
		endingCutscene = true
		setProperty('cutsceneTank.alpha', 1)
		setProperty('cutsceneTank.x', getProperty('tank.x') - 1000)
		setProperty('cutsceneTank.y', getProperty('tank.y') - 590)
		setProperty('tank.alpha', 0)
		setProperty('steve.alpha', 0)
		setProperty('boyfriend.alpha', 0)
		playAnim('cutsceneTank', 'turn', true)
		doTweenX('tankDriftX', 'cutsceneTank', getProperty('tank.x') + 2000, 1.4 / playbackRate, 'quadOut')
		doTweenAlpha('hudEndingFade', 'camHUD', 0, 1 / playbackRate, 'quadIn')
	end
	if curBeat == 545 then
		setProperty('cameraSpeed', 3)
		setProperty('tankBad.velocity.x', 400 * playbackRate)
		setProperty('tankBad.acceleration.x', -200)
		followTank = false
	end
	if curBeat == 546 then
		playAnim('sg', 'WOW', true)
		setProperty('sg.x', getProperty('sg.x') - 493)
		setProperty('sg.y', getProperty('sg.y') - 512) -- offsets
	end
	if curBeat == 551 then
		endingCutscene = false
		playAnim('cutsceneTank', 'line', true)
		doTweenX('cameraTweenX6', getProperty('camFollow'), getProperty('cutsceneTank.x') + 1600, 1 / playbackRate, 'quadInOut')
		doTweenY('cameraTweenY6', getProperty('camFollow'), getProperty('cutsceneTank.y') + 540, 1 / playbackRate, 'quadInOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'cameraTweenX' then
		triggerEvent('Camera Follow Pos', '3100', '600')
	end
	if tag == 'cameraTweenY2' then
		triggerEvent('Camera Follow Pos')
		--optimization?
		removeLuaSprite('lady', true)
		removeLuaSprite('store', true)
		removeLuaSprite('people', true)
		removeLuaSprite('floor', true)
		removeLuaSprite('bf', true)
		runTimer('removeOtherBG', 15 / playbackRate, 1)
		
	end
	if tag == 'cameraTweenX3' then
		triggerEvent('Camera Follow Pos', '26000', '-2000')
	end
end

function onTimerCompleted(tag)
	if tag == 'generateShitTimer' then
		generateShit()
	end
	if tag == 'removeOtherBG' then
		removeLuaSprite('mount', true)
	end
end

function generateShit() --haha shitty ass code
	if not inCutscene then
	shitGenerated = shitGenerated + 1
	
	if not lowQuality then
		makeLuaSprite('clouds'..shitGenerated, 'CLOUDS', getProperty('clouds'..shitGenerated - 1 ..'.x') + 4200, getProperty('clouds'..shitGenerated - 1 ..'.y'))
		setScrollFactor('clouds'..shitGenerated, 0.1, 0.1)
		scaleObject('clouds'..shitGenerated, 1.4, 1.4)
		setProperty('clouds'..shitGenerated..'.velocity.x', -50 * playbackRate)
		setObjectOrder('clouds'..shitGenerated, getObjectOrder('clouds'..shitGenerated - 1))
		addLuaSprite('clouds'..shitGenerated, false)
			
		makeLuaSprite('mount'..shitGenerated, 'MOUNTAINS', getProperty('mount'..shitGenerated - 1 ..'.x') + 4200, getProperty('mount'..shitGenerated - 1 ..'.y'))
		setScrollFactor('mount'..shitGenerated, 0.2, 0.2)
		scaleObject('mount'..shitGenerated, 1.4, 1.4)
		setProperty('mount'..shitGenerated..'.velocity.x', -100 * playbackRate)
		setObjectOrder('mount'..shitGenerated, getObjectOrder('mount'..shitGenerated - 1))
		addLuaSprite('mount'..shitGenerated, false)
			
		makeLuaSprite('city'..shitGenerated, 'CITY', getProperty('city'..shitGenerated - 1 ..'.x') + 4790, getProperty('city'..shitGenerated - 1 ..'.y'))
		setScrollFactor('city'..shitGenerated, 0.3, 0.3)
		scaleObject('city'..shitGenerated, 1.6, 1.6)
		setProperty('city'..shitGenerated..'.velocity.x', -200 * playbackRate)
		setObjectOrder('city'..shitGenerated, getObjectOrder('city'..shitGenerated - 1))
		addLuaSprite('city'..shitGenerated, false)
		
		makeLuaSprite('fore'..shitGenerated, 'FOREGROUND', getProperty('fore'..shitGenerated - 1 ..'.x') + 4200, getProperty('fore'..shitGenerated - 1 ..'.y'))
		setScrollFactor('fore'..shitGenerated, 1.1, 1.1)
		scaleObject('fore'..shitGenerated, 1.1, 1.1)
		setProperty('fore'..shitGenerated..'.velocity.x', -2400 * playbackRate)
		setObjectOrder('fore'..shitGenerated, getObjectOrder('fore'..shitGenerated - 1))
		addLuaSprite('fore'..shitGenerated, true)
		local randomInt = 0
			randomInt = getRandomInt(1,3)
			makeLuaSprite('bgshit'..shitGenerated, bgShit[randomInt], getProperty('bgshit'..shitGenerated - 1 ..'.x') + 4400, bgShitY[randomInt])
			setScrollFactor('bgshit'..shitGenerated, 0.9, 0.9)
			scaleObject('bgshit'..shitGenerated, 1.2, 1.2)
			setProperty('bgshit'..shitGenerated..'.velocity.x', -500 * playbackRate)
			setObjectOrder('bgshit'..shitGenerated, getObjectOrder('bgshit'..shitGenerated - 1))
			addLuaSprite('bgshit'..shitGenerated, false)
	end
	
	makeLuaSprite('bf'..shitGenerated, 'BATTLEFIELD', getProperty('bf'..shitGenerated - 1 ..'.x') + 4400, getProperty('bf'..shitGenerated - 1 ..'.y'))
	setScrollFactor('bf'..shitGenerated, 0.9, 0.9)
	scaleObject('bf'..shitGenerated, 1.2, 1.2)
	setProperty('bf'..shitGenerated..'.velocity.x', -500 * playbackRate)
	setObjectOrder('bf'..shitGenerated, getObjectOrder('bf'..shitGenerated - 1))
	addLuaSprite('bf'..shitGenerated, false)
	
	makeLuaSprite('floor'..shitGenerated, 'FLOOR', getProperty('floor'..shitGenerated - 1 ..'.x') + 5200, getProperty('floor'..shitGenerated - 1 ..'.y'))
	setScrollFactor('floor'..shitGenerated, 0.9, 0.9)
	scaleObject('floor'..shitGenerated, 1.5, 1.5)
	setProperty('floor'..shitGenerated..'.velocity.x', -2000 * playbackRate)
	setObjectOrder('floor'..shitGenerated, getObjectOrder('floor'..shitGenerated - 1))
	addLuaSprite('floor'..shitGenerated, false)
	end
end