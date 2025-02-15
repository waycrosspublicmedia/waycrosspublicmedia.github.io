function onCreate()
setProperty('boyfriend.x', getProperty('boyfriend.x')-50)
setProperty('dad.x', getProperty('dad.x')+50)
setProperty('gf.alpha',0)
setProperty('iconP1.flipX', true)
setProperty('darkBG.alpha',0.95)

makeLuaSprite('treeFog', 'treeFog', 0,0)
addLuaSprite('treeFog', false)
scaleObject('treeFog', 1.1, 1.1)
setObjectCamera('treeFog', 'hud')
setObjectOrder('treeFog', getObjectOrder('timeBar') - 1)

makeLuaSprite('vignette', 'vignette', 0,0)
addLuaSprite('vignette', false)
setObjectCamera('vignette', 'hud')
setObjectOrder('vignette', 3)
setProperty('vignette.alpha', 0.2)

makeLuaSprite('darkBG2', '', 0, 0);
makeGraphic('darkBG2',screenWidth*1.5,screenHeight*1.5,'000000')
  addLuaSprite('darkBG2', true);
  setProperty('darkBG2.scale.x',2)
  setProperty('darkBG2.scale.y',2)

    makeLuaSprite('ourpleBlinds', 'ourpleBlinds', 0, 0);
    setObjectCamera('ourpleBlinds', 'hud')
    scaleObject('ourpleBlinds', 1.3, 1)
    setProperty('ourpleBlinds.alpha', 0)
    addLuaSprite('ourpleBlinds', false);
    setObjectOrder('ourpleBlinds', getObjectOrder('treeFog') + 1)


  
  


  setPropertyFromClass('GameOverSubstate', 'characterName', 'ourpletko_death');
  setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'OurpleDeath');
  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'KOgameOver');
  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'OurplegameOverEnd');
end


function onSongStart()
    setProperty('ourpleBlinds.alpha', 1)
    setProperty('letterbox.scale.y', 1)
    setObjectOrder('letterbox', getObjectOrder('treeFog')+1)

    doTweenY('floatTweenY', 'gf', getProperty('gf.y')+100,1,'sineInOut')
    doTweenAlpha('openingDark', 'darkBG2', 0.5, 5, 'sineInOut')
end



function onUpdatePost()
    if getProperty('healthBar.percent') > 80 then
        setProperty('iconP2.angle', getRandomInt(-4,4))
      else
        setProperty('iconP2.angle', 0)
      end

      if gfSection == true then
        triggerEvent('Camera Follow Pos',getProperty('gf.x')+355,getProperty('gf.y')+250)
      end

    if curStep >= 128 then
        setProperty('darkBG2.alpha', getProperty('darkBG.alpha')/2)
    end
end

function onEvent(n)
    if n == 'Add Camera Zoom' then
        triggerEvent('Flash Camera Intensity', 0.2, 0.05)
    end
end

local iconFlip = false
function onBeatHit()
    if getProperty('healthBar.percent') > 80 then
        if iconFlip == false then
        setProperty('iconP2.flipX', true)
        iconFlip = true
        else
        setProperty('iconP2.flipX', false)
        iconFlip = false
        end
    else
        setProperty('iconP2.flipX', false)
    end

end

function onTweenCompleted(tag)
    if tag == 'floatTweenY' then
        doTweenY('floatTweenY2', 'gf', getProperty('gf.y')-100,1,'sineInOut')
    end

    if tag == 'floatTweenY2' then
        doTweenY('floatTweenY', 'gf', getProperty('gf.y')+100,1,'sineInOut')
    end


end

function onStepHit()
    

if curStep == 916 then
    doTweenX('movebf', 'boyfriend', getProperty('boyfriend.x')+50, 0.8, 'quartOut')
    doTweenX('movedad', 'dad', getProperty('dad.x')-75, 0.8, 'quartOut')
    doTweenAlpha('phoneyAppear', 'gf', 1, 0.5, 'linear')
end

end

function onSectionHit()
    if gfSection == true then
        --setProperty('defaultCamZoom', 1.2)
    end
end