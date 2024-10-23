function onCreate()

makeAnimatedLuaSprite('bg','og/bg',-212,-200)
	addAnimationByPrefix('bg','bg','bg',24,false)
	objectPlayAnimation('bg','bg',true)
	addLuaSprite('bg',false)
	setScrollFactor('bg',0,0.9)


	for i=1,5 do



		makeAnimatedLuaSprite('minisky'..i,'og/minisky',-234+(290*i),290)
		addAnimationByIndices('minisky'..i,'danceL','minisky '..i,'0,1,2,3,4,5,6,7',24)
		addAnimationByIndices('minisky'..i,'danceR','minisky '..i,'8,9,10,11,12,13,14,15',24)
		objectPlayAnimation('minisky'..i,'danceL',true)
		addLuaSprite('minisky'..i,false)
	
	end

end

function onCreatePost()

setProperty('gf.visible',false)

end


function onBeatHit()


	objectPlayAnimation('bg','bg',true)

	for i=1,5 do



		objectPlayAnimation('minisky'..i,'danceR',true)
		if curBeat % 2 == 0 then
			objectPlayAnimation('minisky'..i,'danceL',true)
		end
	
	end

end