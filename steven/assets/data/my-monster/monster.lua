function onCreate()
    setProperty('Black2.alpha', 1);
    
    setPropertyFromClass('GameOverSubstate', 'characterName', 'su-death'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'SUdeathfx'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'LLYLoop'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'LLYEnd'); --put in mods/music/

    doTweenAlpha('KaijuOff', 'Kaiju', 0, 0.05, 'linear');
    doTweenAlpha('GFOff', 'gf', 0, 0.05, 'linear');
    doTweenAlpha('DadOff', 'dad', 0, 0.05, 'linear');

    setBlendMode('gf', 'OVERLAY');
    setBlendMode('dad', 'OVERLAY');

    flipAnt = 1;


    varY = 90;
    varX = 30;
    startingX = defaultBoyfriendX - varX;
    startingY = (defaultBoyfriendY + 100);
    endingX = defaultBoyfriendX + varX
    endingY = (defaultBoyfriendY + 100) + varY;

    doTweenX('startfloatx', 'boyfriend', endingX, 5, 'quadInOut');
    doTweenY('startfloaty', 'boyfriend', endingY, 2, 'quadInOut');
end

function onStartCountdown()
	-- countdown started, duh
	-- return Function_Stop if you want to stop the countdown from happening (Can be used to trigger dialogues and stuff! You can trigger the countdown with startCountdown())
	
    return Function_Continue;
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	if counter == 3 then
        doTweenAlpha('blackoffyeah', 'Black2', 0, 2, 'quadInOut');
    end
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
end


function onBeatHit()

    if curBeat % 2 == 0 then
        objectPlayAnimation('Kaiju', 'bop', true);
    end
    

    if curBeat == 12 then

        doTweenAlpha('Dadsorta', 'dad', 0.3, 3, 'quadInOut');
        removeNormal(6,0.5,'quadInOut');
        doTweenZoom('lightzoom', 'camGame', 0.7, 7.7, 'quadOut');
    end

    if curBeat == 20 then

        doTweenAlpha('DadOff', 'dad', 0, 7, 'quadInOut');
        removeNormal(7,1, 'quadInOut');
    end

    if curBeat == 56 then
        setProperty('defaultCamZoom', 0.9);
    end

    if curBeat == 60 then
        setProperty('defaultCamZoom', 1.2);
    end

    if curBeat == 92 then

        doTweenAlpha('DadOn', 'dad', 0.9, 0.5, 'quadInOut');
        doTweenZoom('zoomOut1', 'camGame', 0.7, 2, 'quadOut');
    end

    if curBeat == 116 then

        doTweenAlpha('GFOn', 'gf', 0.9, 0.5, 'quadInOut');
        removeNormal(9,0.6,'bounceIn');
        doTweenZoom('zoomOut1', 'camGame', 0.4, 9.5, 'quadInOut');
        --setProperty('defaultCamZoom', 0.4);
    end

    if curBeat == 139 then

        --Turn Black
        doTweenColor('monsterOn', 'boyfriend', '000000', 0.1, 'bounceIn');

    end

    if curBeat == 140 then

        --doTweenAlpha('GFOn', 'gf', 1, 0.5, 'quadInOut');
        --setProperty('defaultCamZoom', 0.4);
        doTweenZoom('zoomIn1', 'camGame', 1.4, 2.5, 'quintOut');
        removeNormal(1,0,'linear');
        --Revert Back
        doTweenColor('monsterOff', 'boyfriend', 'FFFFFF', 0.05, 'bounceIn');
        triggerEvent('Play Animation', 'Monster', 'BF');
        --doTweenColor('monster', 'boyfriend', '000000', 1, 'bounceIn');
    end

    if curBeat == 147 then

        --doTweenAlpha('KaijuOn', 'Kaiju', 1, 0.5, 'quadInOut');
        --Turn Black Again
        doTweenColor('monsterOn', 'boyfriend', '000000', 0.05, 'bounceIn');
       -- setProperty('defaultCamZoom', 0.3);
    end

    if curBeat == 148 then

        doTweenAlpha('KaijuOn', 'Kaiju', 1, 0.5, 'quadInOut');
        doTweenColor('monsterOff', 'boyfriend', 'FFFFFF', 4, 'bounceIn');
        setProperty('defaultCamZoom', 0.3);
    end

end

function onTweenCompleted(tag)
	if tag == 'zoomOut1' then
        setProperty('defaultCamZoom', 0.7);
    end

    if tag == 'startfloatx' then
    doTweenX('endfloatx', 'boyfriend', startingX, 4, 'quadInOut');
    end

    if tag == 'endfloatx' then
    doTweenX('startfloatx', 'boyfriend', endingX, 4, 'quadInOut');
    end



    if tag == 'startfloaty' then
    doTweenY('endfloaty', 'boyfriend', startingY, 2, 'quadInOut');
    end

    if tag == 'endfloaty' then
    doTweenY('startfloaty', 'boyfriend', endingY, 2, 'quadInOut');
    end
end

function removeNormal(time, alpha, ease)
    doTweenAlpha('normalRemoval', 'Background1', alpha, time, ease);
end