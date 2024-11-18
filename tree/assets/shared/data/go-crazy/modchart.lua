function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.3 then
        setProperty('health', health- 0.017);
    end
end

function onStepHit()
	if curStep == 2 then
		doTweenAlpha('GUItween', 'camHUD', 1, 3, 'linear');
	end
	if curStep >= 1 then	
		noteTweenX('bfTween1', 4, -1425, 0.01, 'linear');
		noteTweenX('bfTween2', 5, -1315, 0.01, 'linear');
		noteTweenX('bfTween3', 6, -1205, 0.01, 'linear');
		noteTweenX('bfTween4', 7, -190, 0.01, 'linear');
		noteTweenX('dadTween1', 0, 432, 0.01, 'linear');
		noteTweenX('dadTween2', 1, 540, 0.01, 'linear');
		noteTweenX('dadTween3', 2, 645, 0.01, 'linear');
		noteTweenX('dadTween4', 3, 750, 0.01, 'linear');
	end 
	if curStep >= 52 then
		
		noteTweenX('bfTween1', 4, 90, 0.3, 'linear');
		noteTweenX('bfTween2', 5, 205, 0.25, 'linear');
		noteTweenX('bfTween3', 6, 315, 0.2, 'linear');
		noteTweenX('bfTween4', 7, 425, 0.15, 'linear');
		noteTweenX('dadTween1', 0, 730, 0.3, 'linear');
		noteTweenX('dadTween2', 1, 845, 0.3, 'linear');
		noteTweenX('dadTween3', 2, 955, 0.3, 'linear');
		noteTweenX('dadTween4', 3, 1065, 0.3, 'linear');
	end
	if curStep >= 384 then
    	noteTweenX('bfTween1', 4, 432, 0.2, 'linear');
    	noteTweenX('bfTween2', 5, 540, 0.2, 'linear');
    	noteTweenX('bfTween3', 6, 645, 0.2, 'linear');
    	noteTweenX('bfTween4', 7, 750, 0.2, 'linear');

		noteTweenX('dadTween1', 0, 432, 0.2, 'linear');
    	noteTweenX('dadTween2', 1, 540, 0.2, 'linear');
    	noteTweenX('dadTween3', 2, 645, 0.2, 'linear');
    	noteTweenX('dadTween4', 3, 750, 0.2, 'linear');

		noteTweenAlpha("yes", 0, 0.3, 0.2, "linear")
        noteTweenAlpha("yes2", 1, 0.3, 0.2, "linear")
        noteTweenAlpha("yes3", 2, 0.3, 0.2, "linear")
        noteTweenAlpha("yes4", 3, 0.3, 0.2, "linear")
	end
	if curStep >= 1024 then
		noteTweenX('bfTween1', 4, 90, 0.3, 'linear');
		noteTweenX('bfTween2', 5, 205, 0.3, 'linear');
		noteTweenX('bfTween3', 6, 315, 0.3, 'linear');
		noteTweenX('bfTween4', 7, 425, 0.3, 'linear');
		noteTweenX('dadTween1', 0, 730, 0.3, 'linear');
		noteTweenX('dadTween2', 1, 845, 0.3, 'linear');
		noteTweenX('dadTween3', 2, 955, 0.3, 'linear');
		noteTweenX('dadTween4', 3, 1065, 0.3, 'linear');

		noteTweenAlpha("yes", 0, 1, 0.2, "linear")
        noteTweenAlpha("yes2", 1, 1, 0.2, "linear")
        noteTweenAlpha("yes3", 2, 1, 0.2, "linear")
        noteTweenAlpha("yes4", 3, 1, 0.2, "linear")

	end
end
