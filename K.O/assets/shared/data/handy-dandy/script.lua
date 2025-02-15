function onCreate()

    makeLuaSprite('vignette', 'vignette', 0,0)
    addLuaSprite('vignette', true)
    setProperty('vignette.alpha', 1)
    setObjectCamera('vignette', 'game')
    setProperty('vignette.color', '20C20E')
    setScrollFactor('vignette',0,0)






    makeLuaSprite('blackScreen', '',0,0)
    makeGraphic('blackScreen',screenWidth*1.5,screenHeight*1.5,'78F7AA')
    setScrollFactor('blackScreen',0,0)
	addLuaSprite('blackScreen', false)
    setObjectOrder('blackScreen', getObjectOrder('gfGroup')+2)


    makeLuaSprite('dendyPic', 'dendyPic', 0,0)
    addLuaSprite('dendyPic', false)
    setScrollFactor('dendyPic',0,0)
    setProperty('dendyPic.alpha', 1)
    screenCenter('dendyPic', 'xy')
    setProperty('dendyPic.y', getProperty('dendyPic.y')+180)
    setObjectOrder('dendyPic', getObjectOrder('blackScreen')+1)

    makeLuaSprite('maskSquare', '',0,0)
    makeGraphic('maskSquare',400,300,'78F7AA')
    setScrollFactor('maskSquare',0,0)
	addLuaSprite('maskSquare', false)
    setObjectCamera('maskSquare', 'game')
    screenCenter('maskSquare', 'xy')
    setProperty('maskSquare.y', getProperty('maskSquare.y')+200)
    setObjectOrder('maskSquare', getObjectOrder('blackScreen')+2)
    

    makeLuaSprite('scanlines', 'scanlines', 0,0)
    addLuaSprite('scanlines', true)
    setScrollFactor('scanlines',0,0)
    setProperty('scanlines.alpha', 0.3)
    setObjectCamera('scanlines', 'other')

    setProperty('camHUD.alpha', 0)


end

prevLetter = ''
textLine = 0
function textScroll()
    textLine = textLine + 1  
    if(check==wordSize) then
        check=1
    end  
    local wordSize = string.len('If you are recording or streaming, we recommend you capture your monitor instead of the game window for this song.')
        splitWord = {}   
    for i=check, check do            
        splitWord[i] = string.sub('If you are recording or streaming, we recommend you capture your monitor instead of the game window for this song.', i, i)
        check= check +1;
        prevLetter = prevLetter .. splitWord[i]

        if wordSize > textLine then
        makeLuaText('text1', prevLetter .. '|', 980, 280, 260)
        setTextSize('text1', 51)
        setTextBorder('text1', 3, 'ffffff')
        setTextColor('text1', '20C20E')
        setProperty('text1.alpha', 0.6)
        setTextAlignment('text1', 'left')
        screenCenter('text1', 'x')
        setObjectCamera('text1', 'game')
        setTextFont('text1', 'arial.ttf')
        setProperty('text1.antialiasing', true)
        addLuaText('text1')
        end


    end


    
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setTextString('text1', prevLetter .. '|')
    elseif curBeat % 2 == 1 then
        setTextString('text1', prevLetter)
    end
end

function onUpdate()






end

function onSongStart()
    textScroll()
    runTimer('textTimer', 0.022)
end

function onTimerCompleted(n)
    if curStep == 32 then
        doTweenY('maskDown', 'maskSquare', getProperty('maskSquare.y')+300, 0.5, 'linear')
    end

    if curStep < 64 then
    if n == 'textTimer' then
        textScroll()
        runTimer('textTimer', 0.022)
    end
    end

end


function onStepHit()

end

function onTweenCompleted(n)

end