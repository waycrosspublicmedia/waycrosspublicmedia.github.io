function onCreate()
    --PRECACHE
        --addCharacterToList('twilight-p', 'dad');
        addCharacterToList('twilight-pL', 'dad');
        addCharacterToList('twilight-pS', 'dad');
    
        --addCharacterToList('twilight-p', 'bf-p');
        addCharacterToList('bf-pD', 'boyfriend');
        addCharacterToList('bf-pS', 'boyfriend');
    
        precacheImage('BF_Death');
        precacheSound('Pibby Death');
        precacheSound('hugging_death_loop');
        precacheSound('hugging_death_end');
    
        precacheSound('missleft');
        precacheSound('missdown');
        precacheSound('missup');
        precacheSound('missright');
    
        -- Character Death Presets
        setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-death'); --Character json file for the death animation
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'PibbyDeath'); --put in mods/sounds/
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'hugging_death_loop2'); --put in mods/music/
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'hugging_death_end2'); --put in mods/music/
    
        -- LASER
            makeAnimatedLuaSprite('laser', 'Laser', getCharacterX('dad') + 100, getCharacterY('dad') + 300);
            addAnimationByPrefix('laser', 'shoot', 'Laser', 24, true);
            setProperty('laser.alpha', 0.9);
            setBlendMode('laser', 'hardlight');
        -- GLITCH FILTER
        if not lowQuality then
            makeAnimatedLuaSprite('glitch', 'glitchfield', 0, 0);
            addAnimationByPrefix('glitch', 'play', 'the filter', 10, true);
            addLuaSprite('glitch', true);
            objectPlayAnimation('glitch', 'play', false);
            setProperty('glitch.alpha', 0);
            setProperty('glitch.scale.x', 2.4);
            setProperty('glitch.scale.y', 2.2);
            setProperty('glitch.x', getProperty('glitch.x') - 290);
            setBlendMode('glitch', 'add');
        end
    
        
        --noteTweenAlpha('invisiable', 0, 0, 1, 'linear');
        --noteTweenAlpha('invisiable1', 1, 0, 0.01, 'linear');
        --noteTweenAlpha('invisiable2', 2, 0, 0.01, 'linear');
        --noteTweenAlpha('invisiable3', 3, 0, 0.01, 'linear');
       -- noteTweenAlpha('invisiable4', 4, 0, 0.01, 'linear');
       -- noteTweenAlpha('invisiable5', 5, 0, 0.01, 'linear');
        --noteTweenAlpha('invisiable6', 6, 0, 0.01, 'linear');
        --noteTweenAlpha('invisiable7', 7, 0, 0.01, 'linear');
        
        
    --setProperty('botplay', true);
    
        
    
    
    
    
    
        --Put Pinkie behind the BG
        setObjectOrder('gfGroup', 0);
    
    
        --setObjectOrder('gfGroup', 15);
        --setPropertyFromObject('girlfriend', 'alpha', '0');
        doTweenColor('twiBlack', "dad", '000000', 0.01, 'linear');
        
        
    
    -- Spotlight on BF
        --makeLuaSprite('spotlight1', 'spotlight', -3000, -2020);
        --setScrollFactor('spotlight1', 1, 1);
        --scaleObject('spotlight1', 0.9, 1);
    
        
        --doTweenAlpha('twiAlphaTween', 'twilightSpeaks', 0.0001, 0.00001, 'linear');
        setObjectOrder('twilightSpeaks', 0);
    
        --close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
    end