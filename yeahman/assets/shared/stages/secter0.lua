

function onCreate()
    makeLuaSprite('bg', 'stages/dogshi/bgbackds',-100, -195);
    scaleObject("bg", 1.2, 1.2)
    setScrollFactor("bg", 0.50, 1)
    addLuaSprite("bg")

    makeLuaSprite('dead', 'stages/dogshi/deaddogs',-100 + (553 * 1.2), -195 + (727 * 1.2));
    scaleObject("dead", 1.2, 1.2)
    setScrollFactor("dead", 0.5, 1)
    addLuaSprite("dead")

    makeLuaSprite('front', 'stages/dogshi/frontds',-900, -375);
    scaleObject("front", 1.2, 1.2)
    addLuaSprite("front")

    setScrollFactor("bg", 0.50, 1)
    setProperty("skipCountdown", true);
end

function onCreatePost()
    setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup')+1)

    -- makeAnimatedLuaSprite("swat",'stages/dogshi/swatteam',900,450)
    -- addAnimationByPrefix("swat", "i", "swat",24)
    -- addLuaSprite("swat")
    -- playAnim("swat", "i")

end
    
function onUpdate(elapsed)
	if mustHitSection then
		setProperty("defaultCamZoom",  0.75)
	else
		setProperty("defaultCamZoom",  0.6)
	end
end

