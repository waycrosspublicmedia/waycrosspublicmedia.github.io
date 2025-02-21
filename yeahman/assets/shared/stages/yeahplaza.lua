
local curTarget = "dad";

function onCreatePost()
	makeLuaSprite('bg-sky', 'stages/yeahplaza/bg-sky', -200, -600);
	setScrollFactor('bg-sky', 0.3, 0.3)
	addLuaSprite('bg-sky')

	makeLuaSprite('bg1', 'stages/yeahplaza/bg1', -2250, -1400);
	addLuaSprite('bg1')

    makeAnimatedLuaSprite('crowdL','stages/yeahplaza/kh-left', -800, 360)
    addAnimationByPrefix('crowdL','bop','kd-left instance 1',24,false)
    addLuaSprite('crowdL', true)
    scaleObject("crowdL",1.03,1.03)
    setObjectOrder('crowdL', 2)


    makeAnimatedLuaSprite('chairdude','stages/yeahplaza/chairdude', -1100, 550)
    addAnimationByPrefix('chairdude','bop','kieth-2 instance 1',24,false)
    addLuaSprite('chairdude', true)
    setObjectOrder('chairdude', 2)


    makeAnimatedLuaSprite('crowdR','stages/yeahplaza/kh-right', 660, 370)
    addAnimationByPrefix('crowdR','bop','kdright instance 1',24,false)
    addLuaSprite('crowdR', true)
    setObjectOrder('crowdR', 2)

    playAnim("crowdL","bop")
    playAnim("chairdude","bop")
    playAnim("crowdR","bop")

    makeAnimatedLuaSprite('crowdLF','stages/yeahplaza/kh-left-front', -1850, 800)
    addAnimationByPrefix('crowdLF','bop','Symbol 28 instance 1',24,false)
    setScrollFactor("crowdLF",1.1,1.1)
    addLuaSprite('crowdLF', true)


    makeAnimatedLuaSprite('crowdRF','stages/yeahplaza/kh-right-front', 1460, 870)
    addAnimationByPrefix('crowdRF','bop','Symbol 29 instance 1',24,false)
    setScrollFactor("crowdRF",1.1,1.1)
    addLuaSprite('crowdRF', true)
   
  
   



    makeAnimatedLuaSprite('fountainstage','stages/yeahplaza/fountain', -260, 190)
    addAnimationByPrefix('fountainstage','fountain','f-idle',24,true)
    addLuaSprite('fountainstage', true)
    setObjectOrder('fountainstage', 3)


    makeAnimatedLuaSprite('paint','stages/yeahplaza/yeayea', 300, 440)
    addAnimationByPrefix('paint','left','idle-left instance 1',24,true)
    addAnimationByPrefix('paint','right','idle-right instance 1',24,true)
    addAnimationByPrefix('paint','switch','idle-switch instance 1',24,false)
    scaleObject("paint", 0.8, 0.8)

    playAnim("paint", "left",true)
   
    addLuaSprite('paint', true)
    setObjectOrder('paint', 4)

    makeAnimatedLuaSprite('titlecard','stages/yeahplaza/titlecard', 240, 160)
    addAnimationByPrefix('titlecard','loop','title card instance 1',24,true)
    setObjectCamera('titlecard','other')
    scaleObject("titlecard",0.7,0.7)
    setProperty('titlecard.alpha', 0)


    setProperty('cameraSpeed', 999)
    doTweenY('camFollow.y', 'camFollow', -1400, 0.01, 'quadInOut') -- start pos 
    doTweenX('camFollow.X', 'camFollow', 470, 0.01, 'quadInOut') -- start pos
	doTweenZoom("zoomout", 'camGame', 1, 0.01,'quintInOut') -- start zoom

    

end


-- hi there this is nice 

function onSongStart()
	setProperty('isCameraOnForcedPos', true)
    setProperty('cameraSpeed', 999)
    doTweenY('camFollow.y', 'camFollow', -1400, 0.01, 'quadInOut') -- start pos 
    doTweenX('camFollow.X', 'camFollow', 470, 0.01, 'quadInOut') -- start pos
	doTweenZoom("zoomout", 'camGame', 1, 0.01,'quintInOut') -- start zoom
    addLuaSprite('titlecard', true)
    doTweenAlpha('comein', 'titlecard', 1, 2, 'linear')
end

function onStepHit()
    if curStep == 1 then
       doTweenY('camFollow.y', 'camFollow', 600, 20, 'quadInOut') -- endpoint pos
       doTweenZoom("zoomout", 'camGame', 0.4, 20,'quintInOut') -- endpoint zoom
    end
end

function onBeatHit() -- reverts stuff :]

    if curBeat == 16 then
        doTweenAlpha('comeout', 'titlecard', 0, 2, 'linear')
    end

    if curBeat == 33 then
        setProperty('cameraSpeed', 0.7)
        setProperty('isCameraOnForcedPos', false)
    end


   if curBeat % 2 == 0 then
   
    playAnim("crowdL","bop",true)
    playAnim("crowdR","bop",true)
    playAnim("crowdLF","bop",true)
    playAnim("crowdRF","bop",true)
    playAnim("chairdude","bop",true)
   end
    
end


--lua makes me want to kill myself

function onUpdate()

    if getProperty("paint.animation.curAnim.finished") == true and getProperty("paint.animation.curAnim.name") == "switch" then
    
       

        if curTarget == "dad"  then
        
            playAnim("paint", "left",true)
      
        else  
            playAnim("paint", "right",true)
    
        end

    end

  

end

function onMoveCamera(what)
   

    if curTarget == what then return end
    

    curTarget = what


    if curTarget == "dad"  then
        
        playAnim("paint", "switch",true)
  
    else  
        playAnim("paint", "switch",true,true)

    end




end

-- hi there this is nice 