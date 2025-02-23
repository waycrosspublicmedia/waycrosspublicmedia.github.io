var blackScreen:FlxSprite;
var woodstock:FlxSprite;
var fuckmychunguslife:Bool = false;

function onLoad()
{
    var sky:FlxSprite = new FlxSprite(-50, -275);
    sky.frames = Paths.getSparrowAtlas('peanuts/sky');
    sky.animation.addByPrefix('idle', 'sky', 3, true);
    sky.animation.play('idle');
    sky.antialiasing = ClientPrefs.globalAntialiasing;
    sky.scrollFactor.set(0.75, 0.75);
	add(sky);
    
    var ground:BGSprite = new BGSprite('peanuts/ground', 0, 0);
    ground.updateHitbox();
    ground.antialiasing = false;
    add(ground);

    var house:FlxSprite = new FlxSprite(477, 1001);
    house.frames = Paths.getSparrowAtlas('peanuts/house');
    house.animation.addByPrefix('idle', 'house', 3, true);
    house.animation.play('idle');
    house.antialiasing = false;
	add(house);

    blackScreen = new FlxSprite().makeGraphic(1, 1, 0xFF000000);
    blackScreen.scale.set(FlxG.width + 2, FlxG.height);
    blackScreen.updateHitbox();
    blackScreen.cameras = [game.camOther];
    add(blackScreen);

    woodstock = new FlxSprite(1050, 700);
    woodstock.frames = Paths.getSparrowAtlas('peanuts/woodstock');
    woodstock.animation.addByPrefix('idle', 'idle', 24, true);
    woodstock.animation.addByPrefix('flyIn', 'flyin', 24, false);
    woodstock.animation.addByPrefix('flyOut', 'flyout', 24, false);
    woodstock.antialiasing = false;
    woodstock.visible = false;
	add(woodstock);

    game.skipCountdown = true;
}

function onCreatePost()
{
    game.isCameraOnForcedPos = true;
    game.camHUD.alpha = 0;
    game.snapCamFollowToPos(975, 500);
    game.setGameOverVideo('wow');
}

var s:Float = 1;
var woodY:Float = 675;
function onUpdate(elapsed){
    if(fuckmychunguslife)
    {
        s += elapsed;
        woodstock.y = FlxMath.lerp(woodstock.y, woodY + (Math.cos(s) * 30), FlxMath.bound(1, 0, elapsed * 4));
    }
}

function onEvent(name:String, v1:String, v2:String)
{
    switch (name) 
    {
        case 'LL Events':
            switch (v1)
            {
                case 'intro':
                FlxTween.tween(game.camFollow, {y: 1375}, 3.25, {ease: FlxEase.smootherStepInOut, startDelay: 0.5, 
                onComplete: function(tween:FlxTween) {
                    new FlxTimer().start(0.5, function(tmr:FlxTimer)
                    {
                        FlxTween.tween(game.camHUD, {alpha: 1}, 2.0, {ease: FlxEase.expoOut});
                        FlxTween.tween(FlxG.camera, {zoom: 0.85}, 1, {ease: FlxEase.expoOut});
                        game.isCameraOnForcedPos = false;
                    });
                }});
                FlxTween.tween(blackScreen, {alpha: 0}, 3.5, {ease: FlxEase.expoOut, startDelay: 0.5});
                FlxTween.tween(FlxG.camera, {zoom: 0.75}, 3, {ease: FlxEase.smootherStepInOut, startDelay: 1});
                case 'hi lil fella':
                    woodstock.visible = true;
                    woodstock.animation.play('flyIn');
                    woodstock.animation.finishCallback = function (){
                        woodstock.animation.play('idle');
                        fuckmychunguslife = true;
                    }
                case 'bye lil fella':
                    fuckmychunguslife = false;
                    woodstock.animation.play('flyOut');
                    woodstock.animation.finishCallback = function (){
                        woodstock.visible = false;
                    }
                case 'middle camera':
                    switch (v2)
                    {
                        case 'on':
                            game.isCameraOnForcedPos = true;
                            game.camFollow.set(975, 1350);
                            FlxTween.tween(game, {defaultCamZoom: 0.75}, 1, {ease: FlxEase.expoOut});
                        case 'off':
                            game.isCameraOnForcedPos = false;
                            FlxTween.tween(game, {defaultCamZoom: 0.85}, 1, {ease: FlxEase.expoOut});
                    }
            }
    }
}