local cameraMultiplier = 1
local inMoment = false

function onCreate()
	makeLuaSprite('sky', 'stages/izzy/izzy0', -474.2, -1539.9);
	setScrollFactor('sky', 0.05, 0.05);	
	setProperty('sky.antialiasing', false);
	scaleLuaSprite("sky", 0.8, 0.8);
	addLuaSprite('sky', false);

	makeLuaSprite('bg0', 'stages/izzy/izzy1', -1574.2, -1539.9);
	setScrollFactor('bg0', 0.4, 0.4);	
	setProperty('bg0.antialiasing', false);
	scaleLuaSprite("bg0", 1.2, 1.2);
	addLuaSprite('bg0', false);

	makeLuaSprite('bg1', 'stages/izzy/izzy2', 1129.35, 231.55);
	setScrollFactor('bg1', 0.6, 0.6);	
	setProperty('bg1.antialiasing', false);
	scaleLuaSprite("bg1", 1.2, 1.2);
	addLuaSprite('bg1', false);

	makeLuaSprite('dark', 'stages/izzy/izzy5', -974.2, -1239.9);
	scaleLuaSprite("dark", 3, 3);
	setScrollFactor("dark", 0.05, 0.05);
	updateHitbox("dark");
	screenCenter("dark", 'xy');
	setProperty('dark.antialiasing', false);
	addLuaSprite('dark', false);

	makeLuaSprite("cloud1", 'stages/izzy/izzycloud1', 0, 0);
	setScrollFactor("cloud1", 0.1, 0.1);
	scaleLuaSprite("cloud1", 3, 3);
	updateHitbox("cloud1");
	screenCenter("cloud1", 'xy');
	setProperty('cloud1.x', getProperty("cloud1.x") - 900);
	setProperty('cloud1.y', getProperty("cloud1.y") - 100);
	setProperty('cloud1.antialiasing', false);
	addLuaSprite("cloud1", true);

	makeLuaSprite("cloud2", 'stages/izzy/izzycloud2', 0, 0);
	setScrollFactor("cloud2", 0.1, 0.1);
	scaleLuaSprite("cloud2", 3, 3);
	updateHitbox("cloud2");
	screenCenter("cloud2", 'XY');
	setProperty('cloud2.x', getProperty("cloud2.x") + 400);
	setProperty('cloud2.y', getProperty("cloud2.y") + 700);
	setProperty('cloud2.antialiasing', false);
	addLuaSprite("cloud2", true)

	makeLuaSprite("cloud3", 'stages/izzy/izzycloud3', 0, 0);
	setScrollFactor("cloud3", 0.1, 0.1);
	scaleLuaSprite("cloud3", 3, 3);
	updateHitbox("cloud3");
	screenCenter("cloud3", 'XY');
	setProperty('cloud3.y', getProperty("cloud3.y") + 1300);
	setProperty('cloud3.antialiasing', false);
	addLuaSprite("cloud3", true);

	doTweenX("cloud1t", "cloud1", getProperty("cloud1.x") + 800, 15, "linear");
	doTweenX("cloud2t", "cloud2", getProperty("cloud2.x") - 400, 15, "linear");
	doTweenX("cloud3t", "cloud3", getProperty("cloud3.x") + 200, 15, "linear");

	makeLuaSprite('bg2', 'stages/izzy/izzy3', -1770.95, -254.6);
	setScrollFactor('bg2', 0.98, 0.98);	
	setProperty('bg2.antialiasing', false);
	scaleLuaSprite("bg2", 1.2, 1.2);
	addLuaSprite('bg2', false);
	setProperty('bg2.visible', false);

    makeLuaSprite('overlay', 'stages/izzy/izzy4', 0, 0);
	setScrollFactor('overlay', 0, 0);	
	setProperty('overlay.antialiasing', false);
	scaleLuaSprite("overlay", 5, 5);
	screenCenter("overlay", 'xy');
	setBlendMode("overlay", 'ADD');
	addLuaSprite('overlay', false);
	setProperty('overlay.visible', false);

	makeLuaSprite("white");
	makeGraphic("white",1280,720);
	setScrollFactor("white", 0, 0);
	scaleLuaSprite("white", 5, 5);
	updateHitbox("white");
	screenCenter("white", 'XY');
	addLuaSprite('white', true);
	setProperty('white.alpha', 0);
	setObjectCamera("white",'other');

	makeLuaSprite('speakerblast', 'stages/izzy/speakerblast', 0, 0);
	setScrollFactor('speakerblast', 0, 0);	
	setProperty('speakerblast.antialiasing', false);
	screenCenter("speakerblast", 'XY');
	setBlendMode("speakerblast", 'ADD');
	setProperty('speakerblast.alpha', 0.7)	;
	addLuaSprite('speakerblast', true);
	setProperty('speakerblast.visible', false);
	setObjectCamera("speakerblast",'hud');

	makeLuaSprite('speakerblast2', 'stages/izzy/speakerblast2', 0, 0);
	setScrollFactor('speakerblast2', 0, 0);	
	setProperty('speakerblast2.antialiasing', false);
	screenCenter("speakerblast2", 'XY');
	setBlendMode("speakerblast2", 'ADD');
	setProperty('speakerblast2.alpha', 0.9);
	addLuaSprite('speakerblast2', true);
	setProperty('speakerblast2.visible', false);
	setObjectCamera("speakerblast2",'hud');

	makeAnimatedLuaSprite('speakerflash', 'stages/izzy/speakerflash', 0, 0);
	addAnimationByPrefix("speakerflash", "flash", "Flasj instance 1", 24, false);
	setScrollFactor('speakerflash', 0, 0);	
	setProperty('speakerflash.antialiasing', false);
	screenCenter("speakerflash", 'xy');
	setBlendMode("speakerflash", 'ADD');
	addLuaSprite('speakerflash', true);
	setProperty('speakerflash.visible', false);
	setObjectCamera("speakerflash",'hud');

	makeAnimatedLuaSprite('error', 'stages/izzy/activationWindows', 0, 0);
	addAnimationByPrefix("error", "1", "Retry1", 24, true);
	addAnimationByPrefix("error", "2", "Retry2", 24, true);
	playAnim("error", "1");
	updateHitbox("error");
	setScrollFactor('error', 0, 0);	
	setProperty('error.antialiasing', false);
	screenCenter("error", 'xy');
	addLuaSprite('error', true);
	setProperty('error.visible', false);
	setObjectCamera("error",'other');

end

function onEvent(eventName, value1, value2, strumTime)
	if eventName == 'izzybgcamera' then
		cameraMultiplier = value1
	end
end

function onUpdate(elapsed)
	if mustHitSection and not inMoment then
		setProperty("defaultCamZoom",  0.45 * cameraMultiplier)
	else
		setProperty("defaultCamZoom",  0.6 * cameraMultiplier)
	end
end

function onCreatePost()
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
	setProperty('timeTxt.visible', false)
	setProperty('timeBar.visible', false)
	setProperty("showRating", false)
	setProperty("showCombo", false)
	setProperty('comboGroup.visible', false)
end

function onStepHit()
	if curStep == 444 then
		setProperty('speakerblast.visible', true)		
		setProperty('speakerblast2.visible', true)		
		setProperty('speakerflash.visible', true)		
		playAnim("speakerflash", "flash", true)
		doTweenAlpha("blastB", "speakerblast2", 0, 3, "linear")
		doTweenAlpha("blast1", "speakerblast", 1, 0.2, "linear")
		doTweenAlpha("flash", "speakerflash", 0, 0.5, "linear")
	end
	if curStep == 448 then
		setProperty('speakerflash.visible', false)
	end
	if curStep == 128 then
		setProperty('dark.visible', false)
		setProperty('cloud1.visible', false)
		setProperty('cloud2.visible', false)
		setProperty('cloud3.visible', false)
		setProperty('overlay.visible', true)
		setProperty('bg2.visible', true)
	end
	if curStep == 976 then
		setProperty('camHUD.alpha', 0)
		setProperty('camGame.alpha', 0)
		setProperty('camExempt.alpha', 0)		
	end
	if curStep == 664 then
		inMoment = true
		setProperty('boyfriend.skipDance', true)
		setProperty('error.visible', true)
		doTweenAlpha("white1", "white", 0.6, 0.2, "linear")
	end
	if curStep == 672 then
		inMoment = false
		setProperty('error.visible', false)
		setProperty('boyfriend.skipDance', false)
		setProperty('white.alpha', 0)
	end	
	if curStep == 696 then
		inMoment = true
		playAnim("error", "2", true)
		setProperty('error.visible', true)
		doTweenAlpha("white1", "white", 0.6, 0.2, "linear")
	end
	if curStep == 704 then
		inMoment = false
		setProperty('error.visible', false)
		setProperty('white.alpha', 0)	
		doTweenAlpha("bubbletween", "bubbles", 0.25, 4, "linear")	
	end
end

function onTweenCompleted(tag, vars)
	if tag == 'blast1' then
		doTweenAlpha("blast2", "speakerblast", 0, 20, "linear")
	end
end