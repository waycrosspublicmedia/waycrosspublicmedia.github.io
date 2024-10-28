local arr

local setxOff = 50
local setyOff = -150
local setwOff = 180
local setzOff = -70
function onCreate()
	arr = getPropertyFromClass('ClientPrefs', 'comboOffset')
	setPropertyFromClass('ClientPrefs', 'comboOffset[0]',setxOff)
	setPropertyFromClass('ClientPrefs', 'comboOffset[1]',setyOff)
	setPropertyFromClass('ClientPrefs', 'comboOffset[2]',setwOff)
	setPropertyFromClass('ClientPrefs', 'comboOffset[3]',setzOff)
end

function onDestroy()
	setPropertyFromClass('ClientPrefs', 'comboOffset[0]',arr[1])
	setPropertyFromClass('ClientPrefs', 'comboOffset[1]',arr[2])
	setPropertyFromClass('ClientPrefs', 'comboOffset[2]',arr[3])
	setPropertyFromClass('ClientPrefs', 'comboOffset[3]',arr[4])
end
