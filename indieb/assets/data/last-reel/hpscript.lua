function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 1 then
	 setProperty('health', health- 0.05);
    elseif getProperty('health') > 0.6 then
	 setProperty('health', health- 0.023);
    elseif getProperty('health') > 0.35 then
       setProperty('health', health- 0.018);
	end
end
