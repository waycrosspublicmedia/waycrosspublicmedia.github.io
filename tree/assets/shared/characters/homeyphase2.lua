local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
duration = 0
enableDadAnim = false
function onCreatePost()
    enableDadAnim = false
    daDAD = getProperty('dad.curCharacter')
    --if daDAD == 'dad' or daDAD == 'dad' or daDAD == 'dad' or daDAD == 'dad' then --UNCOMMIT TO ADD WHITELIST
    makeAnimatedLuaSprite('humer', 'icons/humercrazyicons', getProperty('iconP2.x'), getProperty('iconP2.y'))

    addAnimationByPrefix('humer', 'idle', 'idle', 1, true)
    addAnimationByPrefix('humer', 'up', 'up', 1, true)
	addAnimationByPrefix('humer', 'right', 'right', 1, true)
    addAnimationByPrefix('humer', 'down', 'down', 1, true)
    addAnimationByPrefix('humer', 'left', 'left', 1, true)

    addLuaSprite('humer', true)
    setObjectCamera('humer', 'camHUD')
    setObjectOrder('humer', getObjectOrder('iconP2'))
    setProperty('humer.alpha', 0)
    setProperty('humer.flipX', true)

    enableDadAnim = true

    duration = getPropertyFromClass('Conductor', 'stepCrochet') * 2 / 1100
end


function onUpdate()
    if dadName == 'homeyphase2'then
        if enableDadAnim then
            setProperty('iconP2.visible',false)
            setProperty('humer.x', getProperty('iconP2.x'))
            setProperty('humer.y', getProperty('iconP2.y'))
            setProperty('humer.alpha', getProperty('iconP2.alpha'))
            setProperty('humer.angle', getProperty('iconP2.angle'))
            scaleObject('humer', 1, 1)
            
        end
    end
end

function onStepHit()
    if curStep == 1024 then
        setProperty('iconP2.visible',true)
        setProperty('humer.visible', false)

    end
end

function opponentNoteHit(id, direction, noteType)
    if direction == 0 then
        objectPlayAnimation('humer','left',true);
	end
    if direction == 1 then
        objectPlayAnimation('humer','down',true);
	end
    if direction == 2 then
        objectPlayAnimation('humer','up',true);
	end
    if direction == 3 then
        objectPlayAnimation('humer','right',true);
    end
end

function onBeatHit()
    if dadName == 'homeyphase2'then
        if enableDadAnim then
        objectPlayAnimation('humer','idle',true);
        end
	end
end

function onUpdatePost()
	local angleOfs = math.random(-5, 5)
	local posXOfs = math.random(-8, 8)
	local posYOfs = math.random(-4, 4)
	if getProperty('healthBar.percent') > 0 and dadName == 'homeyphase2' then
		setProperty('humer.angle', angleOfs)
		setProperty('humer.x', getProperty('humer.x') + posXOfs)
		setProperty('humer.y', defaultY + posYOfs)
	end
end
