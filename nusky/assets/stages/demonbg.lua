randoShake = 0
timewait = 0
function onCreate()

makeAnimatedLuaSprite('bg','skybg/fatbg',-1417.15,-1041.5)
addAnimationByIndices('bg','still','fatbg','0',24)
addAnimationByPrefix('bg','jive','fatbg',24,true)
addAnimationByIndices('bg','static','fatbg','3',24)
addLuaSprite('bg')

makeAnimatedLuaSprite('static','skybg/staticbg',-1361.1,-681)
addAnimationByPrefix('static','static','staticbg',24,true)
addLuaSprite('static')
objectPlayAnimation('static','static',true)
setProperty('static.visible',false)
setProperty('static.alpha',0.4)
setBlendMode('static','add')

makeAnimatedLuaSprite('speaker','skybg/speaker',879.5,471.7)
addAnimationByPrefix('speaker','speaker','speaker',24,false)
addLuaSprite('speaker')
setScrollFactor('speaker',0.95,0.95)

end
function onStartSong()

objectPlayAnimation('speaker','speaker',true)

end
function onBeatHit()

objectPlayAnimation('speaker','speaker',true)



end

function onUpdatePost()
for i=0,3 do
	a = {defaultPlayerStrumX0,defaultPlayerStrumX1,defaultPlayerStrumX2,defaultPlayerStrumX3}
	b = {defaultPlayerStrumY0,defaultPlayerStrumY1,defaultPlayerStrumY2,defaultPlayerStrumY3}
	setPropertyFromGroup('playerStrums',i,'x',a[i+1]+getRandomInt(-randoShake,randoShake))
	setPropertyFromGroup('playerStrums',i,'y',b[i+1]+getRandomInt(-randoShake,randoShake))

end
for i=0,3 do
	a = {defaultOpponentStrumX0,defaultOpponentStrumX1,defaultOpponentStrumX2,defaultOpponentStrumX3}
	b = {defaultOpponentStrumY0,defaultOpponentStrumY1,defaultOpponentStrumY2,defaultOpponentStrumY3}
	setPropertyFromGroup('opponentStrums',i,'x',a[i+1]+getRandomInt(-randoShake,randoShake))
	setPropertyFromGroup('opponentStrums',i,'y',b[i+1]+getRandomInt(-randoShake,randoShake))

end

end

function onStepHit()

if timewait > 0 then timewait = 0 end
anims = {'still','jive','static'}


objectPlayAnimation('bg',anims[getRandomInt(1,3)])

end
function opponentHit(id,d,t,s)


objectPlayAnimation('bg','jive')



end

staton = false

function onEvent(n,v,b)

if n == 'Static' then
if timewait == 0 then
	randoShake = 0
	staton = staton == false

	if v == 'off' then staton = false end
	setProperty('static.visible',staton)
	
	if staton then
		randoShake = 10
		characterPlayAnim('scared','gf')
		characterPlayAnim('scared','bf')
	end
timewait = 1
end
end


end