local characterPath = 'characters/happy snoopy assets' -- Picture File name of spreadsheet (must have .xml)
local characterTag = 'snoopyPlayer3' -- Set this to what the sprite should be named.

local noteName = '3rd Player' -- Change this to whatever your note is named in path "custom_notetypes".

local isDanceIdle = true -- If false, character sprite will use animation 'danceLeft' and 'danceRight'
local flipX = true -- If true, flips character.
local objectOrder = 9 -- Normally, values over 7 go over GF (7), Dad (8) and BF (9). (Default: 9)
local haveMissAnimations = false -- If true, it will add the miss animations for the character sprite to use.
local singAnimationLength = 7 -- How many steps until it goes back to idle.
local danceEveryNumBeats = 2 -- Sets which per beat will the character dance on.
local gfSpeed = 1 -- How many beats until danceLeft and danceRight dances. (If isDanceIdle is false.)
local characterFPS = 24 -- Default is 24, how many frames should the animation play?
local skipDance = false -- If true, it skips (stops) the dance on beat for the sprite.

local antialiasing = true -- If true, it will use antialiasing for the sprite which makes it more detailed.

local idleSuffix = '' -- Adding in the future! [Don't touch!]
local heyTimer = 0 -- Adding in the future!
local specialAnim = false -- Adding in the future! [Don't touch!]

local singIndices = false -- If true, it will create sing animations using indices instead of prefixes. (You have to put the indices yourself.)

local animNames = {
    'idle',

    'singLEFT', -- singLEFT
    'singDOWN', -- singDOWN
    'singUP', -- singUP
    'singRIGHT', -- singRIGHT

    'singLEFTmiss', -- singLEFT (MISS)
    'singDOWNmiss', -- singDOWN (MISS)
    'singUPmiss', -- singUP (MISS)
    'singRIGHTmiss', -- singRIGHT (MISS)

    'danceLeft',
    'danceRight',

    'cheer',
    'hey'
}

local animPrefixes = {
    'snoopy happy idle', -- Idle

    'snoopy happy right', -- Left
    'snoopy happy down', -- Down
    'snoopy happy up', -- Up
    'snoopy happy left', -- Right

    '', -- Left (MISS)
    '', -- Down (MISS)
    '', -- Up (MISS)
    '', -- Right (MISS)

    '', -- Dance LEFT (Indices if needed.)
    '' -- Dance RIGHT (Indices if needed.)
}

local characterAnimIndices = {
    '0, 1, 2, 3', -- Dance RIGHT Indices.
    '0, 1, 2, 3', -- Dance LEFT Indices.

    '0, 0, 0, 0, 0', -- Left (Change this if you're gonna set 'singIndices' to true.)
    '0, 0, 0, 0, 0', -- Down (Change this if you're gonna set 'singIndices' to true.)
    '0, 0, 0, 0, 0', -- Up (Change this if you're gonna set 'singIndices' to true.)
    '0, 0, 0, 0, 0' -- Right (Change this if you're gonna set 'singIndices' to true.)
}

local characterPos = {
    1000, -- X of character
    110 -- Y of character
}

local characterScales = {
    0.9, -- Scale X of character
    0.9 -- Scale Y of character
}

local characterOffsets = {
    -70, -330, -- Idle

    -3, -306, -- Left
    10, -386, -- Down
    6, -224, -- Up
    -56, -362, -- Right

    5, -6, -- Left (MISS)
    -20, -51, -- Down (MISS)
    -46, 27, -- Up (MISS)
    -48, -7, -- Right (MISS)

    0, 0, -- DanceRIGHT
    0, 0 -- DanceLEFT
}

function createCharacter(tag)
    characterName = tag

    makeAnimatedLuaSprite(tag, characterPath, characterPos[1], characterPos[2]);

    if isDanceIdle then
        addAnimationByPrefix(tag, animNames[1], animPrefixes[1], characterFPS, false);
    else
        addAnimationByIndices(tag, animNames[10], animPrefixes[10], characterAnimIndices[1], characterFPS);
        addAnimationByIndices(tag, animNames[11], animPrefixes[11], characterAnimIndices[2], characterFPS);
    end

    if not singIndices then
        addAnimationByPrefix(tag, animNames[2], animPrefixes[2], characterFPS, false);
        addAnimationByPrefix(tag, animNames[3], animPrefixes[3], characterFPS, false);
        addAnimationByPrefix(tag, animNames[4], animPrefixes[4], characterFPS, false);
        addAnimationByPrefix(tag, animNames[5], animPrefixes[5], characterFPS, false);
    else
        addAnimationByIndices(tag, animNames[2], animPrefixes[2], characterAnimIndices[3], characterFPS);
        addAnimationByIndices(tag, animNames[3], animPrefixes[3], characterAnimIndices[4], characterFPS);
        addAnimationByIndices(tag, animNames[4], animPrefixes[4], characterAnimIndices[5], characterFPS);
        addAnimationByIndices(tag, animNames[5], animPrefixes[5], characterAnimIndices[6], characterFPS);
    end

    if haveMissAnimations then
        addAnimationByPrefix(tag, animNames[6], animPrefixes[6], characterFPS, false);
        addAnimationByPrefix(tag, animNames[7], animPrefixes[7], characterFPS, false);
        addAnimationByPrefix(tag, animNames[8], animPrefixes[8], characterFPS, false);
        addAnimationByPrefix(tag, animNames[9], animPrefixes[9], characterFPS, false);
    end

    addOffset(tag, animNames[1], characterOffsets[1], characterOffsets[2]); -- Idle

    addOffset(tag, animNames[2], characterOffsets[3], characterOffsets[4]); -- singLEFT
    addOffset(tag, animNames[3], characterOffsets[5], characterOffsets[6]); -- singUP
    addOffset(tag, animNames[4], characterOffsets[7], characterOffsets[8]); -- singDOWN
    addOffset(tag, animNames[5], characterOffsets[9], characterOffsets[10]); -- singRIGHT

    addOffset(tag, animNames[6], characterOffsets[19], characterOffsets[20]); -- danceRIGHT
    addOffset(tag, animNames[7], characterOffsets[21], characterOffsets[22]); -- danceLEFT

    if haveMissAnimations then
        addOffset(tag, animNames[6], characterOffsets[11], characterOffsets[12]); -- singLEFT (MISS)
        addOffset(tag, animNames[7], characterOffsets[13], characterOffsets[14]); -- singUP (MISS)
        addOffset(tag, animNames[8], characterOffsets[15], characterOffsets[16]); -- singDOWN (MISS)
        addOffset(tag, animNames[9], characterOffsets[17], characterOffsets[18]); -- singRIGHT (MISS)
    end

    setProperty(tag .. '.flipX', flipX);
    setProperty(tag .. '.antialiasing', antialiasing)
    scaleObject(tag, characterScales[1], characterScales[2]);

    setObjectOrder(tag, objectOrder);

    addLuaSprite(tag, false); -- Set this to true if you want it to be in front of other sprites. (You can also use object order to set where the sprite should overlap.)

    setProperty(tag .. '.offset.x', characterOffsets[1]) -- Fix offsets when created.
    setProperty(tag .. '.offset.y', characterOffsets[2]) -- Fix offsets when created.
end

function onCreate()
    original_danceEveryNumBeats = danceEveryNumBeats -- Remember user's danceEveryNumBeats value to be used on resync of dance. (This is the way I found setting it, lol. I mean it works!1)
    luaDebugMode = true

    createCharacter(characterTag);
end

local holdTimer = 0 -- For onUpdate, don't touch this variable!

local danced = false -- Has the character danced for GF? (Works a bit differently than in Psych Engine?)

function onBeatHit()
    if curBeat % danceEveryNumBeats == 0 then
        danceEveryNumBeats = original_danceEveryNumBeats
    end

    if isDanceIdle then
        if curBeat % danceEveryNumBeats == 0 and not skipDance and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then
            dance()
            --holdTimer = 0
        end

    elseif not isDanceIdle then -- I did this differently than in Psych Engine. However, this works!
        if danced and not skipDance and curBeat % gfSpeed == 0 and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then -- no stepCrochet?
            dance()
            --holdTimer = 0

        elseif not danced and not skipDance and curBeat % gfSpeed == 0 and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then -- no stepCrochet?
            dance()
            --holdTimer = 0
        end
    end
end

function onUpdate(elapsed)
    if stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then
        holdTimer = holdTimer + elapsed
    end

    if flipX then 
        if holdTimer >= getPropertyFromClass('backend.Conductor', 'stepCrochet') * (0.0011 / getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')) * singAnimationLength then
            dance()
            holdTimer = 0
        end

    else
        if holdTimer > getPropertyFromClass('backend.Conductor', 'stepCrochet') * (0.0011 / getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')) * singAnimationLength and stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') and not stringEndsWith(getProperty(characterName .. '.animation.curAnim.name'), 'miss') then
            dance()
        end
    end

    if stringEndsWith(getProperty(characterName .. '.animation.curAnim.name'), 'miss') and getProperty(characterName .. '.animation.curAnim.finished') then
        playAnim(characterName, animNames[1], true, false, 10)
    end
end

function onCountdownStarted()
    runTimer('startCharacterTimer', getPropertyFromClass('backend.Conductor', 'crochet') / 1000 / playbackRate, 5) -- lol (will a loop of 5 be an issue?)
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote) 
    if noteType == noteName then
        playAnim(characterName, animNames[noteData + 2], true);
        holdTimer = 0

    elseif noteType == noteName and not isDanceIdle then
        --playAnim(characterName, animNames[noteData + 2], true); -- uhhh is this needed?

        if getProperty(characterName .. '.animation.curAnim.name') == animNames[2] then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == animNames[5] then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == animNames[4] or getProperty(characterName .. '.animation.curAnim.name') == animNames[3] then
            if not danced then
                danced = true
            else
                danced = false
            end
        end
    end

    if noteType == noteName and isSustainNote then
        
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote) 
    if noteType == noteName then
        playAnim(characterName, animNames[noteData + 2], true);
        holdTimer = 0

    elseif noteType == noteName and not isDanceIdle then
        --playAnim(characterName, animNames[noteData + 2], true); -- uhhh is this needed?

        if getProperty(characterName .. '.animation.curAnim.name') == animNames[2] then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == animNames[5] then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == animNames[4] or getProperty(characterName .. '.animation.curAnim.name') == animNames[3] then
            if not danced then
                danced = true
            else
                danced = false
            end
        end
    end

    if noteType == 'BF and P2 duet' then
        playAnim(characterName, animNames[noteData + 2], true);
        holdTimer = 0

    elseif noteType == 'BF and P2 duet' and not isDanceIdle then
        --playAnim(characterName, animNames[noteData + 2], true); -- uhhh is this needed?

        if getProperty(characterName .. '.animation.curAnim.name') == animNames[2] then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == animNames[5] then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == animNames[4] or getProperty(characterName .. '.animation.curAnim.name') == animNames[3] then
            if not danced then
                danced = true
            else
                danced = false
            end
        end
    end

    if noteType == noteName and isSustainNote then

    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == noteName and haveMissAnimations then
        playAnim(characterName, animNames[noteData + 6], true)
        recalculateDanceIdle()
    end

    if noteType == noteName and isSustainNote and haveMissAnimations then
        recalculateDanceIdle()
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startCharacterTimer' then
        if isDanceIdle and luaSpriteExists(characterName) and loopsLeft % danceEveryNumBeats == 0 and getProperty(characterName .. '.animation.curAnim') then
            dance()

        elseif not isDanceIdle and luaSpriteExists(characterName) and loopsLeft % gfSpeed == 0 and getProperty(characterName .. '.animation.curAnim') then -- gfSpeed and not round(gfSpeed * danceEveryNumBeats)? lol
            dance()
        end
    end
end

local settingCharacterUp = true
function recalculateDanceIdle() -- Does settingCharacterUp & lastDance variable be needed for this? (Psych Engine does this but it seems to be fine without it? I don't know.)
    local lastDanceIdle = isDanceIdle
    isDanceIdle = (getProperty(characterName .. '.animation.curAnim.name') == animNames[10] and getProperty(characterName .. '.animation.curAnim.name') == animNames[11])

    if settingCharacterUp then
        danceEveryNumBeats = (isDanceIdle == 1 and 1 or 2) -- isDanceIdle == 1 or 2?
    elseif not lastDanceIdle == isDanceIdle then
        local danceEveryNumBeatsCalc = danceEveryNumBeats

        if not isDanceIdle and danceEveryNumBeats < 4 then -- Prevent going high values on danceEveryNumBeats. (sometimes breaks, figure out a way)
            danceEveryNumBeatsCalc = danceEveryNumBeatsCalc / 2
        elseif isDanceIdle and danceEveryNumBeats < 4 then -- Prevent going high values on danceEveryNumBeats. (sometimes breaks, figure out a way)
            danceEveryNumBeatsCalc = danceEveryNumBeatsCalc * 2
    
            danceEveryNumBeats = round(math.max(danceEveryNumBeatsCalc, 1))
            --debugPrint('Round handled: ' .. danceEveryNumBeats)
    
            -- this is so dumb because you just need to set danceEveryNumBeats to 4 on recalculateDanceIdle and boom, amazing issue fixed (i might be wrong on this statement.)
        end
        settingCharacterUp = false
    end
end

function dance()
    if not skipDance and not specialAnim then
        if not isDanceIdle then

            if not danced then
                danced = true
            else
                danced = false
            end

            if danced then -- no stepCrochet?
                playAnim(characterName, animNames[11], true);
                holdTimer = 0
    
            elseif not danced then -- no stepCrochet?
                playAnim(characterName, animNames[10], true);
                holdTimer = 0
            end

        elseif isDanceIdle then
            playAnim(characterName, animNames[1], false);
        end
    end
end


-- http://lua-users.org/wiki/SimpleRound -- Second code.
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- resync idle dance better like for normal boyfriend in the game. [DONE]

-- when 3rd character misses, it works a bit differently. (try to look how it works in character.hx/somewhere of psych engine github) (do i even fix this? its ok but eh i might fix it)
-- when idle is offseted, when 3rd character bops for the 1st time, it offsets (is there a way to fix this?)

-- a timer doesnt seem to be needed for Note Misses. (it might be needed (doesn't show in source code? look more idk), idk if it solves quick idle with recalculateDanceIdle. look onto it.)