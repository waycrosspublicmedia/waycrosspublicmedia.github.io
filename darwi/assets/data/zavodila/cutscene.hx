import flixel.tween.FlxTween;
var dialoguePhase:Int = 0;
var cutsceneMoment:Bool = true;
var sarv:FlxSprite;
var ruv:FlxSprite;
function onStartCountdown()
{
if (PlayState.isStoryMode) {
if (dialoguePhase == 0) {
 PlayState.inCutscene = true;
 PlayState.canPause = false;
 ruv = new FlxSprite(game.dad.x + 900, game.dad.y + 100).loadGraphic(Paths.image("he likes to be alone"));
 ruv.antialiasing = ClientPrefs.data.antialiasing;
 game.add(ruv);

 sarv = new FlxSprite(game.dad.x + 300, game.dad.y + 50);
 sarv.frames = Paths.getSparrowAtlas("theseknees");
 sarv.animation.addByPrefix("idle", "TiredSarv", 12, true);
 sarv.animation.play("idle");
 sarv.antialiasing = ClientPrefs.data.antialiasing;
 game.add(sarv);

 FlxG.camera.fade(0xFF000000, 2, true);
  new FlxTimer().start(2, function(tmr:FlxTimer)
  {
  game.cameraSpeed = 1;
  FlxG.sound.play(Paths.sound("huh-sarv"));
  FlxTween.tween(game.camFollow, {x: sarv.x + 525, y: sarv.y + 350}, 1, {ease: FlxEase.quartOut});
  new FlxTimer().start(2, function(tmr:FlxTimer)
  {
  game.callOnScripts('doDialogue');
  dialoguePhase = 1;
  });
  });
 game.dad.alpha = 0.001;
 game.gf.alpha = 0.001;
 game.boyfriend.alpha = 0.001;
 game.scoreTxt.alpha = 0.001;
 game.botplayTxt.visible = false;
 game.iconP2.alpha = 0.001;
 game.iconP1.alpha = 0.001;
 game.healthBar.alpha = 0.001;
 game.cameraSpeed = 50;
 game.isCameraOnForcedPos = true;
 game.camFollow.x = 485;
 game.camFollow.y = -700;
 } else if (dialoguePhase == 1) {
 game.camHUD.fade(0xFF000000, 1.5);
  new FlxTimer().start(1.5, function(tmr:FlxTimer)
  {
  game.camHUD.fade(0xFF000000, 1.5, true);
  game.dad.alpha = 1;
  game.gf.alpha = 1;
  game.boyfriend.alpha = 1;
  game.scoreTxt.alpha = 1;
  if (game.cpuControlled) game.botplayTxt.visible = true;
  game.iconP2.alpha = 1;
  game.iconP1.alpha = 1;
  game.healthBar.alpha = 1;
  sarv.destroy();
  ruv.destroy();
   new FlxTimer().start(1.5, function(tmr:FlxTimer)
   {
   game.callOnScripts('doDialogue');
   dialoguePhase = 2;
   cutsceneMoment = false;
   PlayState.inCutscene = false;
   PlayState.canPause = true;
   game.isCameraOnForcedPos = false;
   });
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
