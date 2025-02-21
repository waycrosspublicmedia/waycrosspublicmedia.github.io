local ENABLED = true -- An on or off button I guess
local mania = false -- bar will be closer to player strums in middlescroll

local location = 'right' -- left, right, or center

local icons = {P1 = {['left'] = true}, P2 = {['right'] = true}}

local health = {['left'] = -230, ['right'] = 642, ['center'] = 364, y = 80}
local offset = {['left'] = 215,  ['right'] = -124, ['center'] = 215} -- for icons
function onCreatePost()
	setObjectOrder('timeBar', getObjectOrder('iconP2')+2)
	setObjectOrder('timeTxt', getObjectOrder('iconP2')+3)

 	setObjectOrder('healthBar', getObjectOrder('strumLineNotes') - 1)

	setObjectOrder('iconP1', getObjectOrder('strumLineNotes') - 1)
	setObjectOrder('iconP2', getObjectOrder('strumLineNotes') - 1)

	if ENABLED then
		if middlescroll and mania then
			health['left'] = health['left'] + 300
			health['right'] = health['right'] - 295
		end

		setProperty('iconP1.flipX', icons.P1[location] or false)
		setProperty('iconP2.flipX', icons.P2[location] or false)

		scaleObject('healthBar', 0.93, 0.93)

		setProperty('healthBar.angle', 90)
		screenCenter('healthBar', 'x')
		health['center'] = getProperty('healthBar.x') + 5

		setProperty('healthBar.x', health[location] or health['right'])
		setProperty('healthBar.y', health.y)
	end
end

local equationPart 
local per = 50;
function onUpdatePost(e)
	if ENABLED then
		updateHitbox('healthBar')
		
		per = math.min(math.lerp(per, getProperty('healthBar.percent'), (e * 10)), 100)
		setProperty('healthBar.percent', per)
		equationPart = (getProperty('healthBar.width') * per * (getProperty('healthBar.scale.y') * 0.0095)) -- the 0.0095 is to try to keep the icons from going past the screen
	
		local P1Mult = getProperty('healthBar.y') - (equationPart + (150 * getProperty('iconP1.scale.x') - 150)) + 550
		local P2Mult = getProperty('healthBar.y') - (equationPart - (150 * getProperty('iconP2.scale.x'))) + 300
	
		setProperty('iconP1.y', P1Mult + (getProperty('iconP1.offset.y') / 2))
		setProperty('iconP2.y', P2Mult + (getProperty('iconP2.offset.y') / 2))
		
		setProperty('iconP1.x', getProperty('healthBar.x') + offset[location])
		setProperty('iconP2.x', getProperty('healthBar.x') + offset[location])

		setProperty('iconP1.origin.y', -150)
		setProperty('iconP2.origin.y', 300)		
	end
end

function math.lerp(a, b, t)
    return (b - a) * t + a
end