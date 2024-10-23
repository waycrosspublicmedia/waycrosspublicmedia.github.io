
function onCreate()
    makeLuaSprite('yellowGraphic','',-1000,-900)
	makeGraphic('yellowGraphic',4000,4000,'FFFF66')
	addLuaSprite('yellowGraphic',false)
    setObjectCamera('yellowGraphic','hud')
    setBlendMode('yellowGraphic','add')
    setProperty('yellowGraphic.alpha', 0.0001)

    makeLuaSprite('whiteBG','',-1000,-900)
	makeGraphic('whiteBG',4000,4000,'ffffff')
	addLuaSprite('whiteBG',false)
	setObjectCamera('whiteBG','hud')
	setBlendMode('whiteBG','add')
    setProperty('whiteBG.alpha', 0.0001)
end

function onTimerCompleted(t,l,ll)

    if t == 'beforeKameCharge' then
        characterPlayAnim('boyfriend', 'pre-attack', true)
        playSound('kame_base', 0.9)
        runTimer('beforeKaioken', 5.0)
    end

    if t == 'beforeKaioken' then
        playSound('kame_kaio', 0.9)
        runTimer('beforeSSJ', 7.0)
    end

    if t == 'beforeSSJ' then
        playSound('kame_ssj', 0.9)
        runTimer('beforeFullPower', 12.0)
    end

    if t == 'beforeFullPower' then
        playSound('kame_sparking', 0.9)
    end

end

function onCreatePost()

end


function onTweenCompleted(tag)

end

function onUpdate()

    if keyboardJustPressed('SPACE') then
        playSound('kame_whish', 0.9)
        runTimer('beforeKameCharge', 0.2)
        characterPlayAnim('boyfriend', 'attack', true)

        if getProperty('healthBar.percent') > 80 then
			playSound('dbz_charge_sparking', 0.8)
		end
    end

    if keyboardReleased('SPACE') then
        playSound('kame_fire', 0.9)
        cancelTimer('beforeKaioken')
        cancelTimer('beforeSSJ')
        cancelTimer('beforeFullPower')
        stopSound('kame_sparking')

    end
    
end



