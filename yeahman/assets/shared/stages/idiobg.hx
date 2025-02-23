import flixel.tweens.FlxTween;
import objects.VideoSprite;
import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;
import flixel.FlxSprite;


var anims:Array<FlxSprite> = [];
var curAnim = -1;
var isPlaying:Bool = false;

var video:FlxVideoSprite;

function onCreate()
{
    var bg = new FlxSprite(-870, -380).loadGraphic(Paths.image('stages/morado/idio_bg'));
    addBehindGF(bg);


    var bgBoppers = ['BLACKFLASH','FROGGER','JOEY','KAREEM'];
    var xy = [[-750,0],[-2000,-200],[-300,-550],[-500,-350]];
    for (i in 0...bgBoppers.length)
    {
        var newSpr = new FlxSprite(xy[i][0],xy[i][1]);
        newSpr.frames = Paths.getSparrowAtlas('stages/morado/' + bgBoppers[i] + 'bg');
        newSpr.animation.addByPrefix('i', bgBoppers[i].toLowerCase(),24,false);
        // newSpr.animation.play('i');
        newSpr.visible = false;
        newSpr.animation.finishCallback = (f)->{
            isPlaying = false;
        }
        addBehindGF(newSpr);
        anims.push(newSpr);
    }

    video = new VideoSprite();
    add(video);
    video.addCallback('onFormat',()->{
        video.bitmap.rate = 0.9;
        video.cameras = [game.camHUD];
        video.setGraphicSize(0,FlxG.height);
        video.updateHitbox();
        video.screenCenter();

    });

    video.addCallback('onEnd',()->{
        FlxG.camera._fxFadeAlpha = 0;
        game.camHUD._fxFadeAlpha = 1;
        FlxTween.tween(game.camHUD, {_fxFadeAlpha: 0},0.7);
        FlxG.camera.zoom += 0.2;
        game.camZooming = true;

        game.uiGroup.visible = true;
        game.noteGroup.visible = true;
    });

    video.load('morado_cutscene.mp4');




    

    FlxG.camera._fxFadeAlpha = 1;
    


}



function onCreatePost() 
{
    game.uiGroup.visible = false;
    game.noteGroup.visible = false;
    
}

function onSongStart()
{
    video.play();
}

function onBeatHit()
{
    if (curBeat > 70 && curBeat % 2 == 0 && FlxG.random.bool(10)) spawnAnim();
}

function spawnAnim()
{
    if (isPlaying) return;
    isPlaying = true;

    var num = FlxG.random.int(0,anims.length-1,[curAnim]);

    var ran = anims[num];
    ran.visible = true;
    ran.animation.play('i');


    curAnim = num;
}
