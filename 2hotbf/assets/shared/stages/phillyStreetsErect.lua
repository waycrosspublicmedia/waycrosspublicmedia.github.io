omg=false


function onCreate()


	 
    makeLuaSprite('greyGradient', 'phillyStreets/erect/greyGradient', -700, -200)
    addLuaSprite('greyGradient', false)
    setScrollFactor('greyGradient', 0.3, 0.3)
    scaleObject('greyGradient',1,1)

    makeLuaSprite('skyline', 'phillyStreets/erect/phillySkyline', -700, -300)
    addLuaSprite('skyline', false)
    setScrollFactor('skyline', 0.3, 0.3)
    scaleObject('skyline', 1,1)

    
    makeLuaSprite('foregroundCity', 'phillyStreets/erect/phillyForegroundCity', 350, -20)
    addLuaSprite('foregroundCity', false)
    setScrollFactor('foregroundCity', 0.4, 0.4)
    scaleObject('foregroundCity',1,1)

    makeLuaSprite('construction', 'phillyStreets/erect/phillyConstruction', 1000, -150)
    addLuaSprite('construction', false)
    setScrollFactor('construction', 0.6, 0.6)
    scaleObject('construction',1,1)

    makeLuaSprite('smog', 'phillyStreets/erect/phillySmog', -1000, -200)
    addLuaSprite('smog', false)
    setScrollFactor('smog', 0.8, 0.8)
    scaleObject('smog',1,1)

    makeLuaSprite('highway', 'phillyStreets/erect/phillyHighway', -1050, -250)
    addLuaSprite('highway', false)
    setScrollFactor('highway', 1.0, 1.0)
    scaleObject('highway',1,1)

    makeLuaSprite('222', 'phillyStreets/erect/mistBack',  -700, -650)
    addLuaSprite('222', false)
    setScrollFactor('222',0.3, 0.3)
    scaleObject('222',1.2,1.2)
setProperty('222.color',0x5c5c5c)
setProperty('222.blend',0)

--

--
makeLuaSprite('mistBack', 'phillyStreets/erect/mistBack',  -700, -200)
addLuaSprite('mistBack', true)
setScrollFactor('mistBack',0.3, 0.3)
scaleObject('mistBack',1.2,1.2)
setProperty('mistBack.color',0x5c5c5c)
setProperty('mistBack.blend',0)

makeLuaSprite('mistMid', 'phillyStreets/erect/mistMid', -700, -100)
addLuaSprite('mistMid', true)
setScrollFactor('mistMid', 0.3, 0.3)
setProperty('mistMid.alpha',0.5)
scaleObject('mistMid',1.2,1.2)
setProperty('mistMid.color',0x5c5c5c)
setProperty('mistMid.blend',0)


--

--
    if songName == 'darnell' and isStoryMode then
    setProperty('carsRight.alpha',0)
    setProperty('carsLeft.alpha',0)
    end
    makeAnimatedLuaSprite('phillyCars1', 'phillyStreets/erect/phillyCars', 620,40);
	addAnimationByPrefix('phillyCars1', 'car1', 'car1', 24, false);
	addAnimationByPrefix('phillyCars1', 'car2', 'car2', 24, false);
	addAnimationByPrefix('phillyCars1', 'car3', 'car3', 24, false);
	addAnimationByPrefix('phillyCars1', 'car4', 'car4', 24, false);
	setProperty('phillyCars1.flipX', false);
	scaleObject('phillyCars1',1.1, 1.1);
	setScrollFactor('phillyCars1', 1, 1);
	setProperty('phillyCars1.alpha', 1);

	makeAnimatedLuaSprite('phillyCars2', 'phillyStreets/erect/phillyCars', 620,40);
	addAnimationByPrefix('phillyCars2', 'car1', 'car1', 24, false);
	addAnimationByPrefix('phillyCars2', 'car2', 'car2', 24, false);
	addAnimationByPrefix('phillyCars2', 'car3', 'car3', 24, false);
	addAnimationByPrefix('phillyCars2', 'car4', 'car4', 24, false);
	setProperty('phillyCars2.flipX', true);
	scaleObject('phillyCars2', 1.1, 1.1);
	setScrollFactor('phillyCars2', 1, 1);
	setProperty('phillyCars2.alpha', 1);
    addLuaSprite('phillyCars1', false);
    addLuaSprite('phillyCars2', false);

    makeLuaSprite('foreground', 'phillyStreets/erect/phillyForeground', -1100, -100)
    addLuaSprite('foreground', false)
    setScrollFactor('foreground', 1.0, 1.0)
    scaleObject('foreground', 1, 1)

    makeAnimatedLuaSprite('trafficLight', 'phillyStreets/erect/phillyTraffic', 840, 148)
    addAnimationByPrefix('trafficLight', 'tored', 'greentored', 24, false)
    addAnimationByPrefix('trafficLight', 'togreen', 'redtogreen', 24, false)
    setProperty('trafficLight.flipX', false)
    scaleObject('trafficLight', 1, 1)
    setScrollFactor('trafficLight', 0.9, 1)
    addLuaSprite('trafficLight', false)
	playAnim('trafficLight', 'togreen', false);
	runTimer('greentoredTimer', 11);

    makeLuaSprite('phillyTraffic_lightmap', 'phillyStreets/erect/phillyTraffic_lightmap',832,144)
    addLuaSprite('phillyTraffic_lightmap',false)
    setScrollFactor('phillyTraffic_lightmap', 0.9, 1.0)
    scaleObject('phillyTraffic_lightmap', 1, 1)
    setBlendMode('phillyTraffic_lightmap','add')
    setProperty('phillyTraffic_lightmap.alpha',0.5)

setProperty('phillyCars1.x', 620);
setProperty('phillyCars1.y',10);
setProperty('phillyCars1.angle', -20);
setProperty('phillyCars2.x', 620);
setProperty('phillyCars2.y',10);
setProperty('phillyCars2.angle', 30);

runTimer('leftCarTween1', getRandomInt(25,55) *0.1, getRandomInt(1, 2));
runTimer('rightCarTween', getRandomInt(25,55) *0.1, getRandomInt(1, 2));
    setObjectOrder('333',getObjectOrder('foreground')-1)

	makeAnimatedLuaSprite('can','phillyStreets/Can Arc NEWER3', -200, 0);
    addAnimationByPrefix('can','idle','Can hit instance 1', 20, false);
	
	setProperty('can.alpha',0)
	addLuaSprite('can', true)
	makeAnimatedLuaSprite('deadbf','BOYFRIEND_DEAD', 730, 370);
    addAnimationByPrefix('deadbf','idle','BF Dead Loop', 20, true);
	
	setProperty('deadbf.alpha',0)
	 addLuaSprite('deadbf', true)
	 setProperty('can.alpha',0)


	makeAnimatedLuaSprite('doa','doa', -500, -300);
	setObjectCamera('doa','other')
    addAnimationByPrefix('doa','idle','dead or alive instance 1', 24, false);
	
	setProperty('doa.alpha',0)
	 addLuaSprite('doa', true)
	    scaleObject('doa',0.7,0.7)

	
end

local Light = 0
local carWaiting = 0
local Car1variant = 0
local Car1speed = 1.3
local Car2variant = 0
local Car2speed = 1.3

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'redtogreenTimer' then
		Light = 0
		playAnim('trafficLight', 'togreen', false);
		runTimer('greentoredTimer', 9);  
		runTimer('leftCarTween1', getRandomInt(25, 45) * 0.1, getRandomInt(1, 2)); 
		runTimer('rightCarTween', getRandomInt(25, 45) * 0.1, getRandomInt(1, 2)); 
		if carWaiting == 1 then
			carWaiting = 0
			runTimer('leftCarTween11', 0.5);
		end
	end
	if tag == 'leftCarTween11' then
		doTweenAngle('phillyCars1TweenAngle', 'phillyCars1', 30, 1.7, 'sineIn');
	end
	if tag == 'greentoredTimer' then
		Light = 1
		playAnim('trafficLight', 'tored', false);
		runTimer('redtogreenTimer', 7);  
		runTimer('leftCarTween2', getRandomInt(25, 45) * 0.1); 
	end
	if tag == 'leftCarTween1' then
		Car1variant = getRandomInt(1, 4)
		if Car1variant == 1 then
			Car1speed = getRandomInt(10, 17) * 0.1
		elseif Car1variant == 2 then
			Car1speed = getRandomInt(9, 15) * 0.1
		elseif Car1variant == 3 then
			Car1speed = getRandomInt(15, 25) * 0.1
		elseif Car1variant == 4 then
			Car1speed = getRandomInt(15, 25) * 0.1
		end
		playAnim('phillyCars1', 'car' .. Car1variant, false);
		setProperty('phillyCars1.angle', -20);
		doTweenAngle('phillyCars1TweenAngle', 'phillyCars1', 30, 1.7, 'linear');
	end
	if tag == 'leftCarTween2' then
		carWaiting = 1
		Car1variant = getRandomInt(1, 4)
		playAnim('phillyCars1', 'car' .. Car1variant, false);
		setProperty('phillyCars1.angle', -20);
		doTweenAngle('phillyCars1TweenAngle', 'phillyCars1', -5, 1.7, 'sineOut');
	end
	if tag == 'rightCarTween' then
		Car2variant = getRandomInt(1, 4)
		if Car2variant == 1 then
			Car2speed = getRandomInt(10, 17) * 0.1
		elseif Car2variant == 2 then
			Car2speed = getRandomInt(9, 15) * 0.1
		elseif Car2variant == 3 then
			Car2speed = getRandomInt(15, 25) * 0.1
		elseif Car2variant == 4 then
			Car2speed = getRandomInt(15, 25) * 0.1
		end
		playAnim('phillyCars2', 'car' .. Car2variant, false);
		setProperty('phillyCars2.angle', 30);
		doTweenAngle('phillyCars2TweenAngle', 'phillyCars2', -20, Car2speed, 'linear');
	end
end
 local hueValue = -5;
    local saturationValue = -40;
    local contrastValue = -25;
    local brightnessValue = -20;
function onCreatePost()



       
           
		   end
function onStepHit()
 
if curStep == 144 then
setSpriteShader('dad', 'adjustColor')
       setShaderFloat('dad', 'hue', hueValue)
       setShaderFloat('dad', 'saturation', saturationValue)
       setShaderFloat('dad', 'contrast', contrastValue)
       setShaderFloat('dad', 'brightness', brightnessValue)
       
       setSpriteShader('gf', 'adjustColor')
       setShaderFloat('gf', 'hue', hueValue)
       setShaderFloat('gf', 'saturation', saturationValue)
       setShaderFloat('gf', 'contrast', contrastValue)
       setShaderFloat('gf', 'brightness', brightnessValue)
       
       setSpriteShader('boyfriend', 'adjustColor')
       setShaderFloat('boyfriend', 'hue', hueValue)
       setShaderFloat('boyfriend', 'saturation', saturationValue)
       setShaderFloat('boyfriend', 'contrast', contrastValue)
       setShaderFloat('boyfriend', 'brightness', brightnessValue)
	   end 
	
	   	if curStep == 1024 then
	
	setProperty('camGame.alpha',0)
	setProperty('doa.alpha',1)
	playAnim('doa','idle',true)
	end
if curStep == 1040 then
	setProperty('camGame.alpha',1)
	setProperty('doa.alpha',0)
	end
 if curStep == 1572 then
	
	playAnim('can','idle',true)
	setProperty('can.alpha',1)


end

if curStep == 1600 or curStep == 1601 then
setProperty('deadbf.alpha',1)
setProperty('boyfriend.alpha',0)
end
if curStep == 1744 then
setProperty('deadbf.alpha',0)
setProperty('boyfriend.alpha',1)
end
end