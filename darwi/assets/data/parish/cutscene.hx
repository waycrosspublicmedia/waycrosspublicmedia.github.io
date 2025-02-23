import flixel.tween.FlxTween;
import states.PlayState;
var parish:FlxSound;
var dialoguePhase:Int = 0;
var cutsceneMoment:Bool = true;
var sarv:Character;
// if you're reading this i set alpha to 0.001 to reduce lag when the object's alpha is set to a value where you can actually see it
function onStartCountdown()
{
if (PlayState.isStoryMode) {
 PlayState.inCutscene = true;
 PlayState.canPause = false;
if (dialoguePhase == 0) {
 FlxG.camera.fade(0xFF000000, 2, true);
 new FlxTimer().start(2, function(tmr:FlxTimer)
 {
 parish = FlxG.sound.play(Paths.music("parish_intro"));
 parish.looped = true;
 FlxTween.tween(FlxG.camera, {zoom: 0.7}, 2, {ease: FlxEase.quartOut});
  new FlxTimer().start(2, function(tmr:FlxTimer)
  {
  game.callOnScripts('doDialogue');
  dialoguePhase = 1;
  });
 });
 FlxG.camera.zoom = 1.65;
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
 sarv = new Character(game.dad.x, game.dad.y, 'sarvente-cutscene');
 game.addBehindDad(sarv);

} else if (dialoguePhase == 1) {
  FlxTween.tween(FlxG.camera, {zoom: 0.9}, 2, {ease: FlxEase.quartOut, onComplete: doShit});
} else if (dialoguePhase == 2) {
  sarv.playAnim("phoneAway", true);
  FlxG.sound.play(Paths.sound("Nokia Beep"));
  FlxG.camera.fade(0xFF000000, 1);
   new FlxTimer().start(1, function(tmr:FlxTimer)
   {
   FlxTween.tween(parish, {volume: 0}, 1.5);
   sarv.alpha = 0.001;
   FlxG.camera.zoom = 0.7;
   FlxG.camera.fade(0xFF000000, 1.5, true);
   game.dad.alpha = 1;
   game.gf.alpha = 1;
   game.boyfriend.alpha = 1;
   game.scoreTxt.alpha = 1;
   if (game.cpuControlled) game.botplayTxt.visible = true;
   game.iconP2.alpha = 1;
   game.iconP1.alpha = 1;
   game.healthBar.alpha = 1;
   game.camFollow.x = sarv.cameraPosition[0] + 200;
   new FlxTimer().start(1.5, function(tmr:FlxTimer)
   {
   game.cameraSpeed = 0.5;
   dialoguePhase = 3;
   game.callOnScripts('doDialogue');
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

function onUpdatePost(elapsed)
{

}

function doShit()
{
game.cameraSpeed = 1;
sarv.playAnim("smile", true);
FlxTween.tween(game.camFollow, {x: sarv.cameraPosition[0] + 30, y: sarv.cameraPosition[1] + 70}, 1, {ease: FlxEase.quartOut, onComplete: fuck});
}

function fuck()
{
new FlxTimer().start(1, function(tmr:FlxTimer)
{
game.callOnScripts('doDialogue');
dialoguePhase = 2;
});
}