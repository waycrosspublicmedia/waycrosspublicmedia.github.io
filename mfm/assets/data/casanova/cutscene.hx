import flixel.tween.FlxTween;
var dialoguePhase:Int = 0;
var cutsceneMoment:Bool = true;
var camHUDStuff:Array = [];
function onCreate()
{
if (PlayState.isStoryMode) FlxG.camera.fade(0xFF000000, 0.001);
}

function onStartCountdown()
{
if (PlayState.isStoryMode) {
if (dialoguePhase == 0) {
camHUDStuff = [game.scoreTxt, game.healthBar, game.iconP2, game.iconP1];
game.botplayTxt.visible = false;
for (i in camHUDStuff) i.alpha = 0.001;
game.isCameraOnForcedPos = true;
game.camFollow.x = 485;
game.camFollow.y = -700;
PlayState.canPause = false;
PlayState.inCutscene = true;
game.callOnScripts('doDialogue');
dialoguePhase = 1;
} else if (dialoguePhase == 1) {
FlxG.camera.fade(0xFF000000, 2, true);
FlxTween.tween(game.camFollow, {x: game.dad.cameraPosition[0] + 350, y: game.dad.cameraPosition[1] + 200}, 2, {ease: FlxEase.quartOut, onComplete: fuck});
for (i in camHUDStuff) FlxTween.tween(i, {alpha: 1}, 2, {ease: FlxEase.quartOut});
if (game.cpuControlled) game.botplayTxt.visible = true;
}

  if (cutsceneMoment == true) {
  return Function_Stop;
  } else {
  return Function_Continue;
  }
} else {
return Function_Continue;
}
}

function fuck()
{
game.callOnScripts('doDialogue');
dialoguePhase = 2;
cutsceneMoment = false;
game.isCameraOnForcedPos = false;
PlayState.canPause = true;
PlayState.inCutscene = false;
}

function onEndSong()
{
if (PlayState.isStoryMode) {
cutsceneMoment = true;
PlayState.canPause = false;
PlayState.inCutscene = true;
 if (dialoguePhase == 2) {
 FlxG.camera.alpha = 0;
 game.callOnScripts('doDialogue');
 dialoguePhase = 3;
 for (i in camHUDStuff) i.alpha = 0.001;
 game.botplayTxt.visible = false;
 } else if (dialoguePhase == 3) {
 cutsceneMoment = false;
 }
}
 if (cutsceneMoment == true) {
 return Function_Stop;
 } else {
 return Function_Continue;
 }
}