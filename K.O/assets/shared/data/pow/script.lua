function onCreate()
    makeAnimatedLuaSprite('enidbackgroundbop', 'enidbackgroundbop', 250,175)
    addAnimationByIndices('enidbackgroundbop', 'enidLeft', 'idle', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14', 24)
    addAnimationByIndices('enidbackgroundbop', 'enidRight', 'idle', '15,16,17,18,19,20,21,22,23,24,25,26,27,28', 24)
    addLuaSprite('enidbackgroundbop', false)

    makeAnimatedLuaSprite('RAD_BGBOP', 'RAD_BGBOP', -355,100)
    addAnimationByPrefix('RAD_BGBOP', 'RAD_BGBOP', 'idle', 24, false)
    addLuaSprite('RAD_BGBOP', false)


	makeLuaSprite('fadeWhite', '', 0, 0);
	makeGraphic('fadeWhite',screenWidth*1.5,screenHeight*1.5,'FFFFFF')
	addLuaSprite('fadeWhite', false);
    setObjectCamera('fadeWhite', 'hud')


end

function onCreatePost()

end

function onSongStart()
    doTweenAlpha('fadeWhite', 'fadeWhite', 0, 5, 'sineIn')
    setObjectCamera('fadeWhite', 'other')
    setObjectCamera('letterbox', 'other')
    setProperty('camHUD.alpha',0)
end

function onStepHit()
    if curStep == 64 then
        doTweenAlpha('hudIn', 'camHUD', 1, 0.3, 'linear')
        setObjectCamera('letterbox', 'hud')
    end
end

function onUpdate()

end

local enidDance = false
function onBeatHit()
    if curBeat % 2 == 0 then
    objectPlayAnimation('RAD_BGBOP', 'RAD_BGBOP', false)
    end

    if enidDance == false then
        objectPlayAnimation('enidbackgroundbop', 'enidLeft', false)
        enidDance = true
    else
        objectPlayAnimation('enidbackgroundbop', 'enidRight', false)
        enidDance = false
    end



end

function onEvent(n)

end

function onTweenCompleted(tag)

end