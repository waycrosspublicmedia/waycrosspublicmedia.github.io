function onCreate()
	-- background shit
	makeLuaSprite('halloween_bggame', 'halloween_bggame', -250, -150);
	setScrollFactor('halloween_bggame', 0.9, 0.9);
	
	

	addLuaSprite('halloween_bggame', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end