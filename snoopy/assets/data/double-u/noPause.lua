function onCreate()
  makeLuaSprite('NoPauseGoku', 'easter eggs/Goku',-100, -80)
  addLuaSprite('NoPauseGoku', true)
  setObjectCamera('NoPauseGoku', 'other')
  scaleObject('NoPauseGoku', 1.3, 1.3 )
  setProperty('NoPauseGoku.visible', false);
end

function onPause()
  playSound('no_no', 1)
  setProperty('NoPauseGoku.visible', true);
  setProperty('NoPauseGoku.alpha', 1);
  objectPlayAnimation('NoPuedesDetenerte','idle',false)
	runTimer('niceTry',0.5)
	return Function_Stop;
end

function onTimerCompleted(tag)
   if tag == 'niceTry' then
    doTweenAlpha('neverAgain', 'NoPauseGoku', 0, 0.3, 'linear');
    end
end