package export.debug.windows.bin.mods.stages;

import flixel.util.FlxTimer;
import flixel.addons.display.FlxRuntimeShader;
import openfl.filters.ShaderFilter;
import backend.RuntimeRainShader;
import flixel.addons.effects.FlxSkewedSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import objects.VideoSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import backend.Paths;
import backend.ClientPrefs;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

var spaceSprites;
var weatherSprites;
var newsSprites;
var gameShowSprites;
var video;
var fieldSprites;
var fieldSpritesFront;
var p = "/stages/jads/";
var remote:FlxSprite;
var rain:FlxRuntimeShader;
var rainFilter;
var staticTransition:FlxSprite;

function onCreate()
{
	// space
	spaceSprites = new FlxTypedGroup<FlxSprite>();
	addBehindGF(spaceSprites);
	var space = new FlxSprite(-860, -500).loadGraphic(Paths.image(p + "yeahspace"));
	space.antialiasing = ClientPrefs.data.antialiasing;
	space.scale.set(0.6, 0.6);
	space.scrollFactor.set(0.2, 0.2);
	space.updateHitbox();
	spaceSprites.add(space);

	var ground = new FlxSprite(-150, 430).loadGraphic(Paths.image(p + "yeahground"));
	ground.antialiasing = ClientPrefs.data.antialiasing;
	ground.scale.set(0.7, 0.7);
	ground.scrollFactor.set(0.9, 0.9);
	ground.updateHitbox();
	spaceSprites.add(ground);

	game.skipCountdown = true;

	// weather
	weatherSprites = new FlxTypedGroup<FlxSprite>();
	addBehindGF(weatherSprites);
	weatherSprites.visible = false;

	var weatherBG = new FlxSprite().loadGraphic(Paths.image(p + "weather"));
	weatherBG.scale.set(1.6, 1.6);
	weatherBG.setPosition(500, -100);
	weatherBG.antialiasing = ClientPrefs.data.antialiasing;
	weatherSprites.add(weatherBG);

	if (ClientPrefs.data.shaders)
	{
		rain = game.createRuntimeShader("rain");

		rain.setFloatArray('uScreenResolution', [FlxG.width, FlxG.height]);
		rain.setFloat('uTime', 0);
		rain.setFloat('uScale', FlxG.height / 300);
		rain.setFloat('uIntensity', 0.5);
		rain.setFloatArray("uRainColor", [102 / 255, 128 / 255, 204 / 255]);
		rainFilter = new ShaderFilter(rain);
	}
	// news
	newsSprites = new FlxTypedGroup<FlxSprite>();
	addBehindGF(newsSprites);
	newsSprites.visible = false;

	var newsBG = new FlxSprite().loadGraphic(Paths.image(p + "Symbol_15"));
	newsBG.antialiasing = ClientPrefs.data.antialiasing;
	newsBG.scale.set(2.1, 2.1);
	newsBG.updateHitbox();
	newsBG.setPosition(-100, -400);
	newsSprites.add(newsBG);

	var newsGuy = new FlxSprite();
	newsGuy.frames = Paths.getSparrowAtlas(p + "norbert");
	newsGuy.scale.set(1.9, 1.9);
	newsGuy.updateHitbox();
	newsGuy.setPosition(1600, -150);
	newsGuy.animation.addByPrefix("fuck", "Symbol 10 instance 1", 12, true);
	newsGuy.antialiasing = ClientPrefs.data.antialiasing;
	newsGuy.animation.play("fuck");
	newsSprites.add(newsGuy);

	var newsText = new FlxSprite().loadGraphic(Paths.image(p + "Symbol_14"));
	newsText.scale.set(1.8, 1.8);
	newsText.updateHitbox();
	newsText.setPosition(400, 500);

	newsSprites.add(newsText);

	// gameshow

	gameShowSprites = new FlxTypedGroup<FlxSprite>();
	addBehindGF(gameShowSprites);
	gameShowSprites.visible = false;

	var gameBG = new FlxSprite().loadGraphic(Paths.image(p + "RECOVER_testyeah"));
	gameBG.antialiasing = ClientPrefs.data.antialiasing;
	gameBG.scale.set(1.6, 1.6);
	gameBG.setPosition(0, -350);
	gameBG.updateHitbox();
	gameShowSprites.add(gameBG);

	for (i in 0...3)
	{
		var gameDesks = new FlxSprite().loadGraphic(Paths.image(p + "RECOVE2R_testyeah"));
		gameDesks.antialiasing = ClientPrefs.data.antialiasing;
		gameDesks.setGraphicSize(gameDesks.width * 1.4);
		gameDesks.setPosition(100 + 1000 * i, 430);
		gameDesks.scrollFactor.set(0.9, 0.9);
		gameDesks.updateHitbox();

		var boringbgpeople = new FlxSprite();
		boringbgpeople.frames = Paths.getSparrowAtlas(p + "bitch");
		boringbgpeople.setGraphicSize(boringbgpeople.width * 1.7);
		boringbgpeople.updateHitbox();
		boringbgpeople.scrollFactor.set(0.9, 0.9);
		boringbgpeople.animation.addByPrefix("0", "Symbol 8 instance 1", 12, true);
		boringbgpeople.animation.addByPrefix("1", "Symbol 8 2 instance 1", 12, true);
		boringbgpeople.animation.addByPrefix("2", "Symbol 8 3 instance 1", 12, true);
		boringbgpeople.antialiasing = ClientPrefs.data.antialiasing;
		boringbgpeople.animation.play("" + i);
		boringbgpeople.setPosition(gameDesks.x + 120, gameDesks.y - 290);

		// id be pissed about this in hardcode but who cares in script
		switch (i)
		{
			case 0:
				boringbgpeople.setPosition(gameDesks.x + 110, gameDesks.y - 340);
			case 1:
				boringbgpeople.setPosition(gameDesks.x + 120, gameDesks.y - 290);
			case 2:
				boringbgpeople.setPosition(gameDesks.x + 80, gameDesks.y - 290);
		}

		gameShowSprites.add(boringbgpeople);
		gameShowSprites.add(gameDesks);
	}

	// field

	fieldSprites = new FlxTypedGroup<FlxSprite>();
	fieldSprites.visible = false;
	addBehindGF(fieldSprites);

	fieldSpritesFront = new FlxTypedGroup<FlxSprite>();
	fieldSpritesFront.visible = false;
	add(fieldSpritesFront);

	var bg = new FlxSprite().loadGraphic(Paths.image(p + "IMG_0136"));
	bg.antialiasing = ClientPrefs.data.antialiasing;
	bg.scrollFactor.set(0, 0);
	bg.setGraphicSize(bg.width * 1.36);
	bg.updateHitbox();
	bg.screenCenter();
	fieldSprites.add(bg);

	var clouds = new FlxSprite().loadGraphic(Paths.image(p + "IMG_0137"));
	clouds.antialiasing = ClientPrefs.data.antialiasing;
	clouds.scrollFactor.set(0.05, 0.05);
	clouds.setGraphicSize(clouds.width * 1.5);
	clouds.updateHitbox();
	clouds.screenCenter();
	clouds.y -= 200;
	fieldSprites.add(clouds);

	var ground = new FlxSprite(-50, 450).loadGraphic(Paths.image(p + "IMG_0138"));
	ground.setGraphicSize(ground.width * 1.5);
	ground.updateHitbox();
	ground.antialiasing = ClientPrefs.data.antialiasing;
	fieldSprites.add(ground);

	var flowers = new FlxSprite(0, 650).loadGraphic(Paths.image(p + "IMG_0139"));
	flowers.antialiasing = ClientPrefs.data.antialiasing;
	flowers.setGraphicSize(flowers.width * 1.7);
	flowers.scrollFactor.set(1.1, 1.1);
	flowers.updateHitbox();
	fieldSpritesFront.add(flowers);

	fieldSprites.add(ground);
	var grass = new FlxSkewedSprite(400, 800).loadGraphic(Paths.image(p + "IMG_0140"));
	grass.antialiasing = ClientPrefs.data.antialiasing;
	grass.scrollFactor.set(1.2, 1.2);
	grass.setGraphicSize(grass.width * 1.3);
	grass.updateHitbox();
	grass.skew.x = -5;
	grass.origin.y = grass.height;
	FlxTween.tween(grass.skew, {x: 5}, 5, {ease: FlxEase.smoothStepInOut, type: 4});
	fieldSpritesFront.add(grass);

	video = new VideoSprite();
	video.load("testyeah_Scene_1_2.mp4", [VideoSprite.muted]);
	video.addCallback('onFormat', () -> {
		video.scale.set(1.4, 1.4);
		video.updateHitbox();
		video.screenCenter();
		video.scrollFactor.set();
		// video.setPosition(150,-330);
		video.cameras = [game.camGame];
		game.videos.add(video);
	});

	video.visible = false;
	video.cameras = [game.camGame];
	addBehindGF(video);

	remote = new FlxSprite();
	remote.frames = Paths.getSparrowAtlas(p + "remote");
	remote.animation.addByPrefix("click", "Symbol 18 instance 1", 24, false);
	remote.cameras = [game.camHUD];
	add(remote);
	remote.screenCenter(0x01);
	remote.y = FlxG.height;

	staticTransition = new FlxSprite();
	staticTransition.frames = Paths.getSparrowAtlas('stages/jads/stat');
	staticTransition.animation.addByPrefix('i', 'i', 12);
	staticTransition.animation.play('i');
	staticTransition.setGraphicSize(FlxG.width);
	staticTransition.updateHitbox();
	addBehindDad(staticTransition);
	staticTransition.cameras = [game.camHUD];
	staticTransition.alpha = 0;
}

function onCreatePost()
{
	gf.visible = false;
	game.comboGroup.visible = false;
}

function onSongStart()
{
	game.isCameraOnForcedPos = true;
	game.dad.alpha = 0;
	game.boyfriend.alpha = 0;
	game.camFollow.y += -100;
	game.camFollow.x += 150;
	FlxG.camera.snapToTarget();
	FlxG.camera._fxFadeAlpha = 1;
	FlxG.camera.zoom = game.defaultCamZoom + 1;
	FlxTween.tween(FlxG.camera, {_fxFadeAlpha: 0}, 3, {ease: FlxEase.sineOut, startDelay: 1});

	FlxTween.tween(FlxG.camera, {zoom: game.defaultCamZoom + .1}, 19, {ease: FlxEase.sineInOut, startDelay: 2});

	FlxTween.tween(FlxG.camera.scroll, {y: game.camFollow.y + 100 - (FlxG.height / 2)}, 15,
		{
			ease: FlxEase.sineInOut,
			startDelay: 2,
			onComplete: Void -> {
				game.camFollow.y = FlxG.camera.scroll.y + (FlxG.height / 2);
			}
		});

	FlxTimer.wait(12, () -> {
		for (i in [game.dad, game.boyfriend])
		{
			FlxTween.tween(i, {alpha: 1}, 2);
		}
	});
}

function opponentNoteHit(m)
{
	game.isCameraOnForcedPos = false;
}

var rainTimeScale:Float = 1.0;
var dick:Float = 0;

function onUpdatePost(elapsed:Float)
{
	dick += elapsed * rainTimeScale;

	if (ClientPrefs.data.shaders)
	{
		rain.setFloatArray('uCameraBounds', [
			game.camGame.scroll.x + game.camGame.viewMarginX,
			game.camGame.scroll.y + game.camGame.viewMarginY,
			game.camGame.scroll.x + game.camGame.viewMarginX + game.camGame.width,
			game.camGame.scroll.y + game.camGame.viewMarginY + game.camGame.height
		]);
		rain.setFloat('uTime', dick);
		rain.setFloat('uIntensity', 0.3);
	}

	// rain.updateViewInfo(FlxG.width, FlxG.height, game.camGame);
	// rain.update(elapsed * rainTimeScale);
}

function onBeatHit() {}

function toggleRemote(v:Bool)
{
	if (v)
	{
		remote.y = FlxG.height;
		FlxTween.tween(remote, {y: FlxG.height - remote.height + 50}, 0.6, {ease: FlxEase.cubeOut});
	}
	else
	{
		remote.y = FlxG.height - remote.height + 50;
		FlxTween.tween(remote, {y: FlxG.height}, 0.6, {ease: FlxEase.cubeOut});
	}
}

var statTimer = null;

function doStaticFlip()
{
	if (statTimer != null) statTimer.cancel();

	staticTransition.alpha = 1;
	statTimer = FlxTimer.wait(0.3, () -> staticTransition.alpha = 0);
}

function onStepHit()
{
	switch (curStep)
	{
		case 258, 290, 322, 386, 448, 514:
			doStaticFlip();
		case 260:
			game.camGame.filters = [rainFilter];
			boyfriend.alpha = 0.7;
			dad.alpha = 0.7;
			spaceSprites.visible = false;
			weatherSprites.visible = true;

		case 292:
			game.camGame.filters = [];
			weatherSprites.visible = false;
			newsSprites.visible = true;

		case 324:
			newsSprites.visible = false;
			gameShowSprites.visible = true;

		case 388:
			gameShowSprites.visible = false;
			fieldSprites.visible = true;
			fieldSpritesFront.visible = true;
		case 450:
			fieldSprites.visible = false;
			fieldSpritesFront.visible = false;

			video.visible = true;
			video.play();

		case 516:
			spaceSprites.visible = true;
			boyfriend.alpha = 1;
			dad.alpha = 1;
	}
}

function onEvent(name, a, b)
{
	if (name == "")
	{
		switch (a)
		{
			case "Remote":
				toggleRemote(b == "1" ? true : false);

			case "Remote Press":
				remote.animation.play("click", true);

			case "Manual Beat Bop":
				var val = Std.parseFloat(b);
				if (Math.isNaN(val)) val = 0.010;

				// FlxG.camera.zoom += val;
				game.iconP1.scale.set(1, 1);
				game.iconP2.scale.set(1, 1);

				game.iconP1.updateHitbox();
				game.iconP2.updateHitbox();
		}
	}
}
