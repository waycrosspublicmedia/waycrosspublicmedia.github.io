
-- thanks to my friend for helping out with this script

function onCreatePost()
	makeLuaSprite('extraHB', 'healthbar_utils/extra_hb', getProperty('healthBar.x') - 100, getProperty('healthBar.y') - 125)
    setObjectCamera('extraHB', 'camHUD')
	scaleObject('extraHB', 0.3, 0.3)
    addLuaSprite('extraHB')
	
    makeLuaSprite('iconP3', nil, getProperty('extraHB.x') + 10.5, getProperty('extraHB.y') - 7)
    loadGraphic('iconP3', 'icons/icon-patrick', 150)
    setObjectCamera('iconP3', 'camHUD')
	scaleObject('iconP3', 0.58, 0.58)
    addLuaSprite('iconP3')

    setObjectOrder('iconP3', getObjectOrder('uglyHB') + 1)
	setObjectOrder('extraHB', getObjectOrder('iconP3') - 1)
end

function onUpdate()
    local h = (getProperty('healthBar.percent') > 80)

    loadGraphic('iconP3', 'icons/icon-patrick', 150)
    addAnimation('iconP3', 'icons/icon-patrick', {h and 1 or 0, h and 0 or 1}, 0, true)
end