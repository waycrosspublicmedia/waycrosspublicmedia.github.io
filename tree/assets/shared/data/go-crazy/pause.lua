local pauseMusic = 'breakfast'
local songEnd = 90

function onCreate()
    precacheSound(pauseMusic)
    precacheSound('scrollMenu')
    precacheSound('clickText')
    
end

--onUpdate recomended
function onUpdate()
    
    function onTimerCompleted(ass1, loops, loopsleft)
        if ass1 == 'assON' then
            ass = true
        end
        if ass1 == 'assOFF' then
            ass = false
        end
        if ass1 == 'restart' then
            restart = true
            exit = false
            resume = false
        end
    
        if ass1 == 'resume' then
            restart = false
            exit = false
            resume = true
        end
    
        if ass1 == 'exit' then
            restart = false
            exit = true
            resume = false
        end
    end
    
function onSongStart()
    death = false
    amongus = 0
end


    luaDebugMode = true
    --open's the substate by pressing the pause button
    if keyJustPressed('pause')--[[and not ass]] and not death and amongus == 0 then
        resume = true
        restart = false
        exit = false
        openCustomSubstate('Pause', true)
        runTimer('assON', 0.4, 0)
        setProperty('paused',true)
        amongus = amongus + 2
        freezedPos = getPropertyFromClass('Conductor', 'songPosition')
    end
end

--Prevents OG pause
function onPause()
    return Function_Stop
end

local textSixe = 50
local XposText = 80
function onCustomSubstateCreate(tag)
    --amongus = amongus - 1
    if tag == "Pause" then

        playSound(pauseMusic, 0, 'pauseSongTag')
        soundFadeIn('pauseSongTag', 15)
        runTimer('loopPauseTag', songEnd, 90)

        makeLuaSprite('box', 'blackBox', 00, -100);
		setObjectCamera('box', 'other')
		addLuaSprite('box', true);
		scaleObject('box', 12.0, 12.0);
		setProperty('box.alpha', 0.0)		
		doTweenAlpha('apparition', 'box', 0.4, 0.4, 'linear');

        makeLuaSprite('BG', 'pausebox/pausebox', -1000, -1000)
        addLuaSprite('BG', false)
        setObjectCamera('BG', 'camOther')
        scaleObject('BG',15,15)
        setProperty('BG.color', '000000')
        setProperty('BG.alpha', 0)

        setObjectOrder('BG', -10000)

        makeLuaSprite('BOX', 'pausebox/pausebox', -50, 1000) -- 400
        addLuaSprite('BOX', true)
        setObjectCamera('BOX', 'other')
        scaleObject('BOX',0.6,0.6)
        doTweenY('boxIN','BOX',50,0.3,'circOut')
  
        makeLuaSprite('arrow', 'pausebox/pausearrow', 50, 0)
        addLuaSprite('arrow', true)
        setObjectCamera('arrow', 'other')
        scaleObject('arrow',0.4,0.4)
        setProperty('arrow.angle', -90)
  
        makeLuaText('resumeText', 'Resume', 1100, XposText, 1000) -- 190 + 150 - 5 + 80 + 9
        setTextSize('resumeText', textSixe)
        addLuaText('resumeText')
        setObjectCamera('resumeText', 'other')
        setTextAlignment('resumeText', 'left')
        setTextColor('resumeText', 'FFFFFF')
        setTextFont('resumeText', 'PokemonGB.TTF')
        doTweenY('resumeIN','resumeText',190 + 150 - 5 + 80 + 9,0.3,'circOut')

        makeLuaText('restartText', 'Restart', 1100, XposText, 1000) -- 225 + 150 + 85 + 29
      setTextSize('restartText', textSixe)
      addLuaText('restartText')
      setObjectCamera('restartText', 'other')
      setTextAlignment('restartText', 'left')
      setTextColor('restartText', 'FFFFFF')
      setTextFont('restartText', 'PokemonGB.TTF')
      doTweenY('restartIn','restartText',225 + 150 + 85 + 29,0.3,'circOut')
      

      makeLuaText('exitText', 'Exit', 1100, XposText, 1000) -- 260 + 150 + 5 + 90 + 49
      setTextSize('exitText', textSixe)
      addLuaText('exitText')
      setObjectCamera('exitText', 'other')
      setTextAlignment('exitText', 'left')
      setTextColor('exitText', 'FFFFFF')
      setTextFont('exitText', 'PokemonGB.TTF')
      doTweenY('exitIn','exitText',260 + 150 + 5 + 90 + 49,0.3,'circOut')

      makeLuaSprite('portrait','portraits/homerportrait',2000,0)
      addLuaSprite('portrait',true)
      setObjectCamera('portrait', 'Other')
      doTweenX('portraitslide','portrait',330,0.3,'backInOut')


    if getPropertyFromClass('PlayState', 'chartingMode') == true then
        makeLuaText('ChartingModeText', 'charting mode' .. '\npress "B" for botplay' .. '\nto exit charting mode press "C"', 1100, -1200, 580) -- 260 + 150 + 5 + 90 + 49
        setTextSize('ChartingModeText', 0.5)
        addLuaText('ChartingModeText')
        setObjectCamera('ChartingModeText', 'other')
        setTextAlignment('ChartingModeText', 'left')
        doTweenX('chartIn','ChartingModeText',0,0.2,'circOut')
    end




      
      Load = true
      setPropertyFromClass('Conductor', 'songPosition', freezedPos)



    end
end
--substate stuff
local arrowOffset = 7
function onCustomSubstateUpdate(tag)
    if tag == "Pause" then

        if getProperty('cpuControlled') == true then
            setTextString('ChartingModeText', 'charting mode' .. '\npress "B" to turn botplay off' .. '\nto exit charting mode press "C"')
        else
            setTextString('ChartingModeText', 'charting mode' .. '\npress "B" to turn botplay on' .. '\nto exit charting mode press "C"')
        end

    if getPropertyFromClass('PlayState', 'chartingMode') == true and keyboardJustPressed('B') then


        if getProperty('cpuControlled') == false then
          setProperty('cpuControlled', true)
      else
          setProperty('cpuControlled', false)
      end
          runHaxeCode('game.botplayTxt.visible = game.cpuControlled; game.botplayTxt.alpha = 1; game.botplaySine = 0; game.changedDifficulty = true;')
      end

    setPropertyFromClass('Conductor', 'songPosition', freezedPos)

    if getPropertyFromClass('PlayState', 'chartingMode') == true and keyboardJustPressed('C') then
        restartSong()
        setPropertyFromClass('PlayState', 'chartingMode', false)
    end













        if resume and keyJustPressed('up') and not Load then
            doTweenY('arrowMove', 'arrow', getProperty('exitText.y') + arrowOffset, 0.05,'sineInOut')
            playSound('scrollMenu')
            
            runTimer('exit', 0.000001, 0)
            moved = true
        elseif resume and keyJustPressed('down') and not Load then
            doTweenY('arrowMove', 'arrow', getProperty('restartText.y') + arrowOffset, 0.05,'sineInOut')
            playSound('scrollMenu')
            
            runTimer('restart', 0.000001, 0)
            moved = true
        end

        if restart and keyJustPressed('up') and not Load then
            runTimer('resume', 0.000001, 0)
            doTweenY('arrowMove', 'arrow', getProperty('resumeText.y') + arrowOffset, 0.05,'sineInOut')
            playSound('scrollMenu')
            
        elseif restart and keyJustPressed('down') and not Load then
            doTweenY('arrowMove', 'arrow', getProperty('exitText.y') + arrowOffset, 0.05,'sineInOut')
            playSound('scrollMenu')
            
            runTimer('exit', 0.000001, 0)
        end

        if exit and keyJustPressed('up') and not Load then
            doTweenY('arrowMove', 'arrow', getProperty('restartText.y') + arrowOffset, 0.05,'sineInOut')
            playSound('scrollMenu')

            runTimer('restart', 0.000001, 0)
        elseif exit and keyJustPressed('down') and not Load then
            doTweenY('arrowMove', 'arrow', getProperty('resumeText.y') + arrowOffset, 0.05,'sineInOut')
            playSound('scrollMenu')

            runTimer('resume', 0.000001, 0)
        end

        if Load then
            setProperty('arrow.y', getProperty('resumeText.y') + arrowOffset)
        end
        


    if keyJustPressed('pause')--[[and ass]] and resume and amongus == 1 then
        Load = true
        amongus = amongus - 1
        
        runTimer('assOFF', 0.2, 0)
        doTweenX('bfportslideOut','bfport',1500,0.2,'circIn')
        doTweenX('dadportslideOut','dadport',-750,0.2,'circIn')
        doTweenX('chartTextDie','ChartingModeText',-1200,0.2,'circIn')
        doTweenY('resume die','resumeText',1500,0.2,'circIn')
        doTweenY('restart die','restartText',1500,0.2,'circIn')
        doTweenY('exit die','exitText',1500,0.2,'circIn')
        doTweenY('box die','BOX',1500,0.2,'circIn')
        doTweenX('portraitslide','portrait',2000,0.3,'backInOut')
        doTweenAlpha('apparition', 'box', 0.0, 0.3, 'linear');
        --doTweenX('arrowDie','arrow',-1200,0.2,'circIn')

        doTweenAlpha('BG die','BG',0,0.2,'circIn')

        --closeCustomSubstate()
        --[[removeLuaText('resumeText')
        removeLuaText('restartText')
        removeLuaText('exitText')
        removeLuaSprite('BOX')
        removeLuaSprite('arrow')
        removeLuaSprite('bfport')
        removeLuaSprite('dadport')
        removeLuaSprite('BG')]]

    --restart thing
    elseif keyJustPressed('pause') and restart then
        
        restartSong()

    --exit thing
    elseif keyJustPressed('pause') and exit then
        
        exitSong()
    end
    end
    function onTweenCompleted(tag)
        if tag == 'BG die' then
            closeCustomSubstate()
        end
        if tag == 'restartIn' then
            amongus = amongus - 1
            Load = false
        end
    end
end

function onCustomSubstateSoundFinished(name)
    if name == 'pauseState' then
        playSound(pauseMusic, 1, 'pauseSongTag')
        runTimer('loopPauseTag', songEnd, 90)
    end
end

function onCustomSubstateTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loopPauseTag' then
        playSound(pauseMusic, 1, 'pauseSongTag')
	end
end