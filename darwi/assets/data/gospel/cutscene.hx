import flixel.tween.FlxTween;
import flixel.util.FlxColor;
import flixel.animation.FlxAnimationController;
import flixel.animation.FlxAnimation;
var dialoguePhase:Int = 0;
var cutsceneMoment:Bool = true;
var sarv:FlxSprite;
var black:FlxSprite;
var pink:FlxSprite;
var firstTime:Bool = true;
var camHUDStuff:Array = [];
function onStartCountdown()
{
if (PlayState.isStoryMode) {
if (dialoguePhase == 0) {
// if i dont completely clear the storyplaylist it loops gospel forever
PlayState.storyPlaylist = [];
 //PlayState.inCutscene = true;
 //PlayState.canPause = false;
 game.dad.alpha = 1;
 camHUDStuff = [game.scoreTxt, game.healthBar, game.iconP2, game.iconP1];
 game.botplayTxt.visible = false;
 for (i in camHUDStuff) i.alpha = 0.001;
 game.cameraSpeed = 50;
 game.isCameraOnForcedPos = true;
 game.camFollow.x = game.dad.cameraPosition[0] + 50;
 game.camFollow.y = game.dad.cameraPosition[1] + 150;
 pink = new FlxSprite().makeGraphic(10000, 10000, 0xFFF93397);
 pink.scale.set(100, 100);
 pink.alpha = 1;
 game.add(pink);
 black = new FlxSprite().makeGraphic(10000, 10000, 0xFF000000);
 black.scale.set(100, 100);
 black.alpha = 1;
 game.add(black);
 sarv = new FlxSprite(game.dad.x - 155, game.dad.y - 80);
 sarv.frames = Paths.getSparrowAtlas("pegMePlease");
 sarv.animation.addByPrefix("idle", "SarvTransAnim", 10, false);
 sarv.scale.set(1.15, 1.15);
 sarv.antialiasing = ClientPrefs.data.antialiasing;
 game.add(sarv);
  new FlxTimer().start(1, function(tmr:FlxTimer)
  {
  game.callOnScripts('doDialogue');
  dialoguePhase = 1;
  });
} else if (dialoguePhase == 1) {
 black.alpha = 0.001;
 sarv.animation.play("idle");
  new FlxTimer().start(0.75, function(tmr:FlxTimer)
  {
  game.cameraSpeed = 2;
  FlxG.sound.play(Paths.sound("tearShit"));
  FlxG.sound.play(Paths.sound("distorted_gospel"));
  FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.5, {ease: FlxEase.quartOut});
  });
  new FlxTimer().start(1.5, function(tmr:FlxTimer)
  {
  FlxTween.tween(game.camFollow, {y: game.camFollow.y - 550}, 0.75, {ease: FlxEase.quartOut});
  FlxTween.tween(FlxG.camera, {zoom: 0.7}, 0.75, {ease: FlxEase.quartOut});
  });
  new FlxTimer().start(2.25, function(tmr:FlxTimer)
  {
  FlxTween.tween(game.camFollow, {x: game.dad.cameraPosition[0] + 200, y: game.dad.cameraPosition[1] + 100}, 1.5, {ease: FlxEase.quartOut});
  });
  new FlxTimer().start(4.5, function(tmr:FlxTimer)
  {
  FlxTween.tween(pink, {alpha: 0}, 0.5, {ease: FlxEase.quartOut});
  FlxTween.tween(sarv, {alpha: 0}, 0.5, {ease: FlxEase.quartOut, onComplete: help});
  for (i in camHUDStuff) FlxTween.tween(i, {alpha: 1}, 0.5, {ease: FlxEase.quartOut});
  if (game.cpuControlled) game.botplayTxt.visible = true;
  });
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

function help()
{
game.callOnScripts('doDialogue');
dialoguePhase = 2;
cutsceneMoment = false;
PlayState.canPause = true;
PlayState.inCutscene = false;
game.isCameraOnForcedPos = false;
}

function onUpdate(elapsed)
{
}