local allowCountdown = false
function onStartCountdown()
if not allowCountdown and isStoryMode then
setProperty('inCutscene', true);
startDialogue("dialogue1");
allowCountdown = true;
return Function_Stop;
end
return Function_Continue;
end