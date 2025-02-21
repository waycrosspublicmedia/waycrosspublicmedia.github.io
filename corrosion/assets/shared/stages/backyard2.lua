function onCreate()
	-- background shit IOOOOOOO
	addCharacterToList('bf', 'bf');

	makeLuaSprite('prestage', 'backgrounds/bg_skyphase2', -650, -380);
	addLuaSprite('prestage', false);

	makeLuaSprite('prelights', 'backgrounds/bg_realphase2', -650, -380);
	addLuaSprite('prelights', false);

	makeLuaSprite('bg2', 'shared/Chapter1/stages/entrance/background', 350, -450);
	addLuaSprite('bg2', false);
	setLuaSpriteScrollFactor('bg2', 0.9, 0.9);
	makeLuaSprite('bg', 'shared/Chapter1/stages/entrance/base', -300, -400);
	addLuaSprite('bg', false);

	makeLuaSprite('welcome_center', 'shared/Chapter1/stages/entrance/object', 420, -350);
	addLuaSprite('welcome_center', false);

	makeLuaSprite('pierre', 'shared/Chapter1/stages/entrance/VHS_TV', 2250, -200);
	addLuaSprite('pierre', false)

	makeLuaSprite('iluminations', 'shared/Chapter1/stages/entrance/lights', -300, -400);
	addLuaSprite('iluminations', true)
end
function onUpdate()
    setObjectOrder('iluminations', true);
    setObjectOrder('boyfriendGroup', false);
    setObjectOrder('welcome_center', false);
    setObjectOrder('pierre', false);
    setObjectOrder('bg', false);
    setObjectOrder('bg2', false);
    setObjectOrder('prelights', false);
    setObjectOrder('prestage', false);
end
function onEvent(name,value1,value2)
    if name == 'whoopee' then
        if value1 == 'on' then
            doTweenColor('welcome_center', 'welcome_center', '000000', value2, 'linear');
            doTweenColor('pierre', 'pierre', '00000', value2, 'linear');
        end
        if value1 == 'off' then
            doTweenColor('welcome_center', 'welcome_center', 'FFFFFF', value2, 'linear');
            doTweenColor('pierre', 'pierre', 'FFFFFF', value2, 'linear');
        end
        if value1 == 'onhalf' then
            doTweenColor('welcome_center', 'welcome_center', '646464', value2, 'linear');
            doTweenColor('pierre', 'pierre', '646464', value2, 'linear');
        end
    end
    if name == 'FNFunction' then
        if value1 == 'change_da_stage' then

            removeLuaSprite('bg2');
            removeLuaSprite('bg');
            removeLuaSprite('welcome_center');
            removeLuaSprite('pierre');
            removeLuaSprite('iluminations');

            triggerEvent('Change Character', 'dad', 'no');
            triggerEvent('Change Character', 'bf', 'bufren');
            setObjectOrder('prelights', true);

            setObjectOrder('boyfriendGroup', false);
            setObjectOrder('prestage', false);
        end
    end
end
