function onCreate()

	makeLuaSprite('fatbg','blue/fatbg',-769.1,-409.6)
	makeLuaSprite('trashcan','blue/trashcan',362.8,-57.5)
	makeAnimatedLuaSprite('boombox','blue/boombox',719.6,57)
	addAnimationByIndices('boombox','idle','boombox','0',24)
	addAnimationByIndices('boombox','beat','boombox','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,27,28,29',24)
	addAnimationByPrefix('boombox','libera','boombox row',24,true)
	makeAnimatedLuaSprite('gameboy','blue/gameboy',692.9,178)
	addAnimationByIndices('gameboy','idle','gameboy','0',24)
	addAnimationByIndices('gameboy','chip','gameboy','2,3,4,5,6',24)
	addLuaSprite('fatbg',false)
	addLuaSprite('trashcan',false)
	addLuaSprite('boombox',false)
	addLuaSprite('gameboy',false)
	setProperty('boombox.visible',false)
	setScrollFactor('boombox',0.95,0.95)
	setScrollFactor('fatbg',0.95,0.95)
	setScrollFactor('gameboy',0.95,0.95)
	setScrollFactor('trashcan',0.95,0.95)
	
	
	makeAnimatedLuaSprite('bluethoughts','blue/bluethoughts',146.35,8.5)
	addAnimationByPrefix('bluethoughts','thought','bluethoughts',24,true)
	addLuaSprite('bluethoughts',false)
	setProperty('bluethoughts.alpha',0)
	makeAnimatedLuaSprite('nuthoughts','blue/nuthoughts',249.2,46.3)
	addAnimationByPrefix('nuthoughts','thought','nuthoughts',24,true)
	addLuaSprite('nuthoughts',false)
	setProperty('nuthoughts.alpha',0)
	
	
	makeAnimatedLuaSprite('bfthought','blue/bfthought',372.25,49.95)
	addAnimationByPrefix('bfthought','thought1','bf_thought1',24,true)
	addAnimationByPrefix('bfthought','thought2','bf_thought2',24,true)
	addLuaSprite('bfthought',false)
	setProperty('bfthought.alpha',0)
	makeAnimatedLuaSprite('gfthought','blue/gfthought',402.25,89.95)
	addAnimationByPrefix('gfthought','thought1','gfthought1',24,true)
	addAnimationByPrefix('gfthought','thought2','gfthought2',24,true)
	addLuaSprite('gfthought',false)
	setProperty('gfthought.alpha',0)
	setObjectOrder('gfGroup',getObjectOrder('bluethoughts'))
	
	
	
	
end
function onCreatePost()

	setScrollFactor('gf',0.95,0.95)

end

function onEvent(n,v1,v2)

	if n == "Kill Henchmen" then
		setProperty('boombox.visible',true)
		
	end
	if n == "Trigger BG Gouls" then
		cameraFade('camGame','000000',2,true)
		
	end
	if n == "Thought BF" then
		if v1 == 'off' then
		
			doTweenAlpha('rrr','bluethoughts',0,0.3)
			doTweenAlpha('rtrr','bfthought',0,0.3)
		else
		
			doTweenAlpha('rrr','bluethoughts',1,0.3)
			doTweenAlpha('rtrr','bfthought',1,0.3)
		end
		
		objectPlayAnimation('bfthought','thought'..v2)
		
	end
	if n == "Thought GF" then
		if v1 == 'off' then
		
			doTweenAlpha('rrr','nuthoughts',0,0.3)
			doTweenAlpha('rtrr','gfthought',0,0.3)
		else
		
			doTweenAlpha('rrr','nuthoughts',1,0.3)
			doTweenAlpha('rtrr','gfthought',1,0.3)
		end
		
		objectPlayAnimation('gfthought','thought'..v2)
		
	end

end

function onBeatHit()

	if getProperty('boombox.animation.curAnim.name') == "beat" then
		objectPlayAnimation('boombox','beat')
	end

end
function onStepHit()

	if getProperty('gameboy.animation.curAnim.name') == "chip" and curStep % 4 == 2 then
		objectPlayAnimation('gameboy','chip',true)
	end

end