function onCreate()
	makeLuaText('PEREZ SEN H2O', "PORTEADO POR | PEREZ SEN ", 0, 2, 700); 
	setTextSize('PEREZ SEN H2O', 20);
	setObjectCamera('PEREZ SEN H2O', 'other');
	addLuaText('PEREZ SEN H2O', true);
	function onCreatePost()

		setProperty('gf.visible',false)
	end
end