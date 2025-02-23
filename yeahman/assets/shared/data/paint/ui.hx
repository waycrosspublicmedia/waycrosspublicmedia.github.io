import backend.Mods;
import states.Freeplay;
import states.PlayState;
import states.MapState;
import flixel.addons.transition.FlxTransitionableState;
import backend.Controls;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import backend.Conductor;
import psychlua.LuaUtils;
import psychlua.CustomSubstate;
import backend.ClientPrefs;
import flixel.math.FlxRect;
import flixel.math.FlxMath;
import backend.Paths;
import flixel.FlxSprite;

var bar;
var bar2;
var circle;
var frame;

function onCreatePost()
{
	frame = new FlxSprite().loadGraphic(Paths.image('stages/paint/frame'));
	add(frame);
	frame.cameras = [game.camHUD];

	frame.screenCenter(FlxAxes.X);

	if (!ClientPrefs.data.downScroll)
	{
		frame.y = FlxG.height - frame.height + 2;
		frame.flipY = true;
	}

	bar = new FlxSprite().loadGraphic(Paths.image('stages/paint/bar'));
	bar.x = frame.x + (frame.width - bar.width) / 2;
	bar.y = frame.y + (frame.height - bar.height) / 2;
	add(bar);
	bar.cameras = [game.camHUD];

	bar2 = new FlxSprite().loadGraphic(Paths.image('stages/paint/bar'));
	bar2.x = frame.x + (frame.width - bar2.width) / 2;
	bar2.y = frame.y + (frame.height - bar2.height) / 2;
	add(bar2);
	bar2.cameras = [game.camHUD];
	bar2.color = 0xFF244B76;

	circle = new FlxSprite().loadGraphic(Paths.image('stages/paint/circle'));
	circle.x = frame.x + (frame.width - circle.width) / 2;
	circle.y = frame.y + (frame.height - circle.height) / 2;
	add(circle);
	circle.cameras = [game.camHUD];
	circle.antialiasing = true;

	game.updateIconsPosition = () -> {
		game.iconP2.setPosition(frame.x - (game.iconP2.width) + 40, frame.y + (frame.height - game.iconP2.height) / 2);
		game.iconP1.setPosition(frame.x + frame.width - (game.iconP1.width / 3) + 10, frame.y + (frame.height - game.iconP1.height) / 2);
	};
	game.updateIconsScale = (e) -> {
		var mult:Float = FlxMath.lerp(0.5, game.iconP1.scale.x, Math.exp(-e * 9 * game.playbackRate));
		game.iconP1.scale.set(mult, mult);

		var mult:Float = FlxMath.lerp(0.5, game.iconP2.scale.x, Math.exp(-e * 9 * game.playbackRate));
		game.iconP2.scale.set(mult, mult);
	};


    game.playerStrums.members[0].addOffsets('confirm',0,0);
    game.playerStrums.members[1].addOffsets('confirm',0,0);
    game.playerStrums.members[2].addOffsets('confirm',0,0);
    game.playerStrums.members[3].addOffsets('confirm',0,0);
}

function onUpdatePost(e)
{
	circle.x = FlxMath.remapToRange(FlxMath.bound(game.health, 0, 2), 0, 2, bar.x + bar.width - (circle.width / 2), bar.x - (circle.width / 2));

	var rect = bar2.clipRect;
	if (rect == null) rect = new FlxRect(0, 0, bar.width, bar.height);
	rect.width = FlxMath.remapToRange(game.health, 0, 2, 0, bar2.width);
	rect.x = bar2.width - rect.width;
	bar2.clipRect = rect;
}

function onBeatHit()
{
	game.iconP2.scale.set(0.6, 0.6);
	game.iconP1.scale.set(0.6, 0.6);

	// game.iconP1.updateHitbox();
	// game.iconP2.updateHitbox();
}

var caughtSongPos = 0;
var canEnter:Bool = false;

var hasDied = false;
function onGameOver()
{
    if (!hasDied)
        initDeath();

	return LuaUtils.Function_Stop;
}

function initDeath()
{
    hasDied = true;

    FlxG.animationTimeScale = 0;
    FlxG.camera.followLerp = 0;
    FlxG.camera.target = null;
    game.canPause = false;
    game.freezeCamera = true;
    game.canReset = false;

    game.allowDebugKeys = false;

    
    caughtSongPos = Conductor.songPosition;

    new FlxTimer().start(0.1,(f)->{
        game.vocals.volume = 1;
        FlxG.sound.music.time = caughtSongPos - FlxG.random.int(5,7);
        Conductor.songPosition = FlxG.sound.music.time;
        game.vocals.time = FlxG.sound.music.time;

        if (f.loopsLeft == 0)
        {
            FlxG.camera.visible = false;
            game.camHUD.visible = false;
            CustomSubstate.openCustomSubstate('weener', true);
        }
    },15);
}


function onCustomSubstateUpdatePost(name,ep)
{
    if (name == 'weener')
    {
        if (canEnter)
        {
            if (Controls.instance.ACCEPT)
            {
                canEnter = false;

                FlxG.sound.music.stop();

                FlxTransitionableState.skipNextTransIn = true;
                game.variables.get('sorry').visible = false;
                game.variables.get('sorry2').visible = true;
                FlxTimer.wait(3,()->
                {
                    FlxG.resetState();
                });

            }

            if (Controls.instance.BACK)
            {
				FlxG.sound.music.stop();
				PlayState.deathCounter = 0;
				PlayState.seenCutscene = false;
				PlayState.chartingMode = false;


				Mods.loadTopMod();
				if (PlayState.isStoryMode) MapState.returnToStory();
				else
				{
					FlxG.switchState(new Freeplay());
					FlxG.sound.playMusic(Paths.music('freakyMenu'));
				}
            }
        }
    }
}




function onCustomSubstateCreatePost(name)
{
    if (name == 'weener')
    {
        FlxG.sound.playMusic(Paths.music('paintDeath'),0);
        var sorry = new FlxSprite().loadGraphic(Paths.image('stages/paint/sorry'));
        sorry.setGraphicSize(FlxG.width,FlxG.height);
        sorry.updateHitbox();

        game.variables.set('sorry',sorry);
        CustomSubstate.insertToCustomSubstate('sorry',0);
        sorry.alpha = 0;

        var sorry2 = new FlxSprite().loadGraphic(Paths.image('stages/paint/sorry1'));
        sorry2.setGraphicSize(FlxG.width,FlxG.height);
        sorry2.updateHitbox();
        game.variables.set('sorry2',sorry2);
        CustomSubstate.insertToCustomSubstate('sorry2',1);
        sorry2.visible = false;

        FlxTimer.wait(2,()->
        {
            FlxG.sound.music.fadeIn(4);
            FlxTween.tween(sorry, {alpha: 1},4,{onComplete: Void->canEnter = true});
        });



    }
}
