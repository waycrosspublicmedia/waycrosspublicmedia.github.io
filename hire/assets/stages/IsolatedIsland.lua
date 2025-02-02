function onCreate()
	-- background shit
	makeLuaSprite('bg', 'dsidesbg/dbg', -2000, -1800)
	scaleObject('bg', 8, 8)
	setLuaSpriteScrollFactor('bg', 0.9, 0.9);
	setProperty('bg.antialiasing',false)

	makeLuaSprite('floor', 'dsidesbg/dfloor', -2000, -1800)
	scaleObject('floor', 8, 8)
	setProperty('floor.antialiasing',false)

	makeLuaSprite('sky1', 'dsidesbg/dsky1', -2000, -1800)
	scaleObject('sky1', 8, 8)
	setProperty('sky1.antialiasing',false)
	setLuaSpriteScrollFactor('sky1', 0.3, 0.3);

	makeLuaSprite('sky2', 'dsidesbg/dsky2', -2000, -1800)
	scaleObject('sky2', 8, 8)
	setProperty('sky2.antialiasing',false)
	setLuaSpriteScrollFactor('sky2', 0.5, 0.5);

	makeLuaSprite('sky3', 'dsidesbg/dsky3', -2000, -1800)
	scaleObject('sky3', 8, 8)
	setProperty('sky3.antialiasing',false)
	setLuaSpriteScrollFactor('sky3', 0.7, 0.7);

	makeLuaSprite('sky4', 'dsidesbg/dsky4', -2000, -1800)
	scaleObject('sky4', 8, 8)
	setProperty('sky4.antialiasing',false)
	setLuaSpriteScrollFactor('sky4', 0.8, 0.8);

	makeLuaSprite('sky5', 'dsidesbg/dsky5', -2000, -1800)
	scaleObject('sky5', 8, 8)
	setProperty('sky5.antialiasing',false)
	setLuaSpriteScrollFactor('sky5', 0.9, 0.9);

	makeLuaSprite('capsule', 'dsidesbg/gflol', 340, 70)
	scaleObject('capsule', 8, 8)
	setProperty('capsule.antialiasing',false)

	makeLuaSprite('dark', 'dsidesbg/gflol', -2000, -1800)
	makeGraphic('dark', 4960, 3480, '342666')
	setBlendMode('dark', 'multiply')
	setProperty('dark.alpha', 0)
	
	addLuaSprite('bg', false)
	addLuaSprite('sky1', false)
	addLuaSprite('sky2', false)
	addLuaSprite('sky3', false)
	addLuaSprite('sky4', false)
	addLuaSprite('sky5', false)
	addLuaSprite('floor', false)
	addLuaSprite('capsule', false)
	addLuaSprite('dark', false)
	

end

function onCreatePost()

	setProperty('gf.visible',false)
end

function onStepHit()

	if curStep == 796 then
		doTweenAlpha('darkon', 'dark', 0.5, 1, 'linear')
	end
	if curStep == 924 then
		doTweenAlpha('darkoff', 'dark', 0, 1, 'linear')
	end
end