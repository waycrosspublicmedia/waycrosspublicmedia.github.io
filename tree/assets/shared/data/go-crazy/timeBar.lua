

local fakeLength = 76820
-- how long you want the song to be (in milliseconds)

local trueLength = fakeLength

local timeBarTypes = {
    ['song name'] = function()
        return songName
    end,

    ['time left'] = function()
        return formatTime(fakeLength - (getSongPosition() - noteOffset))
    end,

    ['time elapsed'] = function()
        return formatTime(getSongPosition() - noteOffset)
    end
}

function lerp(a, b, c)
	return a + (b - a) * c
end

function boundTo(number, min, max)
    return math.max(min, math.min(max, number))
end

function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function onUpdatePost(elapsed)
    setProperty('songPercent', getSongPosition() / fakeLength)

    setTextString('timeTxt', timeBarTypes[timeBarType:lower()]() or nil)


    if getSongPosition() > trueLength then 
        fakeLength = lerp(songLength, fakeLength, boundTo(1 - (elapsed * 5), 0, 1))
    end
	
end