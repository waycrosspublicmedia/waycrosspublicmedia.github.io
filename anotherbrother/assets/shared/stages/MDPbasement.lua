local helped = 0
local helpTime = false
local goodEnding = false
local playedOnce = false
local playedOnceOther = false
local healthFormat = false

function onCreate()
	precacheImage('stages/lightbulb')
    precacheImage('stages/basement')
    precacheImage('stages/box')
	precacheImage('stages/btrees')
	precacheImage('stages/ftrees')
	precacheImage('stages/horizon')
	precacheImage('stages/MDPlightbulb')
	precacheImage('stages/maxbox')
	precacheImage('stages/shortsoverlay')

	makeLuaSprite('bg23','stages/bg23',-571,-441)
	makeAnimatedLuaSprite('MDPlightbulb','stages/MDPlightbulb',182,-156)
	makeLuaSprite('maxbox','stages/maxbox',-571,89)
	addAnimationByPrefix('MDPlightbulb','idle','Frame_',24,true)
	objectPlayAnimation('MDPlightbulb','idle')
	makeLuaSprite('MDPoverlay','stages/shortsoverlay', 0,0)

	scaleObject('MDPlightbulb',0.79,0.79)
	setGraphicSize('maxbox',675,789)
	setGraphicSize('bg23',2220,1448)
	setObjectCamera('MDPoverlay','hud')

	addLuaSprite('bg23',false)
	addLuaSprite('MDPlightbulb',false)
	addLuaSprite('maxbox',true)
	addLuaSprite('MDPoverlay',true)

	makeLuaSprite('button', 'help', 0, 0)
    setObjectCamera('button', 'other')
    addLuaSprite('button', true)
    scaleObject('button', 0.3, 0.3)
    screenCenter('button')
	setProperty('button.y', getProperty('button.y')-250)
	setProperty('button.alpha', '0')

	makeLuaSprite('basement','stages/basement',-571,-411)
	makeAnimatedLuaSprite('lightbulb','stages/lightbulb',182,-126)
	makeLuaSprite('box','stages/box',-571,119)
	addAnimationByPrefix('lightbulb','idle','Frame_',24,true)
	objectPlayAnimation('lightbulb','idle')
	
	scaleObject('lightbulb',0.79,0.79)
	setGraphicSize('box',675,789)
	setGraphicSize('basement',2220,1301)

	makeLuaSprite('horizon','stages/horizon',-750,-600)
    makeLuaSprite('back trees','stages/btrees',-600,-600)
    makeLuaSprite('front trees','stages/ftrees',-900,-300)

	makeLuaSprite('leDark', 'BlackFlash',-571,-441)
	scaleObject('leDark', 2, 2)
    addLuaSprite('leDark', true)
	setScrollFactor("leDark", 1.0, 1.0)
	setProperty('leDark.alpha', '1')

	makeLuaSprite('doorDo', 'boxRoom/door_dark',0,0)
	setObjectCamera('doorDo', 'hud')
    addLuaSprite('doorDo', true)
	scaleObject('doorDo', 0.01, 0.01)
	screenCenter('doorDo')
	setProperty('doorDo.alpha', '0')

	--healthbar

	makeLuaSprite('hbBase', 'HB/hb1', 0, 600)
	setObjectCamera('hbBase', 'hud')
    addLuaSprite('hbBase', true)

	makeLuaSprite('hb1', 'HB/hb2', 0, 600)
	setObjectCamera('hb1', 'hud')
    addLuaSprite('hb1', true)

	makeLuaSprite('hb2', 'HB/hb3', 0, 600)
	setObjectCamera('hb2', 'hud')
    addLuaSprite('hb2', true)

	makeLuaSprite('hb3', 'HB/hb4', 0, 600)
	setObjectCamera('hb3', 'hud')
    addLuaSprite('hb3', true)

	makeLuaSprite('hb4', 'HB/hb5', 0, 600)
	setObjectCamera('hb4', 'hud')
    addLuaSprite('hb4', true)

	makeLuaSprite('hb5', 'HB/hb6', 0, 600)
	setObjectCamera('hb5', 'hud')
    addLuaSprite('hb5', true)

	makeLuaSprite('icon1', 'HB/icon1', 320, 560)
	scaleObject('icon1', 0.2,  0.2)
	setObjectCamera('icon1', 'hud')
    addLuaSprite('icon1', true)
	makeLuaSprite('icon2', 'HB/icon2', 320, 560)
	scaleObject('icon2', 0.2,  0.2)
	setObjectCamera('icon2', 'hud')
    addLuaSprite('icon2', true)

	screenCenter('hbBase', "x")
	screenCenter('hb1', "x")
	screenCenter('hb2', "x")
	screenCenter('hb3', "x")
	screenCenter('hb4', "x")
	screenCenter('hb5', "x")
	screenCenter('icon1', "x")
	screenCenter('icon2', "x")

	if downscroll == true then
		setProperty('icon2.y', '5')
		setProperty('icon1.y', '5')
		setProperty('hbBase.y', '45')
		setProperty('hb1.y', '45')
		setProperty('hb2.y', '45')
		setProperty('hb3.y', '45')
		setProperty('hb4.y', '45')
		setProperty('hb5.y', '45')
	end

	-- others

	makeLuaSprite('endDark', 'BlackFlash',-571,-441)
	scaleObject('endDark', 2, 2)
	setObjectCamera('endDark', 'hud')
    addLuaSprite('endDark', false)
	setProperty('endDark.alpha', '0')
	screenCenter('endDark')

	makeLuaSprite('badend', 'allmyfault', 0, 0)
    setObjectCamera('badend', 'other')
    addLuaSprite('badend', true)
    screenCenter('badend')
	setProperty('badend.alpha', '0')

	makeLuaSprite('goodend', 'alaskapostcardold', 0, 0)
    setObjectCamera('goodend', 'other')
    addLuaSprite('goodend', true)
    screenCenter('goodend')
	setProperty('goodend.alpha', '0')

	setProperty("skipCountdown", true)
end

function onSongStart()
	doTweenAlpha("doorooo", "doorDo", 1, 19.69, "linear")	
	doTweenX("dooroooo", "doorDo.scale", 1, 19.69, "linear")	
	doTweenY("doorooooo", "doorDo.scale", 1, 19.69, "linear")	
end
function onCreatePost()
	setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
	setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
end

function onEvent(name, value1, value2)
	if name == 'aftercutscene' then
		removeLuaSprite('horizon',false)
		removeLuaSprite('back trees',false)
		removeLuaSprite('front trees',false)
    end
	if name == 'alaska' then
		removeLuaSprite('basement',false)
		removeLuaSprite('lightbulb',false)
		removeLuaSprite('box',false)

    	addLuaSprite('horizon',false)
    	addLuaSprite('back trees',false)
        addLuaSprite('front trees',false)
    end
	if name == 'Basement' then
		removeLuaSprite('bg23',false)
		removeLuaSprite('MDPlightbulb',false)
		removeLuaSprite('maxbox',false)
		removeLuaSprite('MDPoverlay',false)
		addLuaSprite('basement',false)
		addLuaSprite('lightbulb',false)
		addLuaSprite('box',true)
		removeLuaSprite('horizon',false)
		removeLuaSprite('back trees',false)
		removeLuaSprite('front trees',false)
		runHaxeCode([[
  		FlxG.game.setFilters([]);
  		]])
	end
	if name == 'firstCutscene' then
		runHaxeCode([[
  		FlxG.game.setFilters([]);
  		]])
		if goodEnding == true then
			makeVideoSprite('lyricCutscene', 'cutscene_good', 0, 0, 'hud', false)
  			setObjectOrder('lyricCutscene_video', 0)
  			setProperty('lyricCutscene_video.alpha', 1)
		else
			makeVideoSprite('lyricCutscene', 'cutscene_bad', 0, 0, 'hud', false)
  			setObjectOrder('lyricCutscene_video', 0)
  			setProperty('lyricCutscene_video.alpha', 1)
		end
	end
end

function mouseOverlaps(tag, camera)
    x = getMouseX(camera or 'camHUD')
    y = getMouseY(camera or 'camHUD')
    return (x > getProperty(tag..'.x') and y > getProperty(tag..'.y') and x < (getProperty(tag..'.x') + getProperty(tag..'.width')) and y < (getProperty(tag..'.y') + getProperty(tag..'.height')))
end

function onUpdatePost()

	healthFormant = math.floor(((getHealth()*0.5)*5)*-1) * -1 -- theres probably an easier way to do this but fuck it

	if healthFormant == 5 then
		setProperty('icon2.alpha', '1')
		setProperty('icon1.alpha', '0')
		setProperty('hb1.alpha', '1')
		setProperty('hb2.alpha', '1')
		setProperty('hb3.alpha', '1')
		setProperty('hb4.alpha', '1')
		setProperty('hb5.alpha', '1')
	elseif healthFormant == 4 then
		setProperty('icon2.alpha', '0')
		setProperty('icon1.alpha', '1')
		setProperty('hb1.alpha', '1')
		setProperty('hb2.alpha', '1')
		setProperty('hb3.alpha', '1')
		setProperty('hb4.alpha', '1')
		setProperty('hb5.alpha', '0')
	elseif healthFormant == 3 then
		setProperty('icon2.alpha', '0')
		setProperty('icon1.alpha', '1')
		setProperty('hb1.alpha', '1')
		setProperty('hb2.alpha', '1')
		setProperty('hb3.alpha', '1')
		setProperty('hb4.alpha', '0')
		setProperty('hb5.alpha', '0')
	elseif healthFormant == 2 then
		setProperty('hb1.alpha', '1')
		setProperty('hb2.alpha', '1')
		setProperty('hb3.alpha', '0')
		setProperty('hb4.alpha', '0')
		setProperty('hb5.alpha', '0')
	elseif healthFormant == 1 then
		setProperty('hb1.alpha', '1')
		setProperty('hb2.alpha', '0')
		setProperty('hb3.alpha', '0')
		setProperty('hb4.alpha', '0')
		setProperty('hb5.alpha', '0')
	end

    if mouseOverlaps('button', 'camHUD') and mouseClicked() and helpTime == true then
        helped = helped + 1
        setProperty('button.scale.x', 0.35)
        setProperty('button.scale.y', 0.35)
        doTweenX('buttonPressX', 'button.scale', 0.3, 0.3, 'circOut')
        doTweenY('buttonPressY', 'button.scale', 0.3, 0.3, 'circOut')
    end

	if curBeat >= 64 then
		setProperty('doorDo.alpha', '0')
	end
end

function onBeatHit()
	if curBeat == 72 then
		setProperty('leDark.alpha', '0')
		triggerEvent("Image Appearance", "end", "0.1")
	end
	if curBeat == 208 then
		triggerEvent("Image Appearance", "end", "0.1")
	end
	if curBeat == 528 then
		triggerEvent("Image Appearance", "end", "0.1")
	end
	if curBeat == 656 then
		helpTime = true
		noteTweenAlpha("Bye1", 4, 0, 0.3, "circOut")
		noteTweenAlpha("Bye2", 5, 0, 0.3, "circOut")
		noteTweenAlpha("Bye3", 6, 0, 0.3, "circOut")
		noteTweenAlpha("Bye4", 7, 0, 0.3, "circOut")
		doTweenAlpha("buttonAppear", "button", 1, 0.5, "circOut")
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
    end

	if curBeat == 716 then
		helpTime = false
        doTweenAlpha("buttonDisappear", "button", 0, 0.5, "circOut")
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
		if helped > 10 then
			goodEnding = true
		end
    end

	if curBeat == 848 then
		if goodEnding == true then
			setProperty('leDark.alpha', '0')
			triggerEvent("Image Appearance", "end", "0.1")
			triggerEvent("Basement", nil, nil)
			triggerEvent("Change Character", "Dad", "oxaya_real")
			triggerEvent("Change Character", "BF", "jimmy_real")
		end
    end
	if curBeat == 911 then
		setProperty('endDark.alpha', '1')
	end
	if curBeat == 912 then
		noteTweenAlpha("Bye1", 4, 0, 0.3, "circOut")
		noteTweenAlpha("Bye2", 5, 0, 0.3, "circOut")
		noteTweenAlpha("Bye3", 6, 0, 0.3, "circOut")
		noteTweenAlpha("Bye4", 7, 0, 0.3, "circOut")
		if goodEnding == true then
			doTweenAlpha("endTween", "goodend", 1, 1.3, "circIn")
		else
			doTweenAlpha("endTween", "badend", 1, 1.3, "circIn")
		end
	end
end

function onStepHit()
	if curStep >= 3257 and playedOnceOther == false then
		playedOnceOther = true
		characterPlayAnim("Dad", "yes")
	end

	if curStep >= 3263 and playedOnce == false then
		playedOnce = true
		setProperty('leDark.alpha', '1')
		if goodEnding == true then
			makeVideoSprite('endingCutscene', 'good', 0, 0, 'hud', false)
  			setObjectOrder('endingCutscene_video', 0)
  			setProperty('endingCutscene_video.alpha', 1)
		else
			makeVideoSprite('endingCutscene', 'bad', 0, 0, 'hud', false)
  			setObjectOrder('endingCutscene_video', 0)
  			setProperty('endingCutscene_video.alpha', 1)
		end
	end
end