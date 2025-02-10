function onCreatePost()

	makeLuaSprite('KSIBG', 'KSIBackground', -200, -300)
	addLuaSprite('KSIBG', false)

	makeLuaSprite('IceBackground', 'IceBackground', -360, -130)
	addLuaSprite('IceBackground', false)
	setProperty('IceBackground.alpha', 0)
	scaleObject('IceBackground', 1.1, 1.1)

	makeLuaSprite('IceThrone', 'IceThrone', -351, -80)
	addLuaSprite('IceThrone', false)
	setProperty('IceThrone.alpha', 0)

	makeLuaSprite('SpeedPhone', 'SpeedPhone', 4, -188)
	scaleObject('SpeedPhone', 0.525, 0.525)
	addLuaSprite('SpeedPhone', false)
	setObjectOrder('SpeedPhone', getObjectOrder('boyfriend') + 6)
	setProperty('SpeedPhone.alpha', 0)

	makeLuaSprite('BlackBarThingyLeft', 'BlackBarThingyLeft', 0, 0)
    makeGraphic('BlackBarThingyLeft', 475, 720, '000000')
	setScrollFactor('BlackBarThingyLeft', 0, 0)
	addLuaSprite('BlackBarThingyLeft', true)
	setObjectCamera('BlackBarThingyLeft', 'game')
	setObjectOrder('BlackBarThingyLeft', getObjectOrder('boyfriend') + 7)

	makeLuaSprite('BlackBarThingyRight', 'BlackBarThingyRight', 1280 - 475, 0)
    makeGraphic('BlackBarThingyRight', 475, 720, '000000')
	setScrollFactor('BlackBarThingyRight', 0, 0)
	addLuaSprite('BlackBarThingyRight', true)
	setObjectCamera('BlackBarThingyRight', 'game')
	setObjectOrder('BlackBarThingyRight', getObjectOrder('boyfriend') + 7)

	makeLuaSprite('Snow1', 'Snow1', 0, -720)
	addLuaSprite('Snow1', false)
	setProperty('Snow1.alpha', 0)
	setObjectCamera('Snow1', 'hud')
	setBlendMode('Snow1', 'add')

	makeLuaSprite('Snow2', 'Snow2', 0, -720)
	addLuaSprite('Snow2', false)
	setProperty('Snow2.alpha', 0)
	setObjectCamera('Snow2', 'hud')
	setBlendMode('Snow2', 'add')

	makeLuaSprite('Snow3', 'Snow3', 0, -720)
	addLuaSprite('Snow3', false)
	setProperty('Snow3.alpha', 0)
	setObjectCamera('Snow3', 'hud')
	setBlendMode('Snow3', 'add')

	makeLuaSprite('ColdScreen', 'ColdScreen', -1280, -720)
    makeGraphic('ColdScreen', 3840, 2160, '55bbed')
	setScrollFactor('ColdScreen', 0, 0)
	addLuaSprite('ColdScreen', true)
	setObjectCamera('ColdScreen', 'other')
	setBlendMode('ColdScreen', 'multiply')
	setProperty('ColdScreen.alpha', 0)

	makeLuaSprite('YT', 'YT', 65, 46)
	scaleObject('YT', 1, 1)
	addLuaSprite('YT', false)
	scaleObject('YT', 0.5, 0.5)
	setObjectCamera('YT', 'hud')

	makeLuaText('ViewersScore', '0', 1000, 115, 43)
	addLuaText('ViewersScore')
	setTextSize('ViewersScore', 34)
	setTextAlignment('ViewersScore', 'left')

	makeLuaSprite('RedishOrangishThingish', 'RedishOrangishThingish', -1280, -720)
    makeGraphic('RedishOrangishThingish', 3840, 2160, 'fc290d')
	setScrollFactor('RedishOrangishThingish', 0, 0)
	addLuaSprite('RedishOrangishThingish', true)
	setObjectCamera('RedishOrangishThingish', 'other')
	setBlendMode('RedishOrangishThingish', 'add')
	setProperty('RedishOrangishThingish.alpha', 0)

	for i = 0,3 do
		setPropertyFromGroup('opponentStrums', i, 'x', -1000)
	end

end

function onStartCountdown()
	
end

function onUpdate()

	if curBeat == 64 then

		doTweenAlpha('SpeedPhoneAppear', 'SpeedPhone', 1, 0.15, 'linear')
		doTweenAlpha('KSIIconDisappear', 'iconP2', 0, 0.15, 'linear')

	end

	if curBeat == 96 then

		cameraFlash('other', '000000', 2, false)
		setProperty('iconP2.alpha', 1)
		setProperty('IceBackground.alpha', 1)
		setProperty('ColdScreen.alpha', 0.45)
		setProperty('Snow1.alpha', 0.6)
		setProperty('Snow2.alpha', 0.55)
		setProperty('Snow3.alpha', 0.5)
		setProperty('IceThrone.alpha', 1)
		setProperty('boyfriend.alpha', 0)
		setProperty('KSIBG.alpha', 0)
		setProperty('SpeedPhone.alpha', 0)
		setProperty('BlackBarThingyLeft.alpha', 0)
		setProperty('BlackBarThingyRight.alpha', 0)

		doTweenY('Snow1Move', 'Snow1', 0, 2, 'linear')
		doTweenY('Snow2Move', 'Snow2', 0, 3, 'linear')
		doTweenY('Snow3Move', 'Snow3', 0, 4.5, 'linear')

	end

	if curBeat == 224 then
		cameraFlash('other', '000000', 0.8, false)
		setProperty('IceBackground.alpha', 0)
		setProperty('IceThrone.alpha', 0)
		setProperty('ColdScreen.alpha', 0)
		setProperty('Snow1.alpha', 0)
		setProperty('Snow2.alpha', 0)
		setProperty('Snow3.alpha', 0)
		setProperty('boyfriend.alpha', 1)
		setProperty('KSIBG.alpha', 1)
		setProperty('BlackBarThingyLeft.alpha', 1)
		setProperty('BlackBarThingyRight.alpha', 1)
		
		cancelTween('Snow1Move')
		cancelTween('Snow2Move')
		cancelTween('Snow3Move')
	end

	if curBeat == 260 then
		doTweenAlpha('SaturationThing', 'RedishOrangishThingish', 0.8, 11, 'linear')
	end

	if curStep == 1113 then
		cameraFade('hud', '000000', 1.2, false)
		doTweenAlpha('SaturationThingDie', 'RedishOrangishThingish', 0, 1.2, 'linear')
	end

end

function onRecalculateRating()

	setTextString('ViewersScore', score)

end

function onTweenCompleted(tag)

	if tag == 'Snow1Move' then
		setProperty('Snow1.y', -720)
		doTweenY('Snow1Move', 'Snow1', 0, 2, 'linear')
	end

	if tag == 'Snow2Move' then
		setProperty('Snow2.y', -720)
		doTweenY('Snow2Move', 'Snow2', 0, 3, 'linear')
	end

	if tag == 'Snow3Move' then
		setProperty('Snow3.y', -720)
		doTweenY('Snow3Move', 'Snow3', 0, 4.5, 'linear')
	end

end