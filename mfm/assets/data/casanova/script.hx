import flixel.math.FlxMath;
import flixel.math.FlxAngle;
var black:FlxSprite;
var circle:FlxSprite;
var spin:Float = 0;
var firstTime:Bool = true;
function onCreatePost()
{
black = new FlxSprite().makeGraphic(10000, 10000, 0xFF000000);
black.scale.set(100, 100);
black.alpha = 0.001;
game.addBehindDad(black);

circle = new FlxSprite(game.dad.x - 25, game.dad.y).loadGraphic(Paths.image("circ"));
circle.alpha = 0.001;
circle.scale.set(0.3, 0.3);
circle.antialiasing = ClientPrefs.data.antialiasing;
game.addBehindDad(circle);
}

function onUpdatePost(elapsed)
{
spin += elapsed * 10;
circle.angle = 300 * (FlxMath.fastSin(FlxAngle.asRadians(spin)));
}

function onCountdownStarted()
{
  new FlxTimer().start(1.8, function(tmr:FlxTimer)
  {
  FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.75, {ease: FlxEase.quartOut});
  game.dad.playAnim("hey", true);
  game.dad.specialAnim = true;
  FlxTween.tween(black, {alpha: 0.8}, 0.75);
  activateCircle();
  });
}

function onStepHit()
{
if (curStep == 288 || curStep == 352)
   {
   FlxTween.tween(black, {alpha: 0.8}, 0.75);
   activateCircle();
   if (curStep == 288) firstTime = true;
   }
if (curStep == 384)
   {
   FlxTween.tween(circle, {alpha: 0.001}, 2);
   }
}

function activateCircle()
{
circle.scale.set(0.3, 0.3);
FlxTween.tween(circle, {alpha: 1}, 0.75, {ease: FlxEase.sineInOut});
FlxTween.tween(circle.scale, {x: 1, y: 1}, 0.75, {ease: FlxEase.sineInOut});
}

function opponentNoteHit(note)
{
if (black.alpha == 0.8) { 
   FlxTween.tween(black, {alpha: 0.001}, 0.75);
   if (firstTime) {
   FlxTween.tween(circle, {alpha: 0.001}, 2);
   firstTime = false;
   }
   }
}