function onCreate()
    makeLuaSprite('BackWall', 'BackWall')
    addLuaSprite('BackWall', false)
    scaleObject('BackWall',2.1 ,2)

    makeLuaSprite('FrontWall', 'FrontWall', -180)
    addLuaSprite('FrontWall', true)
    scaleObject('FrontWall', 1.67, 1.25)
    setScrollFactor('FrontWall', 1.1, 1.01)
    setProperty('FrontWall.alpha', .95) --.95


    makeLuaSprite('1', '1')
    addLuaSprite('1', false)
    scaleObject('1',.76 ,.76)
    setObjectCamera('1', 'camOther')
    screenCenter('1')

    makeLuaSprite('2', '2')
    addLuaSprite('2', false)
    scaleObject('2',.76 ,.76)
    setObjectCamera('2', 'camOther')
    screenCenter('2')

    makeLuaSprite('3', '3')
    addLuaSprite('3', false)
    scaleObject('3',.76 ,.76)
    setObjectCamera('3', 'camOther')
    screenCenter('3')

    makeLuaSprite('4', '4')
    addLuaSprite('4', false)
    scaleObject('4',.76 ,.76)
    setObjectCamera('4', 'camOther')
    screenCenter('4')

    makeLuaSprite('5', '5')
    addLuaSprite('5', false)
    scaleObject('5',.76 ,.76)
    setObjectCamera('5', 'camOther')
    screenCenter('5')

    makeLuaSprite('6', '6')
    addLuaSprite('6', false)
    scaleObject('6',.76 ,.76)
    setObjectCamera('6', 'camOther')
    screenCenter('6')

    makeLuaSprite('7', '7')
    addLuaSprite('7', false)
    scaleObject('7',.76 ,.76)
    setObjectCamera('7', 'camOther')
    screenCenter('7')

    makeLuaSprite('8', '8')
    addLuaSprite('8', false)
    scaleObject('8',.76 ,.76)
    setObjectCamera('8', 'camOther')
    screenCenter('8')

    makeLuaSprite('9', '9')
    addLuaSprite('9', false)
    scaleObject('9',.76 ,.76)
    setObjectCamera('9', 'camOther')
    screenCenter('9')

    makeLuaSprite('10', '10')
    addLuaSprite('10', false)
    scaleObject('10',.76 ,.76)
    setObjectCamera('10', 'camOther')
    screenCenter('10')

    setProperty('1.alpha', 0)
    setProperty('2.alpha', 0)
    setProperty('3.alpha', 0)
    setProperty('4.alpha', 0)
    setProperty('5.alpha', 0)
    setProperty('6.alpha', 0)
    setProperty('7.alpha', 0)
    setProperty('8.alpha', 0)
    setProperty('9.alpha', 0)
    setProperty('10.alpha', 0)

    makeAnimatedLuaSprite('droplet','droplet', 1900, 730)addAnimationByPrefix('droplet','Dance','gooey',24,true)
    objectPlayAnimation('droplet','Dance',false)
    addLuaSprite('droplet', false)
    scaleObject('droplet', 4, 3.5)
    setProperty('droplet.alpha', 0)

    makeAnimatedLuaSprite('secondtopgoop','secondtopgoop', 2400, -200)addAnimationByPrefix('secondtopgoop','Dance','gooey',24,true)
    objectPlayAnimation('secondtopgoop','Dance',false)
    addLuaSprite('secondtopgoop', true)
    scaleObject('secondtopgoop', 2.5, 2.5)
    setProperty('secondtopgoop.alpha', 0)

    makeAnimatedLuaSprite('sinkgoop','sinkgoop', 1050, 795)addAnimationByPrefix('sinkgoop','Dance','gooey',24,true)
    objectPlayAnimation('sinkgoop','Dance',false)
    addLuaSprite('sinkgoop', false)
    scaleObject('sinkgoop', 2.5, 2.5)
    setProperty('sinkgoop.alpha', 0)

    makeAnimatedLuaSprite('topgoop','topgoop', -200, -200)addAnimationByPrefix('topgoop','Dance','gooey',24,true)
    objectPlayAnimation('topgoop','Dance',false)
    addLuaSprite('topgoop', true)
    scaleObject('topgoop', 2.5, 2.5)
    setProperty('topgoop.alpha', 0)

    makeAnimatedLuaSprite('HotDogGuy1', 'GBcharacters/HotDogGuy1', -660, 760)addAnimationByPrefix('HotDogGuy1','Dance','HotDogGuy Idle',8,true)
    objectPlayAnimation('HotDogGuy1','Dance',false)
    addLuaSprite('HotDogGuy1', true)
    scaleObject('HotDogGuy1', 1, 1)
    setProperty('HotDogGuy1.alpha', 1)
    setScrollFactor('HotDogGuy1', .9, .9)

    makeAnimatedLuaSprite('CorruptedHotDog', 'GBcharacters/CorruptedHotDog', -600, 700)addAnimationByPrefix('CorruptedHotDog','Dance','CorruptedHotDog Idle',24,true)
    objectPlayAnimation('CorruptedHotDog','Dance',false)
    addLuaSprite('CorruptedHotDog', true)
    scaleObject('CorruptedHotDog', 3, 3)
    setProperty('CorruptedHotDog.alpha', 0)
    setScrollFactor('CorruptedHotDog', .9, .9)

    makeAnimatedLuaSprite('CarrieCorrupted', 'GBcharacters/CarrieCorrupted', 700, 700)addAnimationByPrefix('CarrieCorrupted','Dance','Idle',16,true)
    objectPlayAnimation('CarrieCorrupted','Dance',false)
    addLuaSprite('CarrieCorrupted', false)
    scaleObject('CarrieCorrupted', .55, .55)
    setProperty('CarrieCorrupted.alpha', 0)
    doTweenY('CorruptedCarrieY', 'CarrieCorrupted', 750, 8, 'sineInOut')

    makeLuaSprite('AllanDead', 'GBcharacters/AllanDead',1990, 1200)
    addLuaSprite('AllanDead', false)
    scaleObject('AllanDead',.4,.4)
    setProperty('AllanDead.alpha', 0)


    makeLuaSprite('BananaDead', 'GBcharacters/BananaDead',1800, 1200)
    addLuaSprite('BananaDead', false)
    scaleObject('BananaDead',.6,.6)
    setProperty('BananaDead.alpha', 0)


    makeLuaSprite('ToastDead', 'GBcharacters/ToastDead',2360, 1100)
    addLuaSprite('ToastDead', false)
    scaleObject('ToastDead',.6,.6)
    setProperty('ToastDead.alpha', s)

    makeLuaSprite('SarahDead', 'GBcharacters/SarahDead',2450, 1260)
    addLuaSprite('SarahDead', true)
    scaleObject('SarahDead',1.45,1.45)
    setScrollFactor('Sarah', .85, .9)
    setProperty('SarahDead.alpha', 0)

    

    makeLuaSprite('DeadTobias', 'GBcharacters/DeadTobias',1600, 900)
    addLuaSprite('DeadTobias', false)
    scaleObject('DeadTobias',.74,.74)
    setProperty('DeadTobias.alpha', 0)



    makeAnimatedLuaSprite('Masami','GBcharacters/Masami', 2500, 700)addAnimationByPrefix('Masami','Dance','Masami',32,true)
    scaleObject('Masami', .8, .8)
    objectPlayAnimation('Masami','Dance',false)
    addLuaSprite('Masami', false)

    makeAnimatedLuaSprite('Corrupted_Masami','GBcharacters/Corrupted_Masami', 2500, 700)addAnimationByPrefix('Corrupted_Masami','Dance','Masami Corrupted',32,true)
    scaleObject('Corrupted_Masami', .8, .8)
    objectPlayAnimation('Corrupted_Masami','Dance',false)
    setProperty('Corrupted_Masami.alpha', 0)
    addLuaSprite('Corrupted_Masami', false)


    makeAnimatedLuaSprite('Allan','GBcharacters/Allan', 1500, 400)addAnimationByPrefix('Allan','Dance','Allan Idle',10,true)
    objectPlayAnimation('Allan','Dance',false)
    addLuaSprite('Allan', false)

    makeAnimatedLuaSprite('Carrie','GBcharacters/Carrie', 500, 500)addAnimationByPrefix('Carrie','Dance','Carrie Idle',8,true)
    objectPlayAnimation('Carrie','Dance',false)
    scaleObject('Carrie', .6, .6)
    addLuaSprite('Carrie', false)

    makeAnimatedLuaSprite('tobias','GBcharacters/tobias', 1370, 700)addAnimationByPrefix('tobias','Dance','thing',20,true)
    objectPlayAnimation('tobias','Dance',false)
    scaleObject('tobias', .85, .85)
    addLuaSprite('tobias', false)
    


    makeAnimatedLuaSprite('Joe','GBcharacters/Joe', 1750, 990)addAnimationByPrefix('Joe','Dance','Joe Idle',10,true)
    objectPlayAnimation('Joe','Dance',false)
    scaleObject('Joe', .5 ,.5)
    addLuaSprite('Joe', false)

    makeAnimatedLuaSprite('Toast','GBcharacters/Toast', 2200, 990)addAnimationByPrefix('Toast','Dance','Toast Idle',10,true)
    objectPlayAnimation('Toast','Dance',false)
    scaleObject('Toast', .5, .5)
    addLuaSprite('Toast', false)

    makeAnimatedLuaSprite('Sarah','GBcharacters/Sarah', 2150, 800)addAnimationByPrefix('Sarah','Dance','Sarah Idle',10,true)
    objectPlayAnimation('Sarah','Dance',false)
    scaleObject('Sarah', 1, 1)
    setScrollFactor('Sarah', .85, .9)
    addLuaSprite('Sarah', true)
   





    makeLuaSprite('Shadow1', 'Shadow1', -220)
    addLuaSprite('Shadow1', true)
    setProperty('Shadow1.alpha', 0)
    scaleObject('Shadow1',1.5 ,1.3)

    makeLuaSprite('Shadow2', 'Shadow2', -220)
    addLuaSprite('Shadow2', true)
    setProperty('Shadow2.alpha', 0)
    scaleObject('Shadow2',2.2 ,2)

    makeLuaSprite('Shadow3', 'Shadow3', -220)
    addLuaSprite('Shadow3', true)
    setProperty('Shadow3.alpha', 0)
    scaleObject('Shadow3',2.2 ,2)


    makeLuaSprite('Uhoh2', 'Uhoh2', -220 , 10)
    addLuaSprite('Uhoh2', true)
    scaleObject('Uhoh2', 1.2, 1.1)
    setProperty('Uhoh2.alpha', .7)

    makeLuaSprite('Uhoh', 'Uhoh',-220, 10)
    addLuaSprite('Uhoh', true)
    setProperty('Uhoh.alpha', 1)
    scaleObject('Uhoh', 1.2, 1.1)


end

function onTweenCompleted(tag)
    if tag == 'CorruptedCarrieY' then 
        doTweenY('CorruptedCarrieY2', 'CarrieCorrupted', 600, 8, 'sineInOut')
    end
    if tag == 'CorruptedCarrieY2' then 
        doTweenY('CorruptedCarrieY', 'CarrieCorrupted', 750, 8, 'sineInOut')
    end
end