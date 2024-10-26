// FunkinLua.luaTrace("This is a test error", true, false, FlxColor.RED);
// FunkinLua.luaTrace("This is a test message", true, false, FlxColor.WHITE);
// FunkinLua.luaTrace("Something went good!", true, false, FlxColor.GREEN);
// FunkinLua.luaTrace("Something didn't work, but also didn't cause an error", true, false, FlxColor.YELLOW);
// FunkinLua.luaTrace("Debug info", true, false, FlxColor.CYAN);
// FunkinLua.luaTrace("You did something!", true, false, FlxColor.ORANGE);

import psychlua.FunkinLua;
import psychlua.LuaUtils;
import psychlua.HScript;

import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;

import flixel.math.FlxRandom;

import openfl.display.BlendMode;

var beat = 0;

var time = 0;
var frame = 0;

var defaultOpponentX = game.DAD_X;
var defaultOpponentY = game.DAD_Y;

var letterbox:FlxSprite;

var letterboxTop:FlxSprite = new FlxSprite();
var letterboxBottom:FlxSprite = new FlxSprite();

var camMid:FlxCamera = new FlxCamera();
camMid.bgColor = 0x00;

var blackout:FlxSprite = new FlxSprite();
var grain:FlxSprite = new FlxSprite();

var placeholder:FlxSprite = new FlxSprite();

var abberationShader:FlxRuntimeShader;

var captions:FlxText = new FlxText(640, 360, 0, "Hey...", 32);

var correctZoom;
var correctHUDZoom = 1;

function onCreate() {

    correctZoom = defaultCamZoom;

    abberationShader = game.createRuntimeShader('abberation');

    game.dad.visible = false;
    game.gf.visible = false;
    // game.scoreTxt.setFormat(Paths.font("basiic.ttf"), 20, FlxColor.WHITE, game.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
    game.scoreTxt.setFormat(Paths.font("basiic.ttf"), 20, FlxColor.BLACK, game.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
    game.botplayTxt.text = "Vibe Mode :3";
    game.botplayTxt.x -= 4;
    game.botplayTxt.setFormat(Paths.font("basiic.ttf"), 32, FlxColor.BLACK, game.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
    game.timeTxt.setFormat(Paths.font("basiic.ttf"), 32, FlxColor.WHITE, game.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    // game.scoreTxt.blend = game.DIFFERENCE;
    letterbox = new FlxSprite();
    letterbox.loadGraphic(Paths.image('letterbox-basic'));
    letterbox.cameras = [camMid];
    letterbox.screenCenter();
    letterbox.scale.y = 1.5;

    letterboxTop.makeGraphic(1280, 720, FlxColor.BLACK);
    letterboxTop.cameras = [camMid];
    letterboxTop.screenCenter();
    letterboxTop.y -= 720;

    letterboxBottom.makeGraphic(1280, 720, FlxColor.BLACK);
    letterboxBottom.cameras = [camMid];
    letterboxBottom.screenCenter();
    letterboxBottom.y += 720;

    blackout.makeGraphic(1280, 720, FlxColor.BLACK);
    blackout.cameras = [game.camOther];
    blackout.screenCenter();

    grain.loadGraphic(Paths.image('grain'));
    grain.cameras = [camMid];
    grain.screenCenter();

    placeholder.loadGraphic(Paths.image('placeholder'));
    placeholder.scale.x /= 2;
    placeholder.scale.y /= 2;

    captions.setFormat(Paths.font("basiic.ttf"), 32, FlxColor.WHITE, game.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    captions.cameras = [camMid];
    captions.screenCenter();
    captions.y += 192;
    captions.visible = false;

    game.add(placeholder);
    game.add(letterbox);
    game.add(captions);
    game.add(grain);
    grain.blend = 14;
    grain.alpha = 0.99;
    game.add(letterboxTop);
    game.add(letterboxBottom);
    game.add(blackout);

    FlxG.cameras.remove(game.camHUD, false);
    FlxG.cameras.remove(game.camOther, false);
    FlxG.cameras.add(camMid, false);
    FlxG.cameras.add(game.camHUD, false);
    FlxG.cameras.add(game.camOther, false);
}

function onCreatePost() {
    game.camHUD.alpha = 0;
    FlxG.game.setFilters([new ShaderFilter(abberationShader)]);
}

function onBeatHit(){
    beat = curBeat;

    switch curBeat {

        case 30:
            FlxTween.tween(grain, { alpha: 0.15 }, 60/170, { ease: FlxEase.sineOut });

        case 32:
            game.defaultCamZoom = 0.7;
            FlxTween.tween(letterbox.scale, { y: 1.5 }, 0.5, { ease: FlxEase.sineOut });
        
        case 64:
            FlxTween.tween(letterbox.scale, { y: 1.2 }, 1.5, { ease: FlxEase.sineOut });

        case 80:
            FlxTween.tween(letterbox.scale, { y: 1 }, (92-80)*(60/170), { ease: FlxEase.sineInOut });

        case 92:
            FlxTween.tween(letterbox.scale, { y: 1.5 }, 60/170, { ease: FlxEase.sineOut });
            
        case 96:
            FlxTween.tween(letterbox.scale, { y: 1.33 }, (60/170)*2, { ease: FlxEase.sineOut });
            
        case 130:
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*2, { ease: FlxEase.sineOut });
            
        case 132:
            FlxTween.tween(letterbox.scale, { y: 1.33 }, (60/170)*2, { ease: FlxEase.expoOut });
            
        case 158:
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*1, { ease: FlxEase.expoOut });

        case 160:
            FlxTween.tween(letterbox.scale, { y: 1 }, 16*(60/170), { ease: FlxEase.sineOut });

        case 191:
            FlxTween.tween(letterbox.scale, { y: 1.33 }, 60/170, { ease: FlxEase.sineOut });
            
        case 197:
            game.defaultCamZoom = 0.6;
            FlxTween.tween(letterbox.scale, { y: 1.5 }, 60/170, { ease: FlxEase.sineOut });
            
        case 200:
            game.defaultCamZoom = 0.7;
            FlxTween.tween(letterbox.scale, { y: 1.33 }, 60/170, { ease: FlxEase.sineOut });

        case 220:
            FlxTween.tween(letterbox.scale, { y: 1 }, 60/170, { ease: FlxEase.sineOut });
        
        case 224:
            FlxTween.tween(letterbox.scale, { y: 1.33 }, 60/170, { ease: FlxEase.sineOut });
        
        case 229:
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*2, { ease: FlxEase.sineOut });
        
        case 232:
            FlxTween.tween(letterbox.scale, { y: 1.33 }, (60/170)*2, { ease: FlxEase.sineOut });
        
        case 256:
            FlxTween.tween(letterbox.scale, { y: 1 }, (60/170)*8, { ease: FlxEase.sineOut });
            
        case 284:
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*2, { ease: FlxEase.expoOut });
            
        case 288:
            FlxTween.tween(letterbox.scale, { y: 1 }, (60/170)*28, { ease: FlxEase.sineOut });
            
        case 316:
            game.defaultCamZoom = 0.6;
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*2, { ease: FlxEase.sineOut });
            
        case 320:
            game.defaultCamZoom = 0.7;
            FlxTween.tween(letterbox.scale, { y: 1.1 }, (60/170)*32, { ease: FlxEase.sineOut });
            
        case 380:
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*2, { ease: FlxEase.expoOut });
            
        case 382:
            FlxTween.tween(letterbox.scale, { y: 1 }, (60/170)*2, { ease: FlxEase.expoIn });

        case 448:
            game.defaultCamZoom = 0.6;
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*4, { ease: FlxEase.expoOut });
        
        case 480:
            FlxTween.tween(game, { defaultCamZoom: 0.7 }, (60/170)*32, { ease: FlxEase.sineInOut });
            
        case 512:
            FlxTween.tween(letterbox.scale, { y: 1.3 }, (60/170)*2, { ease: FlxEase.expoOut });
            
        case 569:
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*2, { ease: FlxEase.expoOut });
            
        case 576:
            game.defaultCamZoom = 0.8;
            FlxTween.tween(letterbox.scale, { y: 1 }, (60/170)*4, { ease: FlxEase.expoOut });
            
        case 604:
            game.defaultCamZoom = 0.6;
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*2, { ease: FlxEase.expoOut });
            
        case 608:
            game.defaultCamZoom = 0.8;
            FlxTween.tween(letterbox.scale, { y: 1 }, (60/170)*4, { ease: FlxEase.expoOut });
            
        case 632:
            game.defaultCamZoom = 0.6;
            FlxTween.tween(letterbox.scale, { y: 1.5 }, (60/170)*2, { ease: FlxEase.expoOut });
            
        case 640:
            game.defaultCamZoom = 0.7;
            FlxTween.tween(letterbox.scale, { y: 1.3 }, (60/170)*2, { ease: FlxEase.expoOut });
            
        case 672:
            game.defaultCamZoom = 0.6;
    }
}

function onStepHit() {
    switch curStep {

        case 2:
            captions.visible = true;
            
        case 15:
            captions.text = "I'm sorry for what I did.";
            captions.screenCenter();
            captions.y += 192;
            
        case 40:
            captions.text = "For what I said...";
            captions.screenCenter();
            captions.y += 192;
            
        case 57:
            captions.text = "So I-";
            captions.screenCenter();
            captions.y += 192;
            
        case 69:
            captions.text = "I feel kinda dumb...";
            captions.screenCenter();
            captions.y += 192;
            
        case 85:
            captions.text = "But uuh";
            captions.screenCenter();
            captions.y += 192;
            
        case 112:
            captions.text = "I miss you </3";
            captions.screenCenter();
            captions.y += 192;
            
        case 128:
            FlxTween.tween(captions, { alpha: 0 }, (60/170)*8, { ease: FlxEase.linear });

        case 2814:
            FlxTween.tween(letterboxTop, { y: letterboxTop.y+(720/2) }, (60/170), { ease: FlxEase.expoOut });
            FlxTween.tween(letterboxBottom, { y: letterboxBottom.y-(720/2) }, (60/170), { ease: FlxEase.expoOut });
    }
}

function onUpdate(delta) {
    time += delta;
    frame += 1;
    game.dad.y = defaultOpponentY + Math.sin(time*3.14)*32;
    if (frame % 5 == 0) {
        grain.angle = FlxG.random.float(-180.0, 180.0);
        grain.screenCenter();
        grain.x += FlxG.random.float(-160.0, 160.0);
        grain.y += FlxG.random.float(-160.0, 160.0);
    }
    correctZoom = FlxMath.lerp(defaultCamZoom, FlxG.camera.zoom, Math.exp(-delta * 3.125 * camZoomingDecay * playbackRate));
    correctHUDZoom = FlxMath.lerp(1, game.camHUD.zoom, Math.exp(-delta * 3.125 * camZoomingDecay * playbackRate));
}

function onUpdatePost(delta) {
    if ((beat >= 30) && (beat < 701.5)) {
        game.camHUD.alpha = FlxMath.lerp(game.camHUD.alpha, 1, (delta * 3.125 * game.playbackRate));
    }
    else {
        game.camHUD.alpha = FlxMath.lerp(game.camHUD.alpha, 0, (delta * 3.125 * game.playbackRate));
    }
    if (!(beat >= 32)) {
        game.camFollow.x = 1280+160+80;
        game.camFollow.y = 500;
    }

    placeholder.x = game.dad.x-420;
    placeholder.y = game.dad.y-500;
    FlxG.camera.zoom = correctZoom;
    game.camHUD.zoom = correctHUDZoom;
}

function onDestroy() {
    FlxG.game.setFilters([]);
}

function onSongStart() {
    game.remove(blackout);
    FlxTween.tween(letterbox.scale, { y: 1.1 }, 2.5, { ease: FlxEase.sineOut });
    game.camGame.flash(FlxColor.BLACK, 4*(60/170));
}

function onStartCountdown() {
}

function onEvent(t, v1, v2, st) {
    if (t == "BAHP") {
        correctZoom += 0.02;
        correctHUDZoom += 0.03;
    }
}