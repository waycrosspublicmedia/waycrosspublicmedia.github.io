function onCreate()
	-- background shit
	makeLuaSprite('pied background', 'pied background', -1300, -850);
	setScrollFactor('pied background', 0.9, 0.9);
        scaleObject('pied background', 1.3, 1.3);

	makeLuaSprite('pied', 'pied', 1770, 230);
	setScrollFactor('pied', 0.9, 0.9);
        scaleObject('pied', 1.3, 1.3);

	makeLuaSprite('pied light', 'pied light', -1290, -700);
	setScrollFactor('pied light', 0.9, 0.9);
        scaleObject('pied light', 1.3, 1.3);

        makeLuaSprite('pied front', 'pied front', -500, 1650);
	setScrollFactor('pied front', 1.0, 1.0);
        scaleObject('pied front', 1.2, 1.2);

	addLuaSprite('pied background', false);
	addLuaSprite('pied', false);
	addLuaSprite('pied light', true);
        addLuaSprite('pied front', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end