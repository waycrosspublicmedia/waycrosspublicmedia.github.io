
function onCreatePost()

	doTweenY('floatdown','dad',getProperty('dad.y')+100,0.8,'sineInOut')


end


function onTweenCompleted(t)

	if t == 'floatup' then
		doTweenY('floatdown','dad',getProperty('dad.y')+100,0.8,'sineInOut')
	end
	if t == 'floatdown' then
		doTweenY('floatup','dad',getProperty('dad.y')-100,0.8,'sineInOut')
	end




end


function opponentNoteHit(id,d,t,s)

if getHealth() > 0.1 then
	setHealth(getHealth()-0.025)
	cameraShake('game',0.02,0.02)
end


end