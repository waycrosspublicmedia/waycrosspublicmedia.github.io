function onCreate()
	-- background shit
	makeAnimatedLuaSprite('griefStageBG', 'play stage/stage ground', -600, -200);
	addAnimationByPrefix('griefStageBG','bg move','stage ground',24,true);
	setLuaSpriteScrollFactor('griefStageBG', 0.7, 0.9);
	addLuaSprite('griefStageBG', false);	

	makeAnimatedLuaSprite('theCurtains', 'play stage/stage curtains wop', 600, 00);
	addAnimationByPrefix('theCurtains','curtains move','curtains',24,true);
	setLuaSpriteScrollFactor('theCurtains', 0.8, 0.88);
	addLuaSprite('theCurtains', false);

	makeAnimatedLuaSprite('theShadow', 'play stage/ground shadow', 830, 800);
	addAnimationByPrefix('theShadow','shadow move','ground shadow',24,true);
	setLuaSpriteScrollFactor('theShadow', 0.97, 0.97);
	addLuaSprite('theShadow', false);

	makeAnimatedLuaSprite('theShadow2', 'play stage/ground shadow', 10, 810);
	addAnimationByPrefix('theShadow2','shadow2 move','ground shadow',24,true);
	setLuaSpriteScrollFactor('theShadow2', 0.97, 0.97);
	addLuaSprite('theShadow2', false);

	makeAnimatedLuaSprite('theMPhone', 'play stage/megaphone', 1100, 480);
	addAnimationByPrefix('theMPhone','mphone move','megphone',24,true);
	setLuaSpriteScrollFactor('theMPhone', 0.97, 0.97);
	addLuaSprite('theMPhone', false);

end