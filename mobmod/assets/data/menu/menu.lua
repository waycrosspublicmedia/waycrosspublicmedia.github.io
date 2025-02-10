function onSongStart()
openCustomSubstate('manu', true)
end
function onCustomSubstateCreatePost(name)
delayTimer = 0
frameTimer = 0
numAngle = 1
songPosition = 0
curStep = 0
curBeat = 0
lastCurStep = 0
if name == 'manu' then

setProperty('camHUD.visible')
setProperty('camGame.visible')

makeLuaSprite('titleBG', 'titleBG', 94, 0)
setObjectCamera('titleBG', 'camOther')
addLuaSprite('titleBG', true)
scaleObject('titleBG', 1.2, 1.2)
screenCenter('titleBG')
setProperty('titleBG.x', getProperty('titleBG.x')+94)

makeLuaSprite('PreTitleBG', 'PreTitleBG', 94, 0)
setObjectCamera('PreTitleBG', 'camOther')
addLuaSprite('PreTitleBG', true)
setProperty('PreTitleBG.alpha', 0)
scaleObject('PreTitleBG', 1.2, 1.2)
screenCenter('PreTitleBG')
setProperty('PreTitleBG.x', getProperty('PreTitleBG.x')+94)

makeLuaSprite('aspectBars', 'aspect bars/aspectBars', 94, 0)
setObjectCamera('aspectBars', 'camOther')
addLuaSprite('aspectBars', true)

makeLuaSprite('buttonEnter')
loadGraphic('buttonEnter', 'mcButton/button_large', 200, 20)
setObjectCamera('buttonEnter', 'camOther')
addAnimation('buttonEnter', 'static', {0}, 0, false)
addAnimation('buttonEnter', 'press', {1, 2}, 12, false)
addAnimation('buttonEnter', 'static_press', {2}, 0, false)

scaleObject('buttonEnter', 2.5, 2.5)
screenCenter('buttonEnter')
setProperty('buttonEnter.x', screenWidth - 600+94)
setProperty('buttonEnter.y', screenHeight - 135)
addLuaSprite('buttonEnter', true)

makeAnimatedLuaSprite('charaterTitle','mobs')
addAnimationByPrefix('charaterTitle', 'idle', 'mobs idle', 24, true)
setObjectCamera('charaterTitle', 'camOther')
scaleObject('charaterTitle', 0.6, 0.6)
screenCenter('charaterTitle')
setProperty('charaterTitle.x', getProperty('charaterTitle.x')+94)
setScrollFactor('charaterTitle', 1, 1)
addLuaSprite('charaterTitle', true)

makeLuaSprite('blackBarLeft', 'hudAssets/blackTop', -106)
setObjectCamera('blackBarLeft', 'camOther')
setScrollFactor('blackBarLeft')
addLuaSprite('blackBarLeft', true)
makeGraphic('blackBarLeft', 200, 720, '000000')

makeLuaSprite('blackBarRight', 'hudAssets/blackTop', 1280+94)
setObjectCamera('blackBarRight', 'camOther')
setScrollFactor('blackBarRight')
addLuaSprite('blackBarRight', true)
makeGraphic('blackBarRight', 200, 720, '000000')

playMusic('freakyMenu', 0.8, true)
end
end
function onCustomSubstateUpdate(name, elapsed)
if name == 'manu' then
songPosition = (songPosition + elapsed) / ((60/102))/4
if lastCurStep ~= curStep then
lastCurStep = curStep
end
curStep = lastCurStep + math.floor(songPosition)
curBeat = math.floor(curStep/4)
end
end
function onCustomSubstateUpdatePost(name, elapsed)
if name == 'manu' then
if (getMouseX('camOther') >= getProperty('buttonEnter.x') and getMouseX('camOther') <= (getProperty('buttonEnter.x') + getProperty('buttonEnter.width')) and getMouseY('camOther') >= getProperty('buttonEnter.y') and getMouseY('camOther') <= (getProperty('buttonEnter.y') + getProperty('buttonEnter.height'))) then
if getProperty('buttonEnter.animation.curAnim.name') ~= 'press' or getProperty('buttonEnter.animation.curAnim.name') ~= 'static_press' then
playAnim('buttonEnter', 'press')
end
if getProperty('buttonEnter.animation.curAnim.name') == 'press' then
if getProperty('buttonEnter.animation.finished') then
playAnim('buttonEnter', 'static_press')
end
end
if mouseClicked('left') then
playSound('TitleSelect')
exitSong()
end
else
playAnim('buttonEnter', 'static')
end
frameTimer = frameTimer + elapsed
if frameTimer > 0.0416666667 then
frameTimer = frameTimer - 0.0416666667
setProperty('charaterTitle.animation.curAnim.curFrame', getProperty('charaterTitle.animation.curAnim.curFrame')+1)
end
setProperty('titleBG.angle', getProperty('PreTitleBG.angle'))
delayTimer = delayTimer + 0.416666667
if delayTimer % 0.416666667 == 0 then
if getProperty('charaterTitle.animation.curAnim.curFrame') >= 25 then
setProperty('charaterTitle.animation.curAnim.curFrame', 0)
end
numAngle = -numAngle
setProperty('PreTitleBG.angle', 5 * numAngle)
setProperty('titleBG.angle', 5 * numAngle)
doTweenAngle('PreTitleBG', 'PreTitleBG', 0, 0.5, 'circOut')
setProperty('titleBG.alpha', 1)
doTweenAlpha('titleBG', 'titleBG', 0.5, 0.3, 'quadOut')
end
end
end