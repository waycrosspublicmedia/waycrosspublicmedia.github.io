var black:FlxSprite;
function onCreate()
{
black = new FlxSprite().makeGraphic(10000, 10000, 0xFF000000);
black.scale.set(100, 100);
black.alpha = 0.001;
game.addBehindDad(black);
}

function onCreatePost()
{
if (game.isStoryMode) {
 if (game.storyDifficulty == 2 || game.storyDifficulty == 3)
    {
    game.storyPlaylist.push("gospel");
    }
   }
}

function onStepHit()
{
if (curStep == 113 || curStep == 929)
   {
   FlxTween.tween(black, {alpha: 0.8}, 1.04);
   game.cameraSpeed = 3;
   }
if (curStep == 128 || curStep == 944)
   {
   FlxTween.tween(black, {alpha: 0.001}, 0.5);
   }
}