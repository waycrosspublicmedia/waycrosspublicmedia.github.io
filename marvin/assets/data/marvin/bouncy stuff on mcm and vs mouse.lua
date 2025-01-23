function onUpdatePost()
        setProperty('iconP1.origin.y', 30)
	setProperty('iconP2.origin.y', 30)
end

local gfSpeed = 1;

function onBeatHit()

	if (curBeat % gfSpeed == 0) then
		if curBeat % (gfSpeed * 2) == 0 then
			setProperty('iconP1.scale.x', 1.13 );
			setProperty('iconP1.scale.y', 1.13 );
			setProperty('iconP2.scale.x', 1.13 );
			setProperty('iconP2.scale.y', 1.13 );

			setProperty('iconP1.angle', 15);
			setProperty('iconP2.angle', 15);
		else
			setProperty('iconP1.scale.x', 1.13 );
			setProperty('iconP1.scale.y', 1.13 );
			setProperty('iconP2.scale.x', 1.13 );
			setProperty('iconP2.scale.y', 1.13 );

			setProperty('iconP2.angle', -15);
			setProperty('iconP1.angle', -15);
		end

	end

end

function onUpdate()

    if (getProperty('iconP1.angle') >= 0) then
	    if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')-1);
    	end
    else
        if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')+1);
    	end
    end

    if (getProperty('iconP2.angle') >= 0) then
	    if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')-1);
    	end
    else
        if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')+1);
    	end
    end

end