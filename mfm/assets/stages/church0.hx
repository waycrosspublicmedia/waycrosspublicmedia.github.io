var bg:FlxSprite;
var fg:FlxSprite;
var curtains:FlxSprite;
function onCreate()
{
bg = new FlxSprite(-750, -400).loadGraphic(Paths.image("stages/church0/stageback"));
bg.antialiasing = ClientPrefs.data.antialiasing;
game.addBehindGF(bg);

fg = new FlxSprite(-700, 400).loadGraphic(Paths.image("stages/church0/stagefront"));
fg.antialiasing = ClientPrefs.data.antialiasing;
game.addBehindGF(fg);

curtains = new FlxSprite(-1150, -450).loadGraphic(Paths.image("stages/church0/stagecurtains"));
curtains.scrollFactor.set(1.3, 1.3);
curtains.antialiasing = ClientPrefs.data.antialiasing;
game.add(curtains);

game.skipCountdown = true;
}