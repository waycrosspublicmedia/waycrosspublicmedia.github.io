function onCreatePost()
makeLuaSprite('box', nil, -200, 280);
makeGraphic('box', 50, 80, '000000');
scaleObject('box', 1, 1);
addLuaSprite('box', false)
setObjectCamera('box', 'other')
setProperty('box.scale.x', 13.4)
setProperty('box.scale.y', 1.3)
setProperty('box.alpha', 0.9)

makeLuaText('song', 'Garlic Soul', 0, 0, 0)
addLuaText('song')
setTextAlignment('song', 'center')
setTextSize('song', 20)
setObjectCamera('song', 'other')
setProperty('song.y', getProperty('box.y') + 5)
setProperty('song.x', getProperty('box.x') + 15)

makeLuaText('songby', 'Song: Srife5', 0, 0, 0)
addLuaText('songby')
setTextAlignment('songby', 'center')
setTextSize('songby', 20)
setObjectCamera('songby', 'other')
setProperty('songby.y', getProperty('box.y') + 45)
setProperty('songby.x', getProperty('box.x') + 15)

makeLuaText('chartby', 'Chart: Srife5, OrbyyOrbinaut', 0, 0, 0)
addLuaText('chartby')
setTextAlignment('chartby', 'center')
setTextSize('chartby', 20)
setObjectCamera('chartby', 'other')
setProperty('chartby.y', getProperty('box.y') + 65)
setProperty('chartby.x', getProperty('box.x') + 15)
end

function onUpdate()
setProperty('song.y', getProperty('box.y') + 5)
setProperty('song.x', getProperty('box.x') + 15)
setProperty('songby.y', getProperty('box.y') + 45)
setProperty('songby.x', getProperty('box.x') + 15)
setProperty('chartby.y', getProperty('box.y') + 65)
setProperty('chartby.x', getProperty('box.x') + 15)
end

function onSongStart() 
doTweenX('Credits', 'box', 200, 0.5, 'sineInOut')
runTimer('byeCred', 3)
end

function onTimerCompleted(t)
if t == 'byeCred' then
doTweenX('ByeCredits', 'box', -200, 0.5, 'sineInOut')
end
end