local xx = 0;
local yy = 0;
local fx = 0;
local fy = 0;

function onCreate()

makeLuaSprite('demonxsky','x/demonxsky',-140, -145)
addLuaSprite('demonxsky',false)
scaleObject('demonxsky',0.7,0.7)
setLuaSpriteScrollFactor('demonxsky',0.2,0.2)

makeLuaSprite('demonxplatform','x/demonxplatform',-380, -90)
addLuaSprite('demonxplatform',false)
scaleObject('demonxplatform',0.85,0.7)
setLuaSpriteScrollFactor('demonxplatform',0.98,0.98)

doTweenAlpha('NoBitches','gfGroup',0,0.01,'linear')

end

function  onUpdate()
    
    if getProperty('dad.curCharacter') == 'demonx' then
    	fx= fx+0.02;
    	fy= fy+0.02;
    	xx = getProperty('dad.x')
    	yy = getProperty('dad.y')

    	setProperty('dad.y',yy+math.sin(fy)*0.8)
    	setProperty('dad.x',xx+math.cos(fx)*0.8)
    end
end