var bg:FlxSprite;
var circ0:FlxSprite;
var circ1:FlxSprite;
var floor:FlxSprite;
var pillars:FlxSprite;
function onCreate()
{
bg = new FlxSprite(-450, -1000).loadGraphic(Paths.image("stages/church3/bg"));
bg.antialiasing = ClientPrefs.data.antialiasing;
bg.scrollFactor.set(0.85, 1);
bg.scale.set(1.3, 1.3);
game.addBehindGF(bg);
circ0 = new FlxSprite(-450, -1000).loadGraphic(Paths.image("stages/church3/circ0"));
circ0.antialiasing = ClientPrefs.data.antialiasing;
circ0.scrollFactor.set(0.85, 1);
circ0.scale.set(1.3, 1.3);
game.addBehindGF(circ0);
circ1 = new FlxSprite(195, -750).loadGraphic(Paths.image("stages/church3/circ1"));
circ1.antialiasing = ClientPrefs.data.antialiasing;
circ1.scrollFactor.set(0.85, 1);
circ1.scale.set(1.3, 1.3);
//circ1.origin.set(1000, 655);
game.addBehindGF(circ1);
floor = new FlxSprite(-460, -1000).loadGraphic(Paths.image("stages/church3/floor"));
floor.antialiasing = ClientPrefs.data.antialiasing;
floor.scale.set(1.3, 1.3);
game.addBehindGF(floor);
pillars = new FlxSprite(-400, -1100).loadGraphic(Paths.image("stages/church3/pillars"));
pillars.antialiasing = ClientPrefs.data.antialiasing;
pillars.scale.set(1.4, 1.4);
game.addBehindGF(pillars);
}

function onCountdownStarted()
{
FlxTween.tween(game.dad, {y: game.dad.y - 75}, 3.5, {ease: FlxEase.cubeInOut, type: FlxTween.PINGPONG});
}

function opponentNoteHit(note)
{
circ1.angle -= 10;
}

function goodNoteHit(note)
{
circ1.angle += 10;
}