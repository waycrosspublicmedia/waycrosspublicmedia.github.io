function onCreate()
	
      makeLuaSprite('phillySkybox', 'phillySkybox', -700, -200);
	addLuaSprite('phillySkybox', false)
	setScrollFactor('phillySkybox', 0.3, 0.3);

	makeLuaSprite('phillySkyline', 'phillySkyline', -700, -300);

	addLuaSprite('phillySkyline', false)

	setScrollFactor('phillySkyline', 0.3, 0.3);

	makeLuaSprite('phillyForegroundCity', 'phillyForegroundCity', 350, -20);

	addLuaSprite('phillyForegroundCity', false)

	setScrollFactor('phillyForegroundCity', 0.4, 0.4);

	makeLuaSprite('phillyConstruction', 'phillyConstruction', 1000, -150);

	addLuaSprite('phillyConstruction', false)

	setScrollFactor('phillyConstruction', 0.6, 0.6);

	makeLuaSprite('phillySmog', 'phillySmog', -1000, -200);

	addLuaSprite('phillySmog', false)

	setScrollFactor('phillySmog', 0.8, 0.8);

	makeLuaSprite('phillyTraffic', 'phillyTraffic', -1100, -100);

	addLuaSprite('phillyTraffic', false)

	setScrollFactor('phillyTraffic', 0.9, 0.9);

	makeLuaSprite('phillyHighway', 'phillyHighway', -1050, -250);

	addLuaSprite('phillyHighway', false)

	setScrollFactor('phillyHighway', 1.0, 1.0);


	makeLuaSprite('phillyForeground', 'phillyForeground', -1100, -100);

	addLuaSprite('phillyForeground', false)

	setScrollFactor('phillyForeground', 1.0, 1.0);
	makeLuaSprite('SpraycanPile', 'SpraycanPile', -270, 630);

	addLuaSprite('SpraycanPile', true)

	setScrollFactor('SpraycanPile', 1.0, 1.0);
	
-- Your Custom bg sprites or something like this
	
	 close(true);

end