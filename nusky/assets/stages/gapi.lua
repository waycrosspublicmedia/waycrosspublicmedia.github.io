function onCreate()

makeLuaSprite('skyy','gapi/sky',-874.25,-695)
addLuaSprite('skyy',false)
setScrollFactor('skyy',0,1)


makeLuaSprite('city','gapi/city',-874.25,-690)
addLuaSprite('city',false)
setScrollFactor('city',0.2,0.2)


makeLuaSprite('park','gapi/park',-674.65,-204.1)
addLuaSprite('park',false)
setScrollFactor('park',0.4,0.4)


makeLuaSprite('fence','gapi/fence',-900.5,78)
addLuaSprite('fence',false)
setScrollFactor('fence',0.7,0.7)


makeLuaSprite('sidewalk','gapi/sidewalk',-1040.75,470)
addLuaSprite('sidewalk',false)
setScrollFactor('sidewalk',0.8,0.8)


makeAnimatedLuaSprite('fountain','gapi/fountain',335.6,199.55)
addAnimationByPrefix('fountain','fountain','fountain',24,true)
addLuaSprite('fountain',false)
setScrollFactor('fountain',0.9,0.9)

makeAnimatedLuaSprite('ind','doctor/preindic',38,376)
addAnimationByIndices('ind','1','indicator','0,1,2,3,4,5,6,7',24)
addAnimationByIndices('ind','2','indicator','8,9,10,11,12,13,14,15',24)
addAnimationByIndices('ind','3','indicator','16,17,18,19,20,21,22,23',24)
addAnimationByIndices('ind','4','indicator','24,25,26,27,28,29,30,31',24)
addAnimationByIndices('ind','5','indicator','32,33,34,35,36,37,38,39',24)
addAnimationByIndices('ind','6','indicator','40,41,42,43,44,45,46,47',24)
addAnimationByIndices('ind','7','indicator','48,49,50,51,52,53,54,55',24)
setProperty('ind.alpha',false)
addLuaSprite('ind',false)
setObjectCamera('ind','camHUD')

end
function onEvent(n,v,b)

if n == 'STARLIGHTS!!!' then
	if v == 'off' then
		doTweenColor('a','skyy','000000',0.3)
		doTweenColor('b','park','000000',0.3)
		doTweenColor('c','fence','000000',0.3)
		doTweenColor('d','sidewalk','000000',0.3)
		doTweenColor('e','fountain','000000',0.3)
		doTweenColor('f','dad','000000',0.3)
		doTweenColor('g','boyfriend','000000',0.3)
		doTweenAlpha('h','ind',1,0.3)
	end
	if v == 'on' then
		doTweenColor('a','skyy','ffffff',0.3)
		doTweenColor('b','park','ffffff',0.3)
		doTweenColor('c','fence','ffffff',0.3)
		doTweenColor('d','sidewalk','ffffff',0.3)
		doTweenColor('e','fountain','ffffff',0.3)
		doTweenColor('e','fountain','ffffff',0.3)
		doTweenColor('f','dad','ffffff',0.3)
		doTweenColor('g','boyfriend','ffffff',0.3)
		doTweenAlpha('h','ind',0,0.3)
	end
end
end
function onCreatePost()

	setProperty('gf.visible',false)


end