import flixel.tweens.FlxEase;
import flixel.FlxSprite;

var prevAnimName:String;
var bg:FlxSprite;
var fg:FlxSprite;
var dadIdx = 0;

var gravePositions:Array<Array<Float>> = [
	[565, 181],
	[565, 181],
	[522, 177],
	[521, 177],
	[480, 177],
	[450, 176],
	[403, 181],
	[361, 184],
	[306, 189],
	[254, 195],
	[188, 208],
	[134, 216],
	[78, 226],
    [78, 226]
];

var dataPositions:Array<Array<Float>> = [
	// from left to right
	[1195, 270],
	[1191, 270],
	[1160, 267],
	[1088, 252],
	[1020, 237],
	[965, 227],
	[910, 217],
	[855, 212],
	[807, 208],
	[765, 205],
	[724, 204],
	[683, 202],
	[645, 203],
    [617,203]
];

var dadScale:Float;
var playerScale:Float;
var ui64;

// todo probaly make the chars skewed sprites
// finish ui
// manually position chars so it looks better

function onCreate()
{
	game.defaultCamRotation = 0;

	// real zoom is 1.2
	game.defaultCamZoom = 1.2;

	game.showCombo = false;
	game.showComboNum = false;
	game.showRating = false;

	var initialAnim = 'left';

	bg = new FlxSprite();
	bg.frames = Paths.getSparrowAtlas('stages/64/bg');
	bg.animation.addByIndices('left', 'bg', [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], '', 10, false);
	bg.animation.addByIndices('right', 'bg', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], '', 10, false);
	bg.animation.addByIndices('middle', 'bg', [7], '', 10, false);
	bg.animation.play(initialAnim);
	addBehindDad(bg);
	bg.screenCenter();
	bg.scrollFactor.set();

	fg = new FlxSprite();
	fg.frames = Paths.getSparrowAtlas('stages/64/snow');
	fg.animation.addByIndices('left', 'bg', [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], '', 10, false);
	fg.animation.addByIndices('right', 'bg', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], '', 10, false);
	fg.animation.addByIndices('middle', 'bg', [7], '', 10, false);
	fg.animation.play(initialAnim);
	add(fg);
	fg.screenCenter();
	fg.scrollFactor.set();
}

function onCreatePost()
{
	// setup char
	for (i in dadGroup)
		i.scrollFactor.set();

	for (i in boyfriendGroup)
		i.scrollFactor.set();

	dadGroup.x = gravePositions[7][0];
	dadGroup.y = gravePositions[7][1];

	boyfriendGroup.x = dataPositions[7][0];
	boyfriendGroup.y = dataPositions[7][1];

	dadScale = dad.scale.x;

	playerScale = boyfriend.scale.x;

	// game.boyfriend.visible = false;



	bg.animation.callback = (name,num,idx)->{
		var pos = num;

		if (name == 'left') 
		{
			pos = bg.animation.curAnim.numFrames - pos;
		}

		if (gravePositions[pos] != null) //needs fix still
		{
			dad.x = bg.x + (gravePositions[pos][0] * bg.scale.x);
			dad.y = bg.y + (gravePositions[pos][1] * bg.scale.x) + 25;
		}
	
		if (dataPositions[pos] != null)
		{ 
			boyfriend.x = bg.x + (dataPositions[pos][0] * bg.scale.x);
			boyfriend.y = bg.y + (dataPositions[pos][1] * bg.scale.x);
		}

	}

	initUI();
}

// wip just writing this really fast
function initUI()
{
	game.healthBarGroup.visible = false;
	ui64 = new FlxSpriteGroup();
	insert(0, ui64);
	ui64.cameras = [camHUD];

	// got annoying
	function updateScale(o, s)
	{
		o.scale.set(s, s);
		o.updateHitbox();
	}

	var b = new FlxSprite().loadGraphic(Paths.image('stages/64/ui/back'));
	ui64.add(b);
	b.setGraphicSize(FlxG.width);
	b.updateHitbox();

	// consistent scaling
	var uiScale = b.scale.x;

	var hptxt = new FlxSprite(9 * uiScale, 4 * uiScale).loadGraphic(Paths.image('stages/64/ui/hp'));
	updateScale(hptxt, uiScale);
	ui64.add(hptxt);

	var heart = new FlxSprite(26 * uiScale, 6 * uiScale).loadGraphic(Paths.image('stages/64/ui/heart'));
	updateScale(heart, uiScale);
	ui64.add(heart);

	var acctxt = new FlxSprite(59 * uiScale, 4 * uiScale).loadGraphic(Paths.image('stages/64/ui/fp'));
	updateScale(acctxt, uiScale);
	ui64.add(acctxt);

	var flower = new FlxSprite(76 * uiScale, 4 * uiScale).loadGraphic(Paths.image('stages/64/ui/flower'));
	updateScale(flower, uiScale);
	ui64.add(flower);

	var star = new FlxSprite(193 * uiScale, 5 * uiScale);
	star.frames = Paths.getSparrowAtlas('stages/64/ui/star');
	star.animation.addByPrefix('i', 'star', 10);
	star.animation.play('i');
	updateScale(star, uiScale);
	ui64.add(star);

	var x = new FlxSprite(207 * uiScale, 8 * uiScale).loadGraphic(Paths.image('stages/64/ui/x'));
	updateScale(x, uiScale);
	ui64.add(x);

	var coin = new FlxSprite(243 * uiScale, 5 * uiScale);
	coin.frames = Paths.getSparrowAtlas('stages/64/ui/coin');
	coin.animation.addByPrefix('i', 'coin', 10);
	coin.animation.play('i');
	updateScale(coin, uiScale);
	ui64.add(coin);

	var x = new FlxSprite(257 * uiScale, 8 * uiScale).loadGraphic(Paths.image('stages/64/ui/x'));
	updateScale(x, uiScale);
	ui64.add(x);
}

function onUpdatePost(elapsed)
{
    fg.animation.curAnim.curFrame = bg.animation.curAnim.curFrame;
}

function onSectionHit()
{
	var anim = (mustHitSection ? 'right' : 'left');

	if (anim != prevAnimName)
	{
		bg.animation.play(anim);
		fg.animation.play(anim);
	}

	prevAnimName = anim;
}

var oppTween;

function opponentNoteHit(n)
{
	if (n.noteData == 1 || n.noteData == 2)
		return;

	// //we'll handle these different later
	// if (n.isSustainNote) return;

	// if (oppTween != null) oppTween.cancel();

	// oppTween = FlxTween.tween(dad.scale,{x: -0.2},0.2, {ease: FlxEase.cubeOut, onComplete: (f)->{
	//     oppTween = FlxTween.tween(dad.scale, {x: dadScale},0.2, {ease: FlxEase.circOut});
	// }});
}
