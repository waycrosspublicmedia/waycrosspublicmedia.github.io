import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import backend.ClientPrefs;
import flash.filters.ShaderFilter;
import yeah.YeahUtil;
import flixel.FlxCamera;
import flixel.FlxSprite;

var stickerGroup;
var darkerGroupColor = 0xFFF0F0F0;

function onCreate()
{
	game.skipCountdown = true;
}
function onCreatePost()
{
	var bg = new FlxSprite(-1500, -1000).loadGraphic(Paths.image('stages/12am/punkettBG2K'));
	addBehindDad(bg);
	bg.scale.set(2, 2);
	bg.updateHitbox();

	game.camHUD.alpha = 0;

	game.dad.visible = false;
	stickerGroup = new FlxSpriteGroup();
	game.insert(game.members.indexOf(game.dadGroup), stickerGroup);
	spawnSticker(-1);

	FlxG.camera._fxFadeAlpha = 1;
	FlxG.camera.zoom = 0.15;
}

function onSongStart()
{
	game.isCameraOnForcedPos = true;
	FlxG.camera.scroll.y -= 400;
	FlxTween.tween(FlxG.camera, {_fxFadeAlpha: 0},10, {ease: FlxEase.sineInOut});

	FlxTween.tween(FlxG.camera, {zoom: game.defaultCamZoom + 0.1},10, {ease: FlxEase.cubeInOut,onComplete: Void->{
		FlxTween.tween(FlxG.camera, {zoom: game.defaultCamZoom},10, {ease: FlxEase.cubeInOut});
	}});
	FlxTween.num(FlxG.camera.scroll.y,game.camFollow.y,10,{ease: FlxEase.cubeInOut},(f)->{
		game.camFollow.y = f;
		FlxG.camera.snapToTarget();
	});

}

function spawnSticker(dir:Int)
{
	// flxcolor abstract die
	for (i in stickerGroup.members)
	{
		// nvm not used
		// var stickerRGB = FlxColor.toRGB(i.color);
		// stickerRGB[0] *= 0.9;
		// stickerRGB[1] *= 0.9;
		// stickerRGB[2] *= 0.9;
		// var newColor = FlxColor.fromRGB(stickerRGB[0],stickerRGB[1],stickerRGB[2],game.dad.alpha * 255);
		i.color = darkerGroupColor;
	}

	var animToPlay = resolveDir(dir);

	var spr = new FlxSprite(game.dad.x, game.dad.y); // recycle later
	spr.frames = game.dad.frames;
	spr.animation.copyFrom(game.dad.animation);
	spr.animation.play(animToPlay);
	spr.offset.x = game.dad.offset.x;
	spr.offset.y = game.dad.offset.y;
	spr.angle = game.dad.angle;
	spr.antialiasing = game.dad.antialiasing;
	spr.camera = game.dad.camera;

	spr.angle += FlxG.random.int(-10, 10);

	spr.offset.x += FlxG.random.int(1, 5);
	spr.offset.y += FlxG.random.int(1, 5);

	spr.scale.set(spr.scale.x * 1.05, spr.scale.y * 1.05);
	FlxTween.tween(spr.scale, {x: game.dad.scale.x, y: game.dad.scale.y}, 0.1, {ease: FlxEase.bounceOut});

	stickerGroup.add(spr);

	spr.cameras = game.dad.cameras;

	if (stickerGroup.members.length > 10)
	{
		var bottomLayer = stickerGroup.members.shift();
		bottomLayer.destroy();
	}
}

function resolveDir(dir:Int)
{
	return switch (dir)
	{
		case -1: 'idle';
		case 0: 'singLEFT';
		case 1: 'singDOWN';
		case 2: 'singUP';
		case 3: 'singRIGHT';
	}
}

function opponentNoteHit(note)
{
	if (!note.isSustainNote)
		spawnSticker(note.noteData);
}

function onBeatHit()
{
	if (dad != null
		&& curBeat % dad.danceEveryNumBeats == 0
		&& !StringTools.startsWith(dad.getAnimationName(), 'sing')
		&& !dad.stunned)
	{
		if (getTopSticker().animation.curAnim.name != 'idle')
			spawnSticker(-1);
	}
}

function getTopSticker()
{
	return stickerGroup.members[stickerGroup.members.length - 1];
}
