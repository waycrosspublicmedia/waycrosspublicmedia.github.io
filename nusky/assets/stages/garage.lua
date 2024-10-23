nopass = true
function onStartCountdown()

	if nopass then
		makeAnimatedLuaSprite('intro','atlas/intro',-110.55,-92,'tex')
		addAnimationByPrefix('intro','intro','intro',24,false)
		addLuaSprite('intro')
		setObjectCamera('intro','other')
		nopass = false
startCountdown()
	makeLuaSprite('daog','daog',277,0)
	addLuaSprite('daog')
	setProperty('daog.alpha',0)
	setProperty('dad.danceEveryNumBeats',1)
	setProperty('gf.danceEveryNumBeats',1)
		setObjectCamera('daog','hud')
		runTimer('pass',0.55)
		return Function_Stop;
	else
	return Function_Continue;
	end

end
function onTimerCompleted(t,l,ll)

if t == 'pass' then

objectPlayAnimation('intro','intro',true)
end
end


function onStepHit()
	
	if curBeat == 9 then
	
		doTweenX('ddd','intro',-764.7,0.3,'sineInOut')
	
	end
	
	if curBeat == 16 then
	
		setObjectCamera('intro','hud')
		triggerEvent('Screen Shake','','3.5,0.01')
	
	end
	
	if curBeat == 19 then
	
		doTweenAlpha('dddf','daog',0.7,2,'linear')
	
	end
	if curBeat == 24 then
	
		setProperty('intro.visible',false)
		setProperty('daog.visible',false)
		
	
	end
	
	
	if curStep == 474  then
		setProperty('camGame.visible',false)
		setProperty('cmon.visible',true)
	
	end
	
	if curBeat == 54 or curBeat == 72  then
		setProperty('camGame.visible',false)
	
	end
	if curStep == 480 or curBeat == 56 or curBeat == 73 then
		setProperty('camGame.visible',true)
		setProperty('cmon.visible',false)
	
	end
	if curBeat == 356 then
	
		rank = 'bad'
		
		if ratingFC == 'SFC' then rank = 'epic' end
		
		if ratingFC == 'FC' or ratingFC == 'GFC' or ratingFC == 'SDCB' then rank = 'good' end
	
	
		makeLuaSprite('ending','endings/' .. rank ,0,0)
		scaleObject('ending',2,2)
		screenCenter('ending')
		setObjectCamera('ending','other')
		setProperty('ending.alpha',0)
		setProperty('ending.antialiasing',false)
		doTweenAlpha('dddwd','ending',1,1)
		
		addLuaSprite('ending',true)
	end
	
	
	



end

function onTweenCompleted(t)

if t == 'dddwd' then

--	doTweenColor('5d','ending','ffffff',0.4)
end

end

function onUpdatePost()
setProperty('bg.alpha',0.8)
if getRandomInt(0,40) == 1 then
setProperty('bg.alpha',0.3)
end
if getRandomInt(0,40) == 5 then
setProperty('bg.alpha',1)
end
if curBeat < 24 then
setProperty('intro.animation.curAnim.curFrame',math.floor((getSongPosition()/1000)*24))
end


setProperty('bg.angle',2*math.sin((getSongPosition()/crochet)))


end
function onCreate()

		makeAnimatedLuaSprite('cmon','cmon',-110.55,-92)
		addAnimationByPrefix('cmon','cmon','cmon',30,true)
		addLuaSprite('cmon',true)
		setObjectCamera('cmon','other')
		screenCenter('cmon')
		setProperty('cmon.visible',false)
			
		
	setProperty('skipCountdown',true)
	--setProperty('cpuControlled',true)
	setProperty('camZooming',true)
	makeLuaSprite('bg','bg',-361.35,-267.7)
	setProperty('bg.origin.x',907)
	setProperty('bg.origin.y',185)
	addLuaSprite('bg')

	makeLuaSprite('someBoard','someBoard',296,257)
	addLuaSprite('someBoard')

	makeLuaSprite('screenoverlay','screenoverlay',0,0)
	addLuaSprite('screenoverlay')
	setObjectCamera('screenoverlay','hud')


end