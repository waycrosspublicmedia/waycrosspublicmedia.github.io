
function onCreate()	

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

	setProperty('skipCountdown', true)
end

function onBeatHit()
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        characterPlayAnim('dad','idle', true)
    end

	-- "thaaank you"
	if curBeat == 2 then
		setProperty('camGame.alpha', 1)
	end

	if curBeat == 4 then
		zoomChars = true
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

	zoomChars = false

	setProperty('camGame.alpha', 0.0001)
end

function onUpdate()

	if zoomChars == true then

		if mustHitSection == false then
			setProperty('defaultCamZoom',0.8)
		else
			setProperty('defaultCamZoom',0.9)
		end
	end
end