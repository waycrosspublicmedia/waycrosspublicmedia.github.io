local originyCL = 0
local originyFC = 0
local originyHS = 0
--woodstock origin y
local originyWS = 0

--snoopy origin y
local originySP = 0
--bf origin y
local originyBF = 0

function onCreate()

	makeAnimatedLuaSprite('theGoat', 'backyard/woodstock the goat', 400, 200);
	addAnimationByPrefix('theGoat','bird flying','woodwtock flying',24,false);
	setLuaSpriteScrollFactor('theGoat', 1.0, 1.0);
	addLuaSprite('theGoat', true);
	setProperty('theGoat.alpha', 0.0001)

-- cool cenimatic aspect ratio/black bars
	makeLuaSprite('bartop','',-200,-30)
	makeGraphic('bartop',2000,100,'000000')
	addLuaSprite('bartop',false)
    setScrollFactor('bartop',0,0)
    setObjectCamera('bartop','hud')

    makeLuaSprite('barbot','',-200,650)
	makeGraphic('barbot',2000,100,'000000')
	addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

	addLuaScript('Gameover')

end

function onBeatHit()
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        characterPlayAnim('dad','idle', true)
    end

	if curBeat == 1 then

	end

end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end

end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

end

function onStepHit()
	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.018*camInt,0.03*camInt)
	end
end

function onCreatePost()

--snoopy animated icon shit
	makeAnimatedLuaSprite('dadIcon', 'icons/icon-snoopy', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('dadIcon', 'idle', 'snoopy healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('dadIcon', 'losing', 'snoopy hurt icon', 24, true)
	setObjectCamera('dadIcon', 'hud')
	addLuaSprite('dadIcon', true)
	setObjectOrder('dadIcon', getObjectOrder('iconP2') + 1)
	setProperty('iconP2.visible', false)
	objectPlayAnimation('dadIcon', 'idle', true)
end

function onUpdate()

--snoopy icon shit
	setPropertyLuaSprite('dadIcon', 'flipX', true);
	setProperty('dadIcon.x', getProperty('iconP2.x') + 15)
	setProperty('dadIcon.y', getProperty('iconP2.y') + 30)
	setProperty('dadIcon.angle', getProperty('iconP2.angle'))
	scaleObject('dadIcon', getProperty('iconP2.scale.x'), getProperty('iconP2.scale.y'))
	if getProperty('healthBar.percent') > 80 then
		if getProperty('dadIcon.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('dadIcon', 'losing', true)
		end
	else
		if getProperty('dadIcon.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('dadIcon', 'idle', true)
		end
	end
end
