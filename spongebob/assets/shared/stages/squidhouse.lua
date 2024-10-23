
function onCreate()
	sprite('squidhouse_sky', -1200, -420, 0.5)
	sprite('squidhouse_bgrocks', -1250, -600, 0.9)
	sprite('squidhouse_ground', -1300, -620, 1)
	sprite('squidhouse', -1300, -620, 1)

	makeAnimatedLuaSprite('Squidfard', 'stage_bg/squidward_house/squidfard', -1300 + 1698, -620 + 580)
	addAnimationByPrefix('Squidfard', 'squidward-enter', 'SquidwardAppear', 15, false)
	addAnimationByPrefix('Squidfard', 'squidwardIdle', 'Idle', 15, false)
	setProperty('Squidfard.visible', false)
	scaleObject('Squidfard', 0.74, 0.74)
	addLuaSprite('Squidfard')

	setProperty('squidhouse_bgrocks.antialiasing', false)
end

function sprite(t, x, y, sc)
	makeLuaSprite(t, 'stage_bg/squidward_house/'..t, x, y)
	setScrollFactor(t, sc, sc)
	scaleObject(t, 1.1, 1.1)
	addLuaSprite(t)
end

-- squidward bop shit --

local squidwardBop = false

function onBeatHit()
	if curBeat == 394 then setProperty('Squidfard.visible', true) playAnim('Squidfard', 'squidward-enter', true, false, 0) runTimer('squidbop', 1) end
	if curBeat == 491 then squidwardBop = false playAnim('Squidfard', 'squidward-enter', true, true, 0) runTimer('squidbopEnd', 1) end

	if squidwardBop and curBeat % 2 == 0 then playAnim('Squidfard', 'squidwardIdle', true, false, 0) end
end

function onTimerCompleted(t)
	if t == 'squidbop' then squidwardBop = true end
	if t == 'squidbopEnd' then squidwardBop = false removeLuaSprite('Squidfard', true) end
end