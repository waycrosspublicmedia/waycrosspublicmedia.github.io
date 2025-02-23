//import openfl.filters.ShaderFilter;

var bg:BGSprite;

function onLoad()
{
    bg = new BGSprite('grinch/bg', 0, 0);
    bg.updateHitbox();
    add(bg);
}

function onCreatePost()
{
    //game.isCameraOnForcedPos = true;
    game.snapCamFollowToPos(bg.x + (bg.width / 2), bg.y + (bg.height / 2));
    modManager.setValue("opponentSwap", 0.125);
    
   //var vhs:FlxShader = newShader('vhs');
   //var filter:ShaderFilter = new ShaderFilter(vhs); // I'll rewrite this slightly to make it to use an for i loop
   //game.camGame._filters = [];
   //game.camGame._filters.push(filter);
   //game.camHUD._filters = [];
   //game.camHUD._filters.push(filter);
   //game.camOther._filters = [];
   //game.camOther._filters.push(filter);
    game.card.x += 160;
    
    var leftbar:FlxSprite = new FlxSprite(0, 0).makeGraphic(160, 720, FlxColor.BLACK);
    leftbar.cameras = [camOther];
    game.add(leftbar);
    var rightbar:FlxSprite = new FlxSprite(FlxG.width - 160, 0).makeGraphic(162, 720, FlxColor.BLACK);
    rightbar.cameras = [camOther];
    game.add(rightbar); // doing add always renders it underneath the song card but game.add doesn't?????

    game.playHUD.comboOffsets = [-200, -50, -100, -50];

    game.setGameOverVideo('grinch');
}