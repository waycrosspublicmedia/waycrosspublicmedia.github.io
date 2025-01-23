function onCreate()
	setProperty("camZooming", true)
	makeLuaSprite('heartbeat', 'heartbeatVignette')
	setObjectCamera('heartbeat', 'camEffects')
	setProperty('heartbeat.visible', false)
	addLuaSprite('heartbeat')
end

function onSongStart()
	setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015 * getProperty('camZoomingMult'))
	setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03 * getProperty('camZoomingMult'))

	setProperty('heartbeat.visible', true)
	setProperty('heartbeat.alpha', 1)
end

function onUpdate(elapsed)
	setProperty('heartbeat.alpha', getProperty('heartbeat.alpha') - ((crochet / 1000) * elapsed * 3.334));
end

function onBeatHit()
	if getProperty('heartbeat.visible') and curBeat % 4 == 0 then
		setProperty('heartbeat.alpha', 1);
	end
end

function onSectionHit()
	if curSection == 121 then
		setProperty('heartbeat.visible', false)
		setProperty("camZooming", false)
		setProperty("camGame.zoom", getProperty('defaultCamZoom'))
		setProperty("camHUD.zoom", 1)
		doTweenAlpha('hud', 'camHUD', 0, 0.75, "circout")
	end

	if curSection == 128 then
		cameraFade('camGame', '000000', 5.19, true)
		close(true);
	end
end
