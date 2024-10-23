local allowCountdown = false
local incutscene = false
local curDialogue = 1
local data = {{{}}}
local turns =   {0,1,1,0,1,0,0}
local diasDAD = {1,0,0,2,0,3,4}
local diasBF =  {0,1,2,0,3,0,0}
local animsDAD ={1,0,0,2,2,3,3}
local animsBF = {1,1,2,0,3,0,0}
local waittospeak = true
local bfanims = {'dia1','dia2','dia1'}
local dadanims = {'singLEFT','singRIGHT','singUP'}
function onStartCountdown()
	if not allowCountdown and not isStoryMode then
	setProperty('camHUD.visible',false)
		makeAnimatedLuaSprite('dialogue1','chan/skyblue_dialogue',409,12)
		addAnimationByIndices('dialogue1','open','textblue','0,1',12)
		addAnimationByIndices('dialogue1','dia1','textblue','2,3,4,5,6,7',24)
		addAnimationByIndices('dialogue1','dia2','textblue','10,11,12,13,14,15',24)
		addAnimationByIndices('dialogue1','dia3','textblue','19,20,21,22,23,23',24)
		addAnimationByIndices('dialogue1','dia4','textblue','26,27,28,29,30,31',24)
		addLuaSprite('dialogue1',true)

		makeAnimatedLuaSprite('dialogue2','chan/nusky_dialogue',456,80)
		addAnimationByIndices('dialogue2','open','textsky','0,1',12)
		addAnimationByIndices('dialogue2','dia1','textsky','2,3,4,5,6,7',24)
		addAnimationByIndices('dialogue2','dia2','textsky','10,11,12,13,14,15',24)
		addAnimationByIndices('dialogue2','dia3','textsky','19,20,21,22,23,23',24)
		addLuaSprite('dialogue2',true)
		
		incutscene = true
		allowCountdown = true
		setProperty('inCutscene', true);
		setProperty('camGame.zoom', 1.3);
		playMusic('chan-site',1,true)
		allowCountdown = true;
doDialogue()

		return Function_Stop;

	end
	setProperty('camHUD.visible',true)
	setProperty('dialogue1.visible',false)
	setProperty('dialogue2.visible',false)
	return Function_Continue;





end
function onUpdatePost()
	if incutscene then
	if keyJustPressed('space') or keyJustPressed('accept') then
		curDialogue = curDialogue + 1
		if curDialogue == 8 then
			incutscene = false
			runTimer('startC',1)
			setProperty('dialogue1.visible',false)
			setProperty('dialogue2.visible',false)
		else
			doDialogue()
			triggerEvent('Camera Follow Pos','','')
		end
	end
	
	if not waittospeak then
	if getProperty('dialogue1.animation.curAnim.name') == 'open' and getProperty('dialogue1.animation.curAnim.finished') then
		objectPlayAnimation('dialogue1','dia'..diasDAD[curDialogue])
	end
	if getProperty('dialogue2.animation.curAnim.name') == 'open' and getProperty('dialogue2.animation.curAnim.finished') then
		objectPlayAnimation('dialogue2','dia'..diasBF[curDialogue])
	end
	objectPlayAnimation('dialogue1',getProperty('dialogue1.animation.curAnim.name'))
	objectPlayAnimation('dialogue2',getProperty('dialogue2.animation.curAnim.name'))
	end
		
	end

end

function onTimerCompleted(t,l,ll)

	if t == 'startC' then
		startCountdown();
	end

	if t == 'dadspeak' then
	setProperty('dialogue1.visible',true)
	setProperty('dialogue2.visible',false)
		waittospeak = false
		objectPlayAnimation('dialogue1','open');
	end
	if t == 'bfspeak' then
	setProperty('dialogue1.visible',false)
	setProperty('dialogue2.visible',true)
		waittospeak = false
		objectPlayAnimation('dialogue2','open');
	end

end

function reSet(max)
	for i = 0, max, 1 do
		data[i] = {{}};
	end
end

function doDialogue()
	setProperty('dialogue1.visible',false)
	setProperty('dialogue2.visible',false)
if animsBF[curDialogue] then
	characterPlayAnim('dad','dia'..animsDAD[curDialogue])
	characterPlayAnim('boyfriend','dia'..animsBF[curDialogue])
end

if turns[curDialogue] == 1 then
	doTweenX('c','camFollowPos',840,1.1,'sineOut')
	doTweenY('cc','camFollowPos',270,1.1,'sineOut')
	waittospeak = true
	runTimer('bfspeak',0.8)
else
	doTweenX('c','camFollowPos',420,1.1,'sineOut')
	doTweenY('cc','camFollowPos',270,1.1,'sineOut')
	waittospeak = true
	runTimer('dadspeak',0.8)
end


end