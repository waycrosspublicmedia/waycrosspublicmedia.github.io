

function onCreate()
    makeLuaSprite('Black', 'Black', -220)
    scaleObject('Black', 4, 4)
    setObjectOrder('Black', 70)
    addLuaSprite('Black', true)
    setProperty("showComboNum", false)
    setProperty("showRating", false)
   
    setProperty('Black.alpha',1)
    setProperty('camHUD.alpha', 0)


    setProperty('healthBarBG.visible', false)
	setProperty('healthBar.visible', false)
    setProperty('scoreTxt.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
    setProperty('timeBarBG.alpha', 0);
    setProperty('timeBar.alpha', 0);
    setProperty('timeTxt.alpha', 0);

    makeLuaSprite('flashwhite', '', 0, 0);
    makeGraphic('flashwhite',1280,720,'FFFFFF')
      addLuaSprite('flashwhite', true);
      setLuaSpriteScrollFactor('flashwhite',0,0)
          setObjectCamera('flashwhite', 'camOther')
      setProperty('flashwhite.scale.x',2)
      setProperty('flashwhite.scale.y',2)
    setProperty('flashwhite.alpha',0)


end
function onSongStart()
    noteTweenAlpha('N0', 0, 0, .01, 'sineInOut')
    noteTweenAlpha('N1', 1, 0, .01, 'sineInOut')
    noteTweenAlpha('N2', 2, 0, .01, 'sineInOut')
    noteTweenAlpha('N3', 3, 0, .01, 'sineInOut')
    noteTweenAlpha('N4', 4, 0, .01, 'sineInOut')
    noteTweenAlpha('N5', 5, 0, .01, 'sineInOut')
    noteTweenAlpha('N6', 6, 0, .01, 'sineInOut')
    noteTweenAlpha('N7', 7, 0, .01, 'sineInOut')


end

    

function onStepHit()
    if curStep == 1 then 
        setProperty('camHUD.alpha', 1)
    end
    if curStep == 5 then 
        doTweenAlpha('1', 'Black', 0, 7, 'sineInOut')
    end
    if curStep == 48 then 
        doTweenX('tween', 'camFollow', 2130, 2.6, 'expoInOut')
    end
    if curStep == 51 then 
        noteTweenAlpha('N4', 4, 1, 1, 'sineInOut')
        noteTweenAlpha('N5', 5, 1, 1, 'sineInOut')
        noteTweenAlpha('N6', 6, 1, 1, 'sineInOut')
        noteTweenAlpha('N7', 7, 1, 1, 'sineInOut')

        doTweenAlpha('T1', 'timeBarBG',1 ,1, 'sineInOut')
        doTweenAlpha('T2', 'timeBar',1 ,1, 'sineInOut')
        doTweenAlpha('T3', 'timeBarTxt',1 ,1, 'sineInOut')
    end
    if curStep == 192 then 
        setProperty('isCameraOnForcedPos', true)
        doTweenX('tween', 'camFollow',980, 1.4, 'quadInOut')
        doTweenAlpha('Balls', 'Shadow1', 1, 1, 'sineInOut')
        doTweenAlpha('Balls2', 'Shadow2', 1, 1, 'sineInOut')
        doTweenAlpha('Gone', 'Uhoh', 0, 1, 'sineInOut')
        doTweenAlpha('Balls7', 'Uhoh2', 0, 1, 'sineInOut')
        doTweenAlpha('lol', 'Shadow3', .3, 1, 'sineInOut')
    end
    if curStep == 208 then 
        setProperty('isCameraOnForcedPos', false)
        noteTweenAlpha('N0', 0, 1, 1, 'sineInOut')
        noteTweenAlpha('N1', 1, 1, 1, 'sineInOut')
        noteTweenAlpha('N2', 2, 1, 1, 'sineInOut')
        noteTweenAlpha('N3', 3, 1, 1, 'sineInOut')
        doTweenAlpha('Balls', 'Shadow1', 0, .01, 'sineInOut')
        doTweenAlpha('Balls2', 'Shadow2', 0, .01, 'sineInOut')
        doTweenAlpha('Gone', 'Uhoh', 1, .01, 'sineInOut')
        doTweenAlpha('Balls7', 'Uhoh2', .7, .01, 'sineInOut')
        doTweenAlpha('lol', 'Shadow3', 0, .01, 'sineInOut')
    end
    if curStep == 336 then 
        doTweenAlpha('Balls7', 'Uhoh2', 1, 1, 'sineInOut')
    end
    if curStep == 400 then 
        doTweenAlpha('Balls7', 'Uhoh2', .7, 1, 'sineInOut')
    end

    if curStep == 464 then 
        doTweenAlpha('Gone', 'Uhoh', 0, 12, 'sineInOut')
        callScript('scripts/VideoSpriteHandler', 'makeVideoSprite', {'MyWorld', 'MyWorld',0, 0, 'camOther', false})
        scaleObject('MyWorld', 1, 1)

    end
    if curStep == 524 then
      doTweenAlpha('light', 'flashwhite', 1, .6, 'sineInOut')
     end
    if curStep == 528 then 
        setProperty('MyWorld.alpha', 0)
        doTweenAlpha('light', 'flashwhite', 0, .1, 'sineInOut')
    end
    if curStep == 656 then 
        setProperty('Black.alpha',1)
        setProperty('1.alpha',1)
        doTweenAlpha('Tits', 'camHUD', 0, .5, 'linear')
    end
    if curStep == 657 then 
        setProperty('1.alpha',0)
    end 
    if curStep == 658 then 
        setProperty('2.alpha',1)
    end
    if curStep == 659 then 
        setProperty('2.alpha',0)
    end
    if curStep == 661 then 
        setProperty('3.alpha',1)
    end
    if curStep == 662 then 
        setProperty('3.alpha',0)
    end
    if curStep == 664 then 
        setProperty('4.alpha',1)
    end
    if curStep == 665 then 
        setProperty('4.alpha',0)
    end
    if curStep == 666 then 
        setProperty('5.alpha',1)
    end
    if curStep == 667 then
        setProperty('5.alpha',0)
        setProperty('6.alpha',1)
    end
    if curStep == 668 then 
        setProperty('6.alpha',0)
        setProperty('7.alpha',1)
    end
    if curStep == 669 then 
        setProperty('7.alpha',0)
        setProperty('8.alpha',1)
    end
    if curStep == 670 then 
        setProperty('8.alpha',0)
        setProperty('9.alpha',1)
        doTweenAlpha('Balls', 'Shadow1', 1, 1, 'sineInOut')
        doTweenAlpha('Balls2', 'Shadow2', 1, 1, 'sineInOut')
        doTweenAlpha('Balls3', 'droplet', 1, 1, 'sineInOut')
        doTweenAlpha('Balls4', 'secondtopgoop', 1, 1, 'sineInOut')
        doTweenAlpha('Balls5', 'sinkgoop', 1, 1, 'sineInOut')
        doTweenAlpha('Balls6', 'topgoop', 1, 1, 'sineInOut')
        doTweenAlpha('Balls7', 'Uhoh2', 0, 1, 'sineInOut')
        doTweenAlpha('lol', 'Shadow3', .3, 1, 'sineInOut')

        setProperty('HotDogGuy1.alpha', 0)
        setProperty('Corrupted_Masami.alpha', 1)
        setProperty('Masami.alpha', 0)
        setProperty('CorruptedHotDog.alpha', 1)
        setProperty('CarrieCorrupted.alpha', 1)
        setProperty('BananaDead.alpha', 1)
        setProperty('ToastDead.alpha', 1)
        setProperty('SarahDead.alpha', 1)
        setProperty('AllanDead.alpha', 1)
        setProperty('Allan.alpha', 0)
        setProperty('Carrie.alpha', 0)
        setProperty('Joe.alpha', 0)
        setProperty('Toast.alpha', 0)
        setProperty('Sarah.alpha', 0)
        setProperty('DeadTobias.alpha', 1)
        setProperty('tobias.alpha', 0)
        
    end
    if curStep == 671 then 
        setProperty('9.alpha',0)
        setProperty('10.alpha',1)
    end
    if curStep == 672 then 
        setProperty('Black.alpha',0)
        doTweenAlpha('Tits', 'camHUD', 1, .01, 'linear')
        setProperty('10.alpha',0)
    end
    if curStep == 924 then 
        setProperty('camGame.alpha', 0)
    end
    if curStep == 925 then 
        setProperty('camGame.alpha', 1)
    end
    if curStep == 926 then 
        setProperty('camGame.alpha', 0)
    end
    if curStep == 927 then 
        setProperty('camGame.alpha', 1)
    end
    if curStep == 962 then 
        doTweenAlpha('Tits', 'camHUD', 0, .1, 'linear')
    end
    if curStep == 974 then 
        doTweenAlpha('Tits', 'camHUD', 1, .5, 'linear')
    end
    if curStep == 980 then 
        doTweenAlpha('Tits', 'camHUD', 0, .1, 'linear')
    end
    if curStep == 988 then 
        doTweenAlpha('Tits', 'camHUD', 1, .5, 'linear')
    end
    if curStep == 1188 then 
        doTweenAlpha('1', 'Black', 1, .4, 'sineInOut')
    end
    if curStep == 1200 then 
        setProperty('Black.alpha',0)
        setProperty('boyfriend.colorTransform.greenOffset', 255)
        setProperty('boyfriend.colorTransform.redOffset', 255)
        setProperty('boyfriend.colorTransform.blueOffset', 255)
	    setProperty('dad.colorTransform.greenOffset', 255)
        setProperty('dad.colorTransform.redOffset', 255)
        setProperty('dad.colorTransform.blueOffset', 255)
        setProperty('gf.alpha', 0)
        setProperty('HotDogGuy1.alpha', 0)
        setProperty('CorruptedHotDog.alpha', 0)
        setProperty('CarrieCorrupted.alpha', 0)
        setProperty('BananaDead.alpha', 0)
        setProperty('ToastDead.alpha', 0)
        setProperty('SarahDead.alpha', 0)
        setProperty('AllanDead.alpha', 0)
        setProperty('Corrupted_Masami.alpha', 0)
        setProperty('Allan.alpha', 0)
        setProperty('Carrie.alpha', 0)
        setProperty('Joe.alpha', 0)
        setProperty('Toast.alpha', 0)
        setProperty('Sarah.alpha', 0)
        setProperty('DeadTobias.alpha', 0)
        setProperty('Tobias.alpha', 0)
        setProperty('BackWall.alpha', 0)
        setProperty('FrontWall.alpha', 0)
        setProperty('FrontWall.alpha', 0)
    end
    if curStep == 1328 then 
        doTweenAlpha('1', 'Black', 1, 1, 'sineInOut')
        doTweenAlpha('tits', 'camHUD', 0, 2.5, 'sineInOut')
    end

end

function onEndSong()
	if not allowEnd then
		startVideo('Credits');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end


