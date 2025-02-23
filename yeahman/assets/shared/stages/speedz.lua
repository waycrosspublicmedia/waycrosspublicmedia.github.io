-- x = left y is up


function onCreate()
	
    
    makeLuaSprite('sky', 'stages/speedz/sky', -750, -500);
	setScrollFactor('sky', 0.7, 0.7);
	scaleObject('sky', 1.5, 1.5);
	addLuaSprite("sky");

    makeLuaSprite('sunny', 'stages/speedz/sunny', 1150, 105); 
	setScrollFactor('sunny', 0.9, 0.9);
	scaleObject('sunny', 1.5, 1.5)
	addLuaSprite("sunny");

    setProperty('sunny.velocity.x', -10) 
    --setProperty('sunny.acceleration.x', -15) spin (if you see this turn it on and this vvv for cool easter egg lol)
    --setProperty('sunny.angularAcceleration', -50) faster overtime 

    makeLuaSprite('island', 'stages/speedz/island', -300, -350); 
	setScrollFactor('island', 0.9, 0.9);
	scaleObject('island', 1.1, 1.1)
	addLuaSprite("island");

    setProperty('island.velocity.x', 4) 
    
    makeAnimatedLuaSprite('seaanim','stages/speedz/seaanim',-750,200)
    addAnimationByPrefix('seaanim','dance','sea',12,true)
    objectPlayAnimation('seaanim','dance',false)
    setScrollFactor('seaanim', 0.8, 0.8);
    scaleObject('seaanim', 1.7, 1.7);
    addLuaSprite("seaanim");
    
    makeLuaSprite('beach', 'stages/speedz/sand', -750, 500);
	setScrollFactor('beach', 1, 1);
	scaleObject('beach', 1.5, 1.5);
	addLuaSprite("beach");

    makeAnimatedLuaSprite('grass','stages/speedz/grass',-750,100)
    addAnimationByPrefix('grass','dance','grass',12, true)
    objectPlayAnimation('grass','dance',false)
    setScrollFactor('grass', 1.9, 1.9);
    scaleObject('grass', 1.7, 1.7);
    addLuaSprite("grass", true);

    makeAnimatedLuaSprite('grass2','stages/speedz/grass',900,200)
    addAnimationByPrefix('grass2','dance','grass',12, true)
    objectPlayAnimation('grass2','dance',false)
    setScrollFactor('grass2', 1.9, 1.9);
    scaleObject('grass2', 1.7, 1.7);
    addLuaSprite("grass2", true); 
    setProperty('grass2.flipX', true)

    makeLuaSprite('overlay', 'stages/speedz/overlay', -350, -800); 
	scaleObject('overlay', 2.4, 2.4);
	addLuaSprite("overlay", true);
 
    makeLuaSprite('wanted', 'stages/speedz/wanted', -1350, -1230);
    setScrollFactor('wanted', 1.3, 1.3);
	scaleObject('wanted', 2, 2);
	addLuaSprite("wanted", true);
    setObjectOrder('wanted', getObjectOrder('grass')+1)
    setObjectOrder('wanted', getObjectOrder('grass2')+1)

	makeAnimatedLuaSprite('ahha','stages/speedz/ahha',760, 50)
    addAnimationByPrefix('ahha','ahha','ahha',24,false)
    scaleObject('ahha', 1, 1);
    addLuaSprite("ahha", true);
    setProperty('ahha.alpha', 0);

	setProperty('healthBar.alpha', tonumber(0))
	setProperty('iconP1.alpha', tonumber(0))
	setProperty('iconP2.alpha', tonumber(0))
	setProperty('scoreTxt.alpha', tonumber(0))
	setProperty('healthBarContainer.visible', false)


    setProperty("showCombo", false)
    setProperty("showComboNum", false)
    setProperty("showRating", false)
    
end