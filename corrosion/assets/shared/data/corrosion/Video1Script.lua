function onStepHit()
if curStep == 3496 then
callScript('scripts/VideoSpriteHandler', 'makeVideoSprite', {'openVid', 'cutscene', 0, -10, 'camHUD', false})
scaleObject('openVid',1, 1)
end
end