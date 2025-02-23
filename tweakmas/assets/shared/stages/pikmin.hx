var FILE_PREFIX:String = 'pikmin/';
var cameos:Array<String> = ['oramge', 'spouse_alert', 'nichimeme', 'DOGS'];
var cam:FlxSprite;

function onLoad()
{
    add(new BGSprite(FILE_PREFIX + 'actual_background', -1200, -700, 0.1, 0.1));
    add(new BGSprite(FILE_PREFIX + 'background_tree', -300, -500, 0.7, 0.7));
    add(new BGSprite(FILE_PREFIX + 'background', 0, -200, 0.9, 0.9));
    add(new BGSprite(FILE_PREFIX + 'middleground', 0, 0, 1, 1));
    add(new BGSprite(FILE_PREFIX + 'brittany', 1100, 920, 1, 1, ['idle_b0'], true));
    add(new BGSprite(FILE_PREFIX + 'charlie-pikmin', 1600, 860, 1, 1, ['idle_c0'], true));
    // Hope this precaches them properly
    Paths.image(FILE_PREFIX + 'oramge');
    Paths.image(FILE_PREFIX + 'spouse_alert');
    Paths.image(FILE_PREFIX + 'nichimeme');
    Paths.image(FILE_PREFIX + 'DOGS');
}

function onCreatePost()
{
    cam = new FlxSprite(0, 0);
    cam.antialiasing = ClientPrefs.globalAntialiasing;
    add(cam);

    add(new BGSprite(FILE_PREFIX + 'foreground', 200, 200, 1.2, 1.2)); // .zindex is a thing now btw

    game.dad.visible = false;
    modManager.setValue("opponentSwap", 0.5);
    modManager.setValue("alpha", 1, 1); // one day ima get u cam why tf does 1 make it invisible it should be the other way around
    game.playHUD.iconP2.visible = false;
    game.playHUD.healthBar.setColors(FlxColor.RED, FlxColor.fromRGB(102, 255, 51));
    game.playHUD.comboOffsets = [-325, 0, -225, 0];
    game.snapCamFollowToPos(1500, 1000);

    game.setGameOverVideo('pickingmen');
}

function onSongStart() game.camZooming = true;

function onUpdatePost(elapsed) game.playHUD.iconP1.x -= 45;

function spawnCameo()
{
    if (cameos.length < 1) return;

    var thisCam:String = cameos[FlxG.random.int(0, cameos.length - 1)];
    cameos.remove(thisCam);
    var thisY:Float = 700;
    var facingRight:Bool = false;

    switch (thisCam) {
        case 'DOGS':
            thisY += 260;
        case 'spouse_alert':
            thisY -= 450;
        case 'nichimeme':
            thisY -= 175;
            facingRight = true;
        case 'oramge':
            thisY -= 175;
    }

    cam.loadGraphic(Paths.image(FILE_PREFIX + thisCam));
    cam.updateHitbox();
    cam.y = thisY;
    if(facingRight)
    {
        cam.x = -3000;
        FlxTween.tween(cam, {x: 5000}, 25, {onComplete: function(tween:FlxTween) {
            cameoActive = false;
        }});
    }
    else
    {
        cam.x = 5000;   
        FlxTween.tween(cam, {x: -3000}, 25, {onComplete: function(tween:FlxTween) {
            cameoActive = false;
        }});
    }
    new FlxTimer().start(4, function(tmr:FlxTimer)
    {
        game.isCameraOnForcedPos = true;
        FlxTween.tween(game, {defaultCamZoom: 0.35}, 5, {ease: FlxEase.smootherStepInOut});
        FlxTween.tween(game.camFollow, {x:2300, y:1000}, 5, {ease: FlxEase.smootherStepInOut});
    });
    new FlxTimer().start(12.5, function(tmr:FlxTimer)
    {
        FlxTween.tween(game, {defaultCamZoom: 0.6}, 5, {ease: FlxEase.smootherStepInOut});
        FlxTween.tween(game.camFollow, {y: 1188, x: 1525}, 5, {ease: FlxEase.smootherStepInOut, onComplete: function(tween:FlxTween) {
            game.isCameraOnForcedPos = false;
        }});
    });
}

function onEvent(name:String, v1:String, v2:String)
{
    if (name == 'Pikmin Events') {
        switch (v1) {
            case 'cameo':
                spawnCameo();
        }
    }
}