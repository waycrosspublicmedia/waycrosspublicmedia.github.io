function onCreate()
	if not lowQuality then
		makeLuaSprite('hypeshit','hypeshit',0,0)
		setObjectCamera('hypeshit','hud')
		setBlendMode('hypeshit','multiply');
	end
	if not isStoryMode then
		if not lowQuality then
			addLuaSprite('hypeshit',true)
		end
	end
end

function opponentNoteHit(id, direction,  noteType, isSustainNote)
	health = getProperty('health')
	if getProperty('health') > 0.20 then
  	setProperty('health', health- 0.015);
	end
end

function onNextDialogue(line)
	if line == 14 then
		if not lowQuality then
    		addLuaSprite('hypeshit',true)
		end
	end
end