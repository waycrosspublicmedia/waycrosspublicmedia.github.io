function onCreate()

    setProperty('skipCountdown', true)

    -- cool cenimatic aspect ratio/black bars
	makeLuaSprite('bartop','',-200,-30)
	makeGraphic('bartop',2000,100,'000000')
	addLuaSprite('bartop',false)
    setScrollFactor('bartop',0,0)
    setObjectCamera('bartop','hud')

    makeLuaSprite('barbot','',-200,660)
	makeGraphic('barbot',2000,100,'000000')
	addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

end

local angleshit = 0.1;
local anglevar = 0.1;

function onBeatHit()

    if curBeat == 4 then
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)
    end

    --breakdown at beat 72
    if curBeat > 71 then

        if curBeat < 88 then
            triggerEvent('Add Camera Zoom', 0.06,0.05)
    
            if curBeat % 2 == 0 then
                angleshit = anglevar;
            else
                angleshit = -anglevar;
            end
            setProperty('camHUD.angle',angleshit*20)
            setProperty('camGame.angle',angleshit*10)
            doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.007, 'quintOut')
            doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.007, 'quintOut')
        else
            setProperty('camHUD.angle',0)
            setProperty('camHUD.x',0)
            setProperty('camHUD.x',0)
        end

    end


    if curBeat > 288 then

        if curBeat < 352 then
            triggerEvent('Add Camera Zoom', 0.09,0.07)
    
            if curBeat % 2 == 0 then
                angleshit = anglevar;
            else
                angleshit = -anglevar;
            end
            setProperty('camHUD.angle',angleshit*20)
            setProperty('camGame.angle',angleshit*10)
            doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.007, 'quintOut')
            doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.007, 'quintOut')
        else
            setProperty('camHUD.angle',0)
            setProperty('camHUD.x',0)
            setProperty('camHUD.x',0)
        end

    end

end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end
end

function onStepHit()
	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.04*camInt,0.03*camInt)
	end
end

function onCreatePost()
    setProperty('camGame.alpha', 0.0001)
    setProperty('camHUD.alpha',0.0001)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)

end

spacePress = 1

function onUpdate()



end


