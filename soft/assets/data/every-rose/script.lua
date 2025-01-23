function onSectionHit()
	if curSection == 85 then
		setProperty('sakura.visible', true)
		doTweenAlpha('sakuraFade', 'sakura', 1, crochet / 1000)
	end

	if curSection == 100 then
		doTweenAlpha('sakuraFade', 'sakura', 0, 2.93)
		close(true)
	end
end
