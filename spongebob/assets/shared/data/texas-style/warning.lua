function onSongStart()
luaDebugMode = true;
	
	makeAnimatedLuaSprite('goofyNote', 'noteSkins/lasso/LASSONOTE_assets', 0, 0)
	setObjectCamera('goofyNote', 'camFilter')
	addAnimationByPrefix('goofyNote', "icon", "green00", 1)
	setGraphicSize('goofyNote', 80, 80)
	playAnim('goofyNote', 'icon')
	addLuaSprite('goofyNote', true);
	setProperty('goofyNote.visible', false);
	
	runHaxeCode([[
		noteNotification = new Notification("NEW NOTE!", "Sandy ain't goin' easy on ye!\nDon't hit them lasso notes,\nor yer notes will be tied up!", null, game.camFilter);
		game.add(noteNotification);
		noteNotification.start(5, true);
	]])
end