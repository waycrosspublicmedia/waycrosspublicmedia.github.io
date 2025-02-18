var bg:FlxSprite;
var floor:FlxSprite;
var pillars:FlxSprite;
function onCreate()
{
bg = new FlxSprite(-450, -1000).loadGraphic(Paths.image("stages/church1/bg"));
bg.antialiasing = ClientPrefs.data.antialiasing;
bg.scrollFactor.set(0.85, 1);
bg.scale.set(1.3, 1.3);
game.addBehindGF(bg);
floor = new FlxSprite(-460, -1000).loadGraphic(Paths.image("stages/church1/floor"));
floor.antialiasing = ClientPrefs.data.antialiasing;
floor.scale.set(1.3, 1.3);
game.addBehindGF(floor);
pillars = new FlxSprite(-400, -1100).loadGraphic(Paths.image("stages/church1/pillars"));
pillars.antialiasing = ClientPrefs.data.antialiasing;
pillars.scale.set(1.4, 1.4);
game.addBehindGF(pillars);

if (game.songName == "Worship" || game.songName == "worship")
   {
   bg.color = 0xFFB68499;
   floor.color = 0xFFB68499;
   pillars.color = 0xFFB68499;
   }
}