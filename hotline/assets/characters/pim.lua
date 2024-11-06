function goodNoteHit(id, noteData, noteType, isSustainNote)
		local animToPlay = '';
		if noteData == 0 then
			animToPlay = 'singLEFT';
		elseif noteData == 1 then
			animToPlay = 'singDOWN';
		elseif noteData == 2 then
			animToPlay = 'singUP';
		elseif noteData == 3 then
			animToPlay = 'singRIGHT';
		end
		characterPlayAnim('gf', animToPlay, true);
		setProperty('gf.specialAnim', true);
end