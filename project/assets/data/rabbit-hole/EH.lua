function onCreatePost()
	if not middlescroll then
	noteTweenX('oppo0', 0, 732, 0.0001, 'circInOut')
	noteTweenX('oppo1', 1, 844, 0.0001, 'circInOut')
	noteTweenX('oppo2', 2, 956, 0.0001, 'circInOut')
	noteTweenX('oppo3', 3, 1068, 0.0001, 'circInOut')
	noteTweenX('oppo4', 4, 92, 0.0001, 'circInOut')
	noteTweenX('oppo5', 5, 204, 0.0001, 'circInOut')
	noteTweenX('oppo6', 6, 316, 0.0001, 'circInOut')
	noteTweenX('oppo7', 7, 428, 0.0001, 'circInOut')
	end
		setProperty('defaultCamZoom', 0.65)
		setProperty('camGame.zoom', 0.65)

	setProperty('thehealth-shade-play.color', getColorFromHex('00B1F7'))
	setProperty('thehealth-shade-opp.color', getColorFromHex('00FFF7'))
    setProperty('iconP2.alpha', 0)
end
function onUpdatePost()
    setProperty('iconP1.x',220+getProperty('health')*350)
    setProperty('iconP2.x',320+getProperty('health')*350)
    setProperty('iconP1.flipX',true)
    setProperty('iconP2.flipX',true)
    setProperty('healthBar.flipX',true)
	setProperty('winningIcon.flipX', false)
	setProperty('winningIconDad.flipX', true)
end

function onStepHit()
	if curStep == 1 then
	if not downscroll then
	noteTweenY('oppo0', 0, 2000, 2, 'circInOut')
	noteTweenY('oppo1', 1, 2000, 2, 'circInOut')
	noteTweenY('oppo2', 2, 2000, 2, 'circInOut')
	noteTweenY('oppo3', 3, 2000, 2, 'circInOut')
	end
	noteTweenY('oppo0', 0, -2000, 2, 'circInOut')
	noteTweenY('oppo1', 1, -2000, 2, 'circInOut')
	noteTweenY('oppo2', 2, -2000, 2, 'circInOut')
	noteTweenY('oppo3', 3, -2000, 2, 'circInOut')

	if not middlescroll then
	noteTweenX('oppo4', 4, 92, 2.5, 'circInOut')
	noteTweenX('oppo5', 5, 204, 2.5, 'circInOut')
	noteTweenX('oppo6', 6, 316, 2.5, 'circInOut')
	noteTweenX('oppo7', 7, 428, 2.5, 'circInOut')
	end
		setProperty('defaultCamZoom', 0.65)
		setProperty('camGame.zoom', 0.65)
	setProperty('thehealth-shade-play.color', getColorFromHex('00B1F7'))
	setProperty('thehealth-shade-opp.color', getColorFromHex('00FFF7'))
    setProperty('iconP2.alpha', 0)
end
end