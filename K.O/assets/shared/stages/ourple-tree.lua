function onCreate()
    makeLuaSprite('ourpleBG', 'ourpleBG', -240,0)
    addLuaSprite('ourpleBG', 0, 0)
    scaleObject('ourpleBG', 2,2)

    makeAnimatedLuaSprite('waterfallAnim', 'waterfallAnim', -290,-120)
    addAnimationByPrefix('waterfallAnim', 'waterfallAnim', 'anim', 14, true)
    addLuaSprite('waterfallAnim', 0, 0)
    scaleObject('waterfallAnim', 1.5,1.5)

    makeLuaSprite('ourpleFloor', 'ourpleFloor', -290,-120)
    addLuaSprite('ourpleFloor', 0, 0)
    scaleObject('ourpleFloor', 1.5,1.5)

    makeAnimatedLuaSprite('treeAnim', 'treeAnim', -290,-120)
    addAnimationByPrefix('treeAnim', 'treeAnim', 'anim', 14, true)
    addLuaSprite('treeAnim', 0, 0)
    scaleObject('treeAnim', 1.5,1.5)

    makeAnimatedLuaSprite('sclorbsAnim', 'sclorbsAnim', -290,-120)
    addAnimationByPrefix('sclorbsAnim', 'sclorbsAnim', 'anim', 8, true)
    addLuaSprite('sclorbsAnim', 0, 0)
    scaleObject('sclorbsAnim', 1.5,1.5)
end