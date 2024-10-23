--you can change these
local ofs = 20; --offset value
local cameraMovement = true; --set this to false in case you don't like the movement

--leave these alone
local campointx = 0;
local campointy = 0;
local camlockx = 0;
local camlocky = 0;
local camLockChar = false;
local playerFocus = true;
local isGFPlayable = false;

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		camLockChar = false;
		playerFocus = true;
	elseif focus == 'dad' then
		camLockChar = false;
		playerFocus = false;
	elseif focus == 'gf' then
		camLockChar = false;
		
		if isGFPlayable == false then
			playerFocus = false;
		else
			playerFocus = true;
		end
	end

	campointx = getProperty('camFollow.x');
	campointy = getProperty('camFollow.y');
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if cameraMovement == true and playerFocus == false and noteType ~= 'Hurt Note' then
		if direction == 0 then
			camlockx = campointx - ofs;
			camlocky = campointy;
		elseif direction == 1 then
			camlocky = campointy + ofs;
			camlockx = campointx;
		elseif direction == 2 then
			camlocky = campointy - ofs;
			camlockx = campointx;
		elseif direction == 3 then
			camlockx = campointx + ofs;
			camlocky = campointy;
		else
			camlockx = campointx;
			camlocky = campointy;
		end

		camLockChar = true;
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if cameraMovement == true and playerFocus == true and noteType ~= 'Hurt Note' then
		if direction == 0 then
			camlockx = campointx - ofs;
			camlocky = campointy;
		elseif direction == 1 then
			camlocky = campointy + ofs;
			camlockx = campointx;
		elseif direction == 2 then
			camlocky = campointy - ofs;
			camlockx = campointx;
		elseif direction == 3 then
			camlockx = campointx + ofs;
			camlocky = campointy;
		else
			camlockx = campointx;
			camlocky = campointy;
		end

		camLockChar = true;
	end
end

function onUpdate(elapsed)
	if camLockChar == true then
		setProperty('camFollow.x', camlockx);
		setProperty('camFollow.y', camlocky);
	end
end

function onBeatHit()
-- curbeat shit
	if curBeat == 452 then
		cameraMovement = false
	end

	if curBeat == 468 then
		cameraMovement = true
	end
end