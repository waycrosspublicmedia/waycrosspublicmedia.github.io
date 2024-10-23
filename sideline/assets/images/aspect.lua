-- Script edited and added stuff by Bluespike (@FrideyNehgGuy on twitter) give credits if you use it
-- Also original base script by Sky Remanifested give credits to the mod tho 

function onCreatePost()
        makeLuaSprite('borderL', 'aspect',0,0)
        addLuaSprite('borderL', false)
        setObjectCamera("borderL", "camother")
        makeLuaSprite('vcrshit2', 'vcrshit',0,0)  
        addLuaSprite('vcrshit2', false)
        setObjectCamera("vcrshit2", "hud")

end

-- put below of this message your stage 