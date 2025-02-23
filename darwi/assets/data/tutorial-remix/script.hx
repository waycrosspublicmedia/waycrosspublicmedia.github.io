import flixel.tween.FlxTween;
import flixel.timer.FlxTimer;
import cutscenes.DialogueBoxPsych;
var two:FlxSprite;
var one:FlxSprite;
var go:FlxSprite;

function onCreate()
{
two = new FlxSprite().loadGraphic(Paths.image("ready"));
two.antialiasing = ClientPrefs.data.antialiasing;
two.cameras = [game.camHUD];
two.screenCenter();
two.alpha = 0.001;
game.add(two);

one = new FlxSprite().loadGraphic(Paths.image("set"));
one.antialiasing = ClientPrefs.data.antialiasing;
one.cameras = [game.camHUD];
one.screenCenter();
one.alpha = 0.001;
game.add(one);

go = new FlxSprite().loadGraphic(Paths.image("go"));
go.antialiasing = ClientPrefs.data.antialiasing;
go.cameras = [game.camHUD];
go.screenCenter();
go.alpha = 0.001;
game.add(go);
}

function onStepHit()
{
if (curStep == 52)
   {
   two.alpha = 1;
   FlxTween.tween(two, {alpha: 0.001}, Conductor.crochet / 1000, {ease: FlxEase.cubeInOut});
   }
if (curStep == 56)
   {
   one.alpha = 1;
   FlxTween.tween(one, {alpha: 0.001}, Conductor.crochet / 1000, {ease: FlxEase.cubeInOut});
   }
if (curStep == 60)
   {
   go.alpha = 1;
   FlxTween.tween(go, {alpha: 0.001}, Conductor.crochet / 1000, {ease: FlxEase.cubeInOut});
   }
}