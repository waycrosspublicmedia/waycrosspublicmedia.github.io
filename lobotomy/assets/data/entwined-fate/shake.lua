local anchorpos = {};
local shake = 2;
local maxshake = 5
local transitionspeed = 0

function onSongStart()
	runTimer('countdown', 1, 9999)
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(anchorpos, {x,y})
    end
end
local floaty = 41.82;
local tailscircle = 'circle';

function onUpdate()
	floaty = floaty+0.03

	if tailscircle == 'hovering' or tailscircle == 'circle' then
		setCharacterY('dad', getCharacterY('dad')+math.sin(floaty) * 15.3);
	end
	if tailscircle == 'circle' then
		setCharacterX('dad', getCharacterX('dad')+math.cos(floaty) * 15.3);
	end
	if curStep == 0 then
		started = true
	 end
	 
	 songPos = getSongPosition()
	 local currentBeat = (songPos/5000)*(curBpm/60)
	 doTweenY('opponentmove', 'iconP2', (getProperty('iconP1.y')-10)- 100*math.sin((currentBeat+12*12)*math.pi), 2)
	 doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
	 doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)

	 local lol = math.random(1,4)
	if (lol >= 1) then
		doTweenAngle('tt', 'iconP2', -4, stepCrochet*0.00000000009, 'circOut')
	end
	if (lol >= 2) then
		doTweenAngle('tt', 'iconP2', -2, stepCrochet*0.00000000009, 'circOut')
	end
	if (lol >= 3) then
		doTweenAngle('tt', 'iconP2', 2, stepCrochet*0.00000000009, 'circOut')
	end
	if (lol >= 4) then
		doTweenAngle('tt', 'iconP2', 4, stepCrochet*0.00000000009, 'circOut')
	end
end


function onUpdatePost()
	setProperty('timeTxt.visible', true)
	setProperty('timeBar.y', getProperty('centerMark.y')+10)
	if curBeat < 424 then
		setProperty('timeTxt.y', getProperty('centerMark.y'))
		setProperty('centerMark.x', 70)
	end
	for i = 0,7 do
		setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
        setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
	end
	if difficultyName == 'Hell' then
		shake = 10
	end
	if sec > 9 then
        setProperty('timeTxt.text', min .. ':' .. sec)
	end
    if sec <= 9 then
        setProperty('timeTxt.text', min .. ':0' .. sec)
    end
	if curBeat == 424 then
		doTweenY('we2', 'timeTxt', 750, 2, "quartIn")
		doTweenAngle('we1', 'timeTxt', 50, 2, "quartIn")
	end
end
min = 2 --You will need to set this yourself
sec = 30 --You will need to set this yourself
function onTimerCompleted(tag)
    if tag == 'countdown' then
        if sec ~= -1 then
            sec = sec - 1
        end
        if sec == -1 then
            if min ~= 0 then
                min = min - 1
                sec = 59
            end
            if min == 0 and sec == 0 then
                return
            end
        end
    end
end

function onEvent(name, value1, value2)
    if name == 'changeTime' then
        sec = value1
        min = value2
    end
end