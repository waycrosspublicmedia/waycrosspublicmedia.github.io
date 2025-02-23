import flixel.FlxG;
import objects.VideoSprite;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import backend.Paths;
import flixel.FlxSprite;

var white;
var vid:VideoSprite;
var animSuffix = '';
function onCreate()
{
    white = new FlxSprite().makeGraphic(1,1,FlxColor.BLACK);
    white.scale.set(FlxG.width,FlxG.height);
    white.updateHitbox();
    add(white);
    white.cameras = [game.camHUD];

    vid = new VideoSprite();
    vid.load('Yeahjoseecutscene1.mp4',[VideoSprite.muted]);
    add(vid);
    vid.cameras = [game.camHUD];
    vid.addCallback('onFormat',()->{
        vid.setGraphicSize(0,FlxG.height);
        vid.updateHitbox();
        vid.screenCenter();
    });
    vid.addCallback('onEnd',()->{
        remove(vid);
        vid.destroy();
        remove(white);
        white.destroy();
        FlxG.camera.zoom += 0.3;
        FlxG.camera.flash(FlxColor.WHITE,0.5);
        game.camZooming = true;
        game.uiGroup.visible = true;
        game.noteGroup.visible = true;
    });


    var sky = quickMake('Untitled1070_20240917172831');
    sky.scrollFactor.set(0.9,0.9);
    sky.screenCenter();
    addBehindGF(sky);

    var bg2 = quickMake('Untitled1070_20240917172829');
    bg2.screenCenter();
    bg2.scrollFactor.set(0.95,0.95);
    addBehindGF(bg2);

    var bg = quickMake('Untitled1070_20240917172826');
    bg.screenCenter();
    addBehindGF(bg);



    var house = quickMake('Untitled1070_20240917172825');
    house.screenCenter();
    addBehindGF(house);

    var chair = quickMake('Untitled1070_20240917172823');
    chair.screenCenter();
    addBehindGF(chair);
}

function onSongStart()
{
    vid.play();
}
function onCreatePost()
{
    game.noteGroup.visible = false;
    game.uiGroup.visible = false;
    game.gf.flipX = false;


    game.dad.animation.finishCallback = (s)->{
        if (s == 'crouch')
        {
            game.dad.playAnim('jump');
            doThing();
        }
    }

    // FlxTimer.wait(1,initJump);
}

function quickMake(s)
{
    var p = new FlxSprite();
    p.frames = Paths.getSparrowAtlas('stages/bleh/bgAssets');
    p.animation.addByPrefix('i',s,24,true);
    p.animation.play('i');
    p.scale.set(1.25,1.25);
    p.updateHitbox();
    p.active = false;

    return p;
}

function initJump()
{

    var newX = dad.getMidpoint().x + 150 + dad.cameraPosition[0] + game.opponentCameraOffset[0];
    var newY = dad.getMidpoint().y - 100 + dad.cameraPosition[1] + game.opponentCameraOffset[1];

    var time = 0.5;
    FlxTween.num(FlxG.camera.zoom,game.defaultCamZoom + 0.1,time, {ease: FlxEase.circInOut},(f)->{
        FlxG.camera.zoom = f;
        game.defaultCamZoom = f;
    });
    FlxTween.tween(game.camFollow, {x: newX, y: newY},time, {ease: FlxEase.circInOut,onUpdate: Void->FlxG.camera.snapToTarget()});
    game.isCameraOnForcedPos = true;


    game.dad.stunned = true;
    game.dad.playAnim('crouch',true);
}

function doThing()
{

    FlxTween.num(FlxG.camera.zoom,game.defaultCamZoom - 0.1,0.2, {ease: FlxEase.circInOut},(f)->{
        FlxG.camera.zoom = f;
        game.defaultCamZoom = f;
    });

    var timeToJump = 0.35;

    var newX = dad.x - 650;
    var newY = dad.y - 400;
    FlxTween.tween(dad, {y: newY - 100},timeToJump/2,{ease: FlxEase.circOut,onComplete: Void->{
        FlxTween.tween(dad, {y: newY + 100},(timeToJump/2) - 0.005,{ease: FlxEase.circIn});
    }});

    //68.71 
    FlxTween.tween(dad, {x: dad.x - 750},timeToJump, {onComplete:Void->{
        game.dad.cameraPosition[0] += 650;
        game.dad.cameraPosition[1] += 400;
        dad.x = newX;
        dad.y = newY;
        dad.idleSuffix = '-alt';
        dad.dance();
        animSuffix = '-alt';
        game.dad.stunned = false;
        game.isCameraOnForcedPos = false;
        game.moveCameraSection();

    }});

}


function onEvent(ev,v1,v2,time)
{
    if (ev == '' && v1 == 'jump')
    {
        initJump();
    }
}


function opponentNoteHitPre(note)
{
    note.animSuffix = animSuffix;
}