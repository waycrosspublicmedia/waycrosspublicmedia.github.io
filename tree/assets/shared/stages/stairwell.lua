local modchart = true

function onCreate()

	setProperty('introSoundsSuffix', '-shine')

	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Shinning_Over');

	setProperty('countdownSprite.camera', 'other')

	setProperty('cameraSpeed', 2.8);

	makeLuaSprite('thestairs', 'stairwell', -400, 00);
	addLuaSprite('thestairs', false)

	makeLuaSprite('povreal', 'GoCrazyPOV', 960, 500);
	addLuaSprite('povreal', false)
	scaleObject('povreal', 1.4, 1.4);
	setProperty('povreal.visible', false)

	makeLuaSprite('shader', 'shadr', 0, 0)
    setObjectCamera('shader', 'HUD')
    addLuaSprite('shader', true)
    setProperty('shader.alpha', 0.6)

	makeLuaSprite('shadowfocus', 'vignette', 0, 0)
    setObjectCamera('shadowfocus', 'HUD')
    setProperty('shadowfocus.visible', true)
    addLuaSprite('shadowfocus', true)
    setProperty('shadowfocus.alpha', 0.8)

    makeLuaSprite('nothing', 'blackBox', 00, 00);
    setObjectCamera('nothing', 'other')
	addLuaSprite('nothing', true);
	scaleObject('nothing', 12.0, 12.0);
	screenCenter('nothing', 'xy')

	makeLuaSprite('nothing2', 'blackBox', -400, 00);
    setObjectCamera('nothing2', 'camgame')
	addLuaSprite('nothing2', true);
	scaleObject('nothing2', 20.0, 20.0);
	setProperty('nothing2.alpha', 0)

end

function onStepHit()
	if curStep == 1 then
		doTweenAlpha('nothingtween', 'nothing', 0.1, 3.0, 'linear');
    end
	if curStep == 128 then
		doTweenAlpha('gonetween', 'shadowfocus', 0.3, 0.3, 'linear');
    end
	if curStep == 135 then
		doTweenAlpha('gonetween', 'shadowfocus', 0.7, 0.2, 'linear');
    end
	if curStep == 160 then
		doTweenAlpha('gonetween', 'shadowfocus', 0.3, 0.3, 'linear');
    end
	if curStep == 167 then
		doTweenAlpha('gonetween', 'shadowfocus', 0.7, 0.2, 'linear');
    end
	if curStep == 360 then
		doTweenAlpha('backagain', 'nothing2', 1, 0.5, 'linear');
		doTweenAlpha('sh', 'shader', 0, 0.5, 'linear');
	end
	if curStep == 368 then
		setProperty('HERES.alpha', 0.7)
		makeLuaText('HERES', 'HERE´S...', 0, 0)
		setObjectCamera('HERES', 'camGame')
		setTextSize('HERES', 90)
		setProperty('HERES.visible', true)
		screenCenter('HERES', 'xy')
		addLuaText('HERES', true)		
	end
	if curStep == 380 then
		setProperty('HERES.visible', false)
		setProperty('JOHN.alpha', 0.7)
		makeLuaText('JOHN', 'JOHNNY!', 0, 0)
		setObjectCamera('JOHN', 'camGame')
		setTextSize('JOHN', 100)
		setProperty('JOHN.visible', true)
		screenCenter('JOHN', 'xy')
		addLuaText('JOHN', true)	
	end
	if curStep == 384 then
		setProperty('JOHN.visible', false)
		setProperty('bf.visible', false)
		doTweenAlpha('goneagain', 'nothing2', 0, 0.01, 'linear');
		setProperty('povreal.visible', true)
		setProperty('thestairs.visible', false)
		doTweenAlpha('sh', 'shader', 0.6, 0.01, 'linear');
		doTweenAlpha('mewhen', 'shadowfocus', 0.8, 0.01, 'linear');
		setProperty('cameraSpeed', 50);
	end
	if curStep == 385 then
		setProperty('cameraSpeed', 2.8);
	end

	if curStep == 992 then
		doTweenAlpha('backagain', 'nothing2', 1, 1, 'linear');
		doTweenAlpha('sh', 'shader', 0, 1, 'linear');
	end
	if curStep == 1007 then
		setProperty('why.alpha', 0.7)
		makeLuaText('why', 'WHY', 0, 0)
		setObjectCamera('why', 'camGame')
		setTextSize('why', 72)
		setProperty('why.visible', true)
		screenCenter('why', 'xy')
		addLuaText('why', true)		
    end
	if curStep == 1012 then
		setProperty('why.visible', false)
		setProperty('you.alpha', 0.7)
		makeLuaText('you', 'YOU', 0, 0)
		setObjectCamera('you', 'camGame')
		setTextSize('you', 72)
		setProperty('you.visible', true)
		screenCenter('you', 'xy')
		addLuaText('you', true)	
	end
	if curStep == 1015 then
		setProperty('you.visible', false)
		setProperty('little.alpha', 0.7)
		makeLuaText('little', 'LITTLE!!!!', 0, 0)
		setObjectCamera('little', 'camGame')
		setTextSize('little', 72)
		setProperty('little.visible', true)
		screenCenter('little', 'xy')
		addLuaText('little', true)	
		cameraShake('camGame', 0.02, 1)
		setTextColor('little', 'B50000')
		setProperty('timeBar.color', getColorFromHex('B50000'))
	end
	if curStep == 1020 then
		setProperty('povreal.visible', false)
		setProperty('thestairs.visible', true)
	end
	if curStep == 1023 then
		doTweenX('seeyal', 'dad', 800, 0.01, 'backInOut');
		doTweenY('seeya', 'dad', 500, 0.01, 'backInOut');
	end
	if curStep == 1024 then
		setProperty('little.visible', false)
		doTweenAlpha('sha', 'shader', 1, 0.001, 'linear');
		doTweenAlpha('byeagain', 'nothing2', 0, 0.1, 'linear');
		doTweenAlpha('gonetween', 'shadowfocus', 0.8, 0.2, 'linear');
    end
	if curStep == 1664 then
		doTweenAlpha('GUItween', 'camHUD', 0, 1, 'linear');
		doTweenAlpha('guesswhos', 'nothing2', 1, 0.01, 'linear');
		setProperty('all.alpha', 0.7)
		makeLuaText('all', 'ALL', 0, 0)
		setObjectCamera('all', 'camGame')
		setTextSize('all', 72)
		setProperty('all.visible', true)
		screenCenter('all', 'xy')
		addLuaText('all', true)	
	end
	if curStep == 1668 then
		setProperty('all.visible', false)
		setProperty('Ineed.alpha', 0.7)
		makeLuaText('Ineed', 'I NEED', 0, 0)
		setObjectCamera('Ineed', 'camGame')
		setTextSize('Ineed', 72)
		setProperty('Ineed.visible', true)
		screenCenter('Ineed', 'xy')
		addLuaText('Ineed', true)	
	end
	if curStep == 1675 then
		setProperty('Ineed.visible', false)
		setProperty('is.alpha', 0.7)
		makeLuaText('is', 'IS A', 0, 0)
		setObjectCamera('is', 'camGame')
		setTextSize('is', 72)
		setProperty('is.visible', true)
		screenCenter('is', 'xy')
		addLuaText('is', true)	
	end
	if curStep == 1680 then
		setProperty('is.visible', false)
		setProperty('title.alpha', 0.7)
		makeLuaText('title', 'TITLE', 0, 0)
		setObjectCamera('title', 'camGame')
		setTextSize('title', 72)
		setProperty('title.visible', true)
		screenCenter('title', 'xy')
		addLuaText('title', true)	
		setTextColor('title', 'B50000')
	end
	if curStep == 1687 then
		doTweenAlpha('byebyeeee', 'title', 0, 0.3, 'linear');
	end
	if curStep == 1696 then
		setProperty('title.visible', false)
		setProperty('Iwas.alpha', 0.7)
		makeLuaText('Iwas', 'I WAS THINKING', 0, 0)
		setObjectCamera('Iwas', 'camGame')
		setTextSize('Iwas', 72)
		setProperty('Iwas.visible', true)
		screenCenter('Iwas', 'xy')
		addLuaText('Iwas', true)
	end
	if curStep == 1706 then
		setProperty('Iwas.visible', false)
		setProperty('thinking.alpha', 0.7)
		makeLuaText('thinking', 'ALONG THE LINES OF', 0, 0)
		setObjectCamera('thinking', 'camGame')
		setTextSize('thinking', 72)
		setProperty('thinking.visible', true)
		screenCenter('thinking', 'xy')
		addLuaText('thinking', true)
	end
	if curStep == 1723 then
		setProperty('thinking.visible', false)
		setProperty('no.alpha', 0.7)
		makeLuaText('no', '"NO', 0, 0)
		setObjectCamera('no', 'camGame')
		setTextSize('no', 72)
		setProperty('no.visible', true)
		screenCenter('no', 'xy')
		addLuaText('no', true)
	end
	if curStep == 1728 then
		setProperty('no.visible', false)
		setProperty('t.alpha', 0.7)
		makeLuaText('t', 'T', 0, 0)
		setObjectCamera('t', 'camGame')
		setTextSize('t', 72)
		setProperty('t.visible', true)
		screenCenter('t', 'xy')
		addLuaText('t', true)
	end
	if curStep == 1733 then
		setProperty('t.visible', false)
		setProperty('tv.alpha', 0.7)
		makeLuaText('tv', 'TV', 0, 0)
		setObjectCamera('tv', 'camGame')
		setTextSize('tv', 72)
		setProperty('tv.visible', true)
		screenCenter('tv', 'xy')
		addLuaText('tv', true)
	end
	if curStep == 1737 then
		setProperty('tv.visible', false)
		setProperty('and.alpha', 0.7)
		makeLuaText('and', 'AND NO BEER', 0, 0)
		setObjectCamera('and', 'camGame')
		setTextSize('and', 60)
		setProperty('and.visible', true)
		screenCenter('and', 'xy')
		addLuaText('and', true)
		setTextColor('and', 'B50000')
	end
	if curStep == 1751 then
		setProperty('and.visible', false)
		setProperty('make.alpha', 0.7)
		makeLuaText('make', 'MAKE HOMER..."', 0, 0)
		setObjectCamera('make', 'camGame')
		setTextSize('make', 72)
		setProperty('make.visible', true)
		screenCenter('make', 'xy')
		addLuaText('make', true)
	end
	if curStep == 1766 then
		setProperty('make.visible', false)
		setProperty('something.alpha', 0.7)
		makeLuaText('something', 'SOMETHING SOMETHING...', 0, 0)
		setObjectCamera('something', 'camGame')
		setTextSize('something', 72)
		setProperty('something.visible', true)
		screenCenter('something', 'xy')
		addLuaText('something', true)
	end
	if curStep == 1783 then
		doTweenAlpha('seeyaneveridiots', 'something', 0, 0.5, 'linear');
	end
end	


function onStartCountdown()
    setProperty('gf.alpha', 0)
	doTweenAlpha('GUItween', 'camHUD', 0, 0.1, 'linear');

    return Function_Continue
end

function onUpdate(elapsed)
	if not middlescroll then
		if curBeat == 0 then
			setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)

			setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)

			setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)

			setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)


			setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)

			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)

			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)

			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
			
			--y
			setPropertyFromGroup('playerStrums', 0, 'y', defaultOpponentStrumY0)

			setPropertyFromGroup('playerStrums', 1, 'y', defaultOpponentStrumY1)

			setPropertyFromGroup('playerStrums', 2, 'y', defaultOpponentStrumY2)

			setPropertyFromGroup('playerStrums', 3, 'y', defaultOpponentStrumY3)


			setPropertyFromGroup('opponentStrums', 0, 'y', defaultPlayerStrumY0)

			setPropertyFromGroup('opponentStrums', 1, 'y', defaultPlayerStrumY1)

			setPropertyFromGroup('opponentStrums', 2, 'y', defaultPlayerStrumY2)

			setPropertyFromGroup('opponentStrums', 3, 'y', defaultPlayerStrumY3)


		end
	end
end

function onCountdownTick(c)
    if c == 3 then
        loadGraphic('countdownGo','go-crazy')
    end
end