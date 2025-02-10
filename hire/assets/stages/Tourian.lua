function onCreate()
	-- background shit

	makeLuaSprite('bg1', 'mbrainstage/motherbg1', -1100, -520)
	scaleObject('bg1', 14, 14)
	setProperty('bg1.antialiasing',false)

	makeLuaSprite('bg2', 'mbrainstage/motherbg2', -1100, -520)
	scaleObject('bg2', 17, 17)
	setProperty('bg2.antialiasing',false)

	makeLuaSprite('bedback', 'mbrainstage/bedback', 410, -50)
	makeLuaSprite('bedfront', 'mbrainstage/bedfront', 410, -50)

	makeLuaSprite('blackscreen', 'mbrainstage/bedback', 0, 0)
	makeGraphic('blackscreen', 1280, 720, '000000')
	setObjectCamera('blackscreen', 'hud')
	setProperty('blackscreen.alpha', 1)

	makeLuaSprite('multiplyy', 'mbrainstage/bedback', 0, 0)
	makeGraphic('multiplyy', 1280, 720, 'c02ad1')
	setBlendMode('multiplyy', 'multiply')
	setObjectCamera('multiplyy', 'hud')
	setProperty('multiplyy.alpha', 0.6)


	addLuaSprite('bg1', false)
	addLuaSprite('blackscreen', true)
	addLuaSprite('multiplyy', true)



end

function onStepHit()

	if curStep == 7 then
		doTweenAlpha('wowww', 'blackscreen', 0, 10, 'linear')
	end

	if curStep == 120 then
		doTweenAlpha('got dman', 'multiplyy', 0, 1, 'linear')
	end

	if curStep == 464 then
	triggerEvent('Change Character', 'gf', 'soniqua')
	removeLuaSprite('bg1', true)
	addLuaSprite('bg2', false)
	addLuaSprite('bedback', false)
	addLuaSprite('bedfront', true)
	setProperty('boyfriend.y', 390)
	setProperty('boyfriend.x', 1900)
	scaleObject('dad', 0.7, 0.7)
	setProperty('dad.y', -180)
	setProperty('dad.x', 550)
	setProperty('gf.x', 2200)
	setProperty('gf.y', 500)
	end

	if curStep == 632 then
	doTweenAlpha('holyyyy peak', 'multiplyy', 0.5, 2, 'linear')
	end
end