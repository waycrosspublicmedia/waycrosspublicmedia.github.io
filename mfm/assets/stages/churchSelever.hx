var bg:FlxSprite;
var floor:FlxSprite;
var pillars:FlxSprite;
function onCreate()
{
bg = new FlxSprite(-450, -1000).loadGraphic(Paths.image("stages/churchSelever/bg"));
bg.antialiasing = ClientPrefs.data.antialiasing;
bg.scrollFactor.set(0.85, 1);
bg.scale.set(1.3, 1.3);
game.addBehindGF(bg);
floor = new FlxSprite(-460, -1000).loadGraphic(Paths.image("stages/churchSelever/floor"));
floor.antialiasing = ClientPrefs.data.antialiasing;
floor.scale.set(1.3, 1.3);
game.addBehindGF(floor);
pillars = new FlxSprite(-400, -1100).loadGraphic(Paths.image("stages/churchSelever/pillars"));
pillars.antialiasing = ClientPrefs.data.antialiasing;
pillars.scale.set(1.4, 1.4);
game.addBehindGF(pillars);
}