function onCreate()
	-- background shit
	makeLuaSprite('sky_night', 'sky_night', -600, -300);
	setScrollFactor('sky_night', 0.4, 0.4);

	makeLuaSprite('city_night', 'city_night', -600, -300);
	setScrollFactor('city_night', 0.6, 0.6);

	makeLuaSprite('rooftop_night', 'rooftop_night', -600, -300);
	setScrollFactor('rooftop_night', 0.9, 0.9);

	addLuaSprite('sky_night', false);
	addLuaSprite('city_night', false);
	addLuaSprite('rooftop_night', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end