import flixel.FlxSprite;

function onCreate()
{


    var bg = new FlxSprite().makeGraphic(1,1);
    bg.scale.set(4000,4000);
    bg.updateHitbox();
    bg.screenCenter();
    bg.scrollFactor.set();

    addBehindGF(bg);
}

