import flixel.util.FlxGradient;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxTiledSprite;
import backend.ClientPrefs;
import flixel.tweens.FlxTween;
import openfl.filters.ShaderFilter;
import backend.Conductor;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import backend.Paths;
import flixel.FlxSprite;

var sky:FlxSprite;

var signs:FlxSprite;
var stuff = [];
var bg;

var cloud;

var shader = game.createRuntimeShader('bloom');



var billboards = [];



function refreshBoard(spr:FlxSprite,nextAnim:String)
{
    spr.animation.play(nextAnim);
    spr.animation.update(FlxG.elapsed);
}


function onCreatePost()
{
    sky = FlxGradient.createGradientFlxSprite(1,FlxG.height,[FlxColor.WHITE,FlxColor.GRAY]);
    sky.x = -1000;
    sky.y = -200;
    sky.setGraphicSize(FlxG.width * 4, sky.height * 2);
    sky.updateHitbox();
    addBehindGF(sky);

    
    //not temp ig    
    var temp = new FlxSprite().loadGraphic(Paths.image('stages/fidy/temop'));
    addBehindGF(temp);
    temp.scrollFactor.set(0.7,1);


    function makeBoard(anim:String)
    {
        var b = new FlxSprite();
        b.frames = Paths.getSparrowAtlas('stages/fidy/albums');

        for (i in 1...16)
        {
            b.animation.addByPrefix('billboard_' + i,'billboard_' + i);
        }
        b.animation.play(anim);
        addBehindGF(b);
        b.scrollFactor.set(0.7,1);
        b.active = false;
        billboards.push(b);
    }

    makeBoard('billboard_15');
    makeBoard('billboard_1');
    makeBoard('billboard_4');
    makeBoard('billboard_7');
    makeBoard('billboard_8');


    
    
    bg = new FlxSprite().loadGraphic(Paths.image('stages/fidy/buildings'));
    addBehindGF(bg);
    bg.scrollFactor.set(0.7,1);

    signs = new FlxSprite().loadGraphic(Paths.image('stages/fidy/signs'));
    addBehindGF(signs);

    var floor = new FlxSprite().loadGraphic(Paths.image('stages/fidy/ffloor'));
    addBehindGF(floor);


    var fence = new FlxSprite().loadGraphic(Paths.image('stages/fidy/fen_ce'));
    add(fence);
    fence.scrollFactor.set(1.2,1.2);


    for (i in [bg,floor,fence,signs,temp].concat(billboards))
    {
        i.y = -50;
        i.x = -1200;
        i.scale.set(2,2);
        i.updateHitbox();
    }

    Paths.image('stages/fidy/cloud2');
    Paths.image('stages/fidy/cloud3');


    cloud = new FlxSprite().loadGraphic(Paths.image('stages/fidy/cloud'));
    insert(game.members.indexOf(sky) + 1,cloud);
    spawnCloud();


    stuff = [game.boyfriend,game.dad,bg,floor,fence,game.gf];

    if (ClientPrefs.data.shaders)
    {
        shader.setFloat('intensity',0.2);
        FlxG.camera.filters = [new ShaderFilter(shader)];
    }


}

var prevCloud = 1;
function spawnCloud(?_)
{
    var thing = Std.string(FlxG.random.int(1,3,[prevCloud]));
    if (thing == '1') thing = '';
    cloud.loadGraphic(Paths.image('stages/fidy/cloud' + thing));
    cloud.updateHitbox();
    cloud.x = bg.x - cloud.width/2;
    FlxTween.tween(cloud, {x: bg.x + bg.width},27,{onComplete: spawnCloud});
    prevCloud = Std.parseInt(thing);
}


function onUpdatePost(e)
{
    
    if (!endingSong)
    {
        var rerangedSongPos = FlxMath.bound(FlxMath.remapToRange(Conductor.songPosition,0,FlxG.sound.music.length,0,1),0,FlxG.sound.music.length);

        var color = FlxColor.interpolate(0xFFFFBFAE,0xFF431E44,rerangedSongPos);
        for (i in stuff.concat(billboards))
        {
            i.color = color;
        }

        var skyColor = FlxColor.interpolate(0xFFFFE9AE,0xFF1E1F44,rerangedSongPos);
        sky.color = skyColor;
    
        
        var tempColor = FlxColor.interpolate(0xFFFFBFAE,FlxColor.WHITE,rerangedSongPos);
        signs.color = tempColor;


        var cloudColor = FlxColor.interpolate(FlxColor.WHITE,0xFF5A2657,rerangedSongPos);
        cloud.color = cloudColor;
    }

}