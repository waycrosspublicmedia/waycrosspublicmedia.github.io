// we're BAAAACK
var FILE_PREFIX:String = 'persona/';

var bg:BGSprite;
var overlay:BGSprite;
var date:BGSprite;
var scale:Float = 1.7;
var topbar:FlxSprite;
var botbar:FlxSprite;

var bfPos:Array<Float>;
var dadPos:Array<Float>;
var bfTween:FlxTween;
var dadTween:FlxTween;
var movement:Float = 30.0;

function onLoad()
{
    bg = new BGSprite(FILE_PREFIX + 'bg', 0, 0);
    bg.setGraphicSize(FlxG.width * scale, FlxG.height * scale);
    bg.updateHitbox();
    add(bg);

    overlay = new BGSprite(FILE_PREFIX + 'overlay', 0, 0);
    overlay.setGraphicSize(FlxG.width * scale, FlxG.height * scale);
    overlay.updateHitbox();
    overlay.blend = BlendMode.ADD;

    topbar = new FlxSprite(0, 0).makeGraphic(FlxG.width + 2, 80, FlxColor.BLACK);
    topbar.cameras = [game.camHUD];
    add(topbar);

    botbar = new FlxSprite(0, FlxG.height - 80).makeGraphic(FlxG.width + 2, 80, FlxColor.BLACK);
    botbar.cameras = [game.camHUD];
    add(botbar);

    date = new BGSprite(FILE_PREFIX + 'date', 0, 0);
    date.cameras = [game.camOther];

    bfTween = new FlxTween();
    dadTween = new FlxTween();
}

function onCreatePost()
{
    game.playHUD.ratingPrefix = FILE_PREFIX + 'ratings/';
    
    add(overlay);
    add(date);

    game.isCameraOnForcedPos = true;
    game.snapCamFollowToPos(bg.x + (bg.width / 2), bg.y + (bg.height / 2));

    bfPos = [game.boyfriend.x, game.boyfriend.y];
    dadPos = [game.dad.x, game.dad.y];

    game.setGameOverVideo('persona_gameover');
}

function onCountdownTick(count:Int)
{
    if (game.boyfriend.animation.curAnim.name == 'idle') doBFTween(0, movement / 2);
    if (game.dad.animation.curAnim.name == 'idle') doDadTween(0, movement / 2);
}

function onBeatHit()
{
    if (game.boyfriend.animation.curAnim.name == 'idle') doBFTween(0, movement / 2);
    if (game.dad.animation.curAnim.name == 'idle') doDadTween(0, movement / 2);
}

function goodNoteHit(note:Note)
{
    if (!note.isSustainNote) {
        switch (note.noteData % 4)
        {
            case 0:
                doBFTween(-movement, 0);
            case 1:
                doBFTween(0, movement);
            case 2:
                doBFTween(0, -movement);
            case 3:
                doBFTween(movement, 0);
        }
    }
}

function opponentNoteHit(note:Note)
{
    if (!note.isSustainNote) {
        switch (note.noteData % 4)
        {
            case 0:
                doDadTween(-movement, 0);
            case 1:
                doDadTween(0, movement);
            case 2:
                doDadTween(0, -movement);
            case 3:
                doDadTween(movement, 0);
        }
    }
}

function doBFTween(changeX:Float, changeY:Float)
{
    bfTween.cancel();
    game.boyfriend.x = bfPos[0] + changeX;
    game.boyfriend.y = bfPos[1] + changeY;

    bfTween = FlxTween.tween(game.boyfriend, {x: bfPos[0], y: bfPos[1]}, 0.1, {ease: FlxEase.quadOut});
}

function doDadTween(changeX:Float, changeY:Float)
{
    dadTween.cancel();
    game.dad.x = dadPos[0] + changeX;
    game.dad.y = dadPos[1] + changeY;

    dadTween = FlxTween.tween(game.dad, {x: dadPos[0], y: dadPos[1]}, 0.1, {ease: FlxEase.quadOut});
}