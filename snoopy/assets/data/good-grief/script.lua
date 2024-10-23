cameraZoomAllow = true;
originxDAD = 0;

function onCreate()
    makeLuaSprite('blackBG','',-1000,-900)
	makeGraphic('blackBG',4000,4000,'000000')
	addLuaSprite('blackBG',false)
    setProperty('blackBG.alpha', 0.0001)

	makeLuaSprite('blackFG','',-1000,-900)
	makeGraphic('blackFG',4000,4000,'000000')
	addLuaSprite('blackFG',true)
    setProperty('blackFG.alpha', 0.0001)

	makeLuaSprite('whiteFG','',-1000,-900)
	makeGraphic('whiteFG',4000,4000,'ffffff')
	addLuaSprite('whiteFG',true)
    setProperty('whiteFG.alpha', 0.0001)

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('vintageScreen','vintage thing',0, 0)
    	addLuaSprite('vintageScreen',true)
		scaleObject('vintageScreen', 0.7, 0.7)
		setObjectCamera('vintageScreen','hud')
		setProperty('vintageScreen.alpha', 0.0001)
	end

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

--prechaching images
    precacheImage('theImpFrame');
    precacheImage('theImpFrameFB');

	addLuaScript('Gameover')

	originxDAD = getProperty('dad.x')
	setProperty('dad.alpha', 0.00001)
end

function onBeatHit()

--peeps bopping to the beat
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        characterPlayAnim('boyfriend','idle', true)
    end

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        characterPlayAnim('dad','idle', true)
    end

	if getProperty('gf.animation.curAnim.name') == 'idle' then
        characterPlayAnim('gf','idle', true)
    end

-- curbeat shit
    if curBeat == 1 then
        doTweenZoom('screenZoom', 'camGame', 0.73, 1.12, 'quintIn');
    end

    if curBeat == 4 then
        setProperty('defaultCamZoom', 0.8)
    end

    if curBeat == 6 then
		cameraZoomAllow = false
        doTweenZoom('screenZoom', 'camGame', 1.0, 11.25, 'linear');
        doTweenAlpha('blackBGAlphaTween', 'blackBG', 0.7, 13.50, 'linear');

		if not lowQuality then
			doTweenAlpha('vintageAlphaTween', 'vintageScreen', 1.0, 13.50, 'linear');
		end
    end

    if curBeat == 36 then
        setProperty('defaultCamZoom', 0.9)
    end

    if curBeat == 40 then
		cameraZoomAllow = true
        setProperty('defaultCamZoom', 0.8)
        doTweenAlpha('blackBGAlphaTween', 'blackBG', 0.0001, 1.0, 'linear');

		if not lowQuality then
			doTweenAlpha('vintageAlphaTween', 'vintageScreen', 0.0001, 1.0, 'linear');
		end
    end

	if curBeat == 100 then
		setProperty('defaultCamZoom', 1.0)
	end

	if curBeat == 103 then
		doTweenZoom('screenZoom', 'camGame', 1.2, 0.37, 'quintIn');
	end

	if curBeat == 104 then
		setProperty('defaultCamZoom', 0.9)
	end
-- Cinematic thing
	if curBeat == 168 then
		setProperty('whiteFG.alpha', 1)
		setProperty('blackFG.alpha', 1)
		doTweenAlpha('whiteFGAlphaTween', 'whiteFG', 0.0001, 1.0, 'linear');
		--doTweenZoom('screenZoom', 'camGame', 1.1, 2.62, 'linear');
	end

-- Star platinum snoopy ingame
    if curBeat == 174 then
        setProperty('dad.alpha', 1.0)
		setProperty('dad.x', originxDAD-400)
		setProperty('defaultCamZoom', 0.75)
    end

-- black screen disappears and the big drop
    if curBeat == 175 then
        setProperty('blackFG.alpha', 0.0001)
		doTweenX('dadSlideIn', 'dad', originxDAD, 0.6, 'quintOut');
		doTweenX('move1','camGame.scroll', -300, 0.65,'quadOut')
    end

	if curBeat == 176 then
		setProperty('defaultCamZoom', 1.0)
    end

	if curBeat == 208 then
		setProperty('defaultCamZoom', 0.8)
    end

--"oooooohh aaaa eee a  eeeeee ah aaaaaaaaaaaaaaaaah"
	if curBeat == 244 then
		cameraZoomAllow = false
		doTweenZoom('screenZoom', 'camGame', 0.7, 10.5, 'linear');
    end

	if curBeat == 272 then
		cameraZoomAllow = true
		setProperty('defaultCamZoom', 0.7)
    end

	if curBeat == 276 then
		setProperty('defaultCamZoom', 0.8)
    end

	if curBeat == 372 then
		setProperty('defaultCamZoom', 0.85)
	end

	if curBeat == 388 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curBeat == 402 then
		doTweenZoom('screenZoom', 'camGame', 1.0, 0.75, 'quintIn');
	end
	
	if curBeat == 404 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curBeat == 435 then
		doTweenZoom('screenZoom', 'camGame', 1.0, 0.37, 'quintIn');
	end
	if curBeat == 436 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curBeat == 452 then
		doTweenZoom('screenZoom', 'camGame', 0.65, 6.0, 'quadInOut');
		doTweenX('move2','camGame.scroll', 0, 6.0,'quadOut')
		doTweenY('move3','camGame.scroll', 150, 6.0,'quadOut')
		--triggerEvent('Camera Follow Pos','900','500')
	end

	if curBeat == 468 then
		triggerEvent('Camera Follow Pos','','')
	end

	if curBeat == 484 then
		setProperty('camGame.visible', false)
    end
end

function onStepHit()
	if curStep % camSpeed == 0 then
		triggerEvent('Add Camera Zoom',0.02*camInt,0.05*camInt)
	end

--curstep shit "keep stepin at cha-"

--snoopy BOOM BOOM BOOM
	if curStep == 1152 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curStep == 1158 then
		setProperty('defaultCamZoom', 1.0)
	end

	if curStep == 1164 then
		setProperty('defaultCamZoom', 1.1)
	end
--cam reset
	if curStep == 1168 then
		setProperty('defaultCamZoom', 0.8)
	end

--BF BOOM BOOM BOOM
	if curStep == 1216 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curStep == 1222 then
		setProperty('defaultCamZoom', 1.0)
	end

	if curStep == 1228 then
		setProperty('defaultCamZoom', 1.1)
	end
--cam reset
	if curStep == 1232 then
		setProperty('defaultCamZoom', 0.8)
	end
end

local  u = 0

snoopyAirBorne = false;
function opponentNoteHit(id, noteData, noteType, isSustainNote)

	if getProperty('health') > 0.1 then
		setProperty('health',getProperty('health')-0.015)
	end

end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end
end

function onCreatePost()
	--setProperty('dad.visible', false)
	
--bf animated icon shit
	makeAnimatedLuaSprite('bfIcon', 'icons/icon-bf-peanuts', getProperty('iconP1.x'), getProperty('iconP1.y'))
	luaSpriteAddAnimationByPrefix('bfIcon', 'idle', 'BF p healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('bfIcon', 'losing', 'BF p hurt icon', 24, true)
	setObjectCamera('bfIcon', 'hud')
	addLuaSprite('bfIcon', true)
	setObjectOrder('bfIcon', getObjectOrder('iconP1') + 1)
	setProperty('iconP1.visible', false)
	objectPlayAnimation('bfIcon', 'idle', true)

--jojo charlie brown animated icon shit
	makeAnimatedLuaSprite('dadIcon', 'icons/icon-jojo-charlie', getProperty('iconP2.x'), getProperty('iconP2.y'))
	luaSpriteAddAnimationByPrefix('dadIcon', 'idle', 'JBrown healthy icon', 24, true)
	luaSpriteAddAnimationByPrefix('dadIcon', 'losing', 'JBrown hurt icon', 24, true)
	setObjectCamera('dadIcon', 'hud')
	addLuaSprite('dadIcon', true)
	setObjectOrder('dadIcon', getObjectOrder('iconP2') + 1)
	setProperty('iconP2.visible', false)
	objectPlayAnimation('dadIcon', 'idle', true)
end

function onUpdate()
	if cameraZoomAllow == false then
		setProperty('camZooming', false)
	else
		setProperty('camZooming', true)
	end
--bf icon shit
	setProperty('bfIcon.x', getProperty('iconP1.x') + 15)
	setProperty('bfIcon.y', getProperty('iconP1.y') - 10)
	setProperty('bfIcon.angle', getProperty('iconP1.angle'))
	scaleObject('bfIcon', getProperty('iconP1.scale.x'), getProperty('iconP1.scale.y'))
	if getProperty('healthBar.percent') < 20 then
		if getProperty('bfIcon.animation.curAnim.name') ~= 'losing' then
			objectPlayAnimation('bfIcon', 'losing', true)
		end
	else
		if getProperty('bfIcon.animation.curAnim.name') ~= 'idle' then
			objectPlayAnimation('bfIcon', 'idle', true)
		end
	end

--snoopy icon shit
	setPropertyLuaSprite('dadIcon', 'flipX', true);
	setProperty('dadIcon.x', getProperty('iconP2.x') + 1)
	setProperty('dadIcon.y', getProperty('iconP2.y') - 7)
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



