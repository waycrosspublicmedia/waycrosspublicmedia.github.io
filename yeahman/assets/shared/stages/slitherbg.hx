package example_mods.stages;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import openfl.filters.ShaderFilter;
import flixel.tweens.FlxTween;
import backend.Paths;
import backend.ClientPrefs;
import flixel.FlxSprite;


var curTarget = "dad";


var shader;

var lowBar:FlxSprite;
var topBar:FlxSprite;



function onCreate()
{

    lowBar = new FlxSprite().makeGraphic(1,1,FlxColor.BLACK);
    lowBar.setGraphicSize(2000,400);
    lowBar.updateHitbox();
    lowBar.setPosition(0,0);
    lowBar.scrollFactor.set();
    lowBar.cameras = [game.camHUD];
   add(lowBar);

    topBar = new FlxSprite().makeGraphic(1,1,FlxColor.BLACK);
    topBar.setGraphicSize(2000,400);
    topBar.updateHitbox();
    topBar.setPosition(0,FlxG.height - topBar.height);
    topBar.cameras = [game.camHUD];
    topBar.scrollFactor.set();
    add(topBar);


}
function onCreatePost()
{
	var bg = new FlxSprite().loadGraphic(Paths.image("stages/slitherman/slithermanbg"));
	bg.antialiasing = ClientPrefs.data.antialiasing;
    bg.setGraphicSize(Std.int(bg.width * 1.2));
    bg.updateHitbox();
	addBehindGF(bg);
	healthBarGroup.visible = false;

    bg.scrollFactor.set(0.8,0.8);



    game.dad.scrollFactor.set(0.85,0.85);


   


    if (ClientPrefs.data.shaders)
    {
        shader = game.createRuntimeShader("vhs");

        trace(shader);

        game.camGame.filters = [new ShaderFilter(shader)];
    }

    game.strumLineNotes.forEach(function(spr)
        {

            spr.visible = false;

        });

}





var dick:Float = 0;

function onUpdatePost(elapsed:Float)
{



    dick += elapsed;
    if (ClientPrefs.data.shaders)
        {
          
           shader.setFloat("uTime",dick);
        }

}



function onStepHit()
{




    switch (curStep)
    {
        case 1:
    
            FlxTween.tween(lowBar,{y:lowBar.y  - 300},2,{ease:FlxEase.smootherStepOut});
            FlxTween.tween(topBar,{y:topBar.y  + 300},2,{ease:FlxEase.smootherStepOut});

        case 66:
            FlxTween.tween(lowBar,{y:lowBar.y - 300},1.5,{ease:FlxEase.smootherStepIn});
            FlxTween.tween(topBar,{y:topBar.y + 300},1.5,{ease:FlxEase.smootherStepIn});

            game.strumLineNotes.forEach(function(spr)
                {
        
                    spr.visible = true;

                    spr.alpha = 0;


                    FlxTween.tween(spr,{alpha:1},1.2,{ease:FlxEase.quadOut});
        
                });
        




    }



}

function onMoveCamera(fuck)
{
	

    if (curTarget == fuck) return;

    curTarget = fuck;
	switch (fuck)
	{
		case "dad":
			FlxTween.tween(game, {defaultCamZoom: 0.52}, 0.7, {ease: FlxEase.quadOut});
		case "boyfriend":
			FlxTween.tween(game, {defaultCamZoom: 0.44}, 0.7, {ease: FlxEase.quadOut});
	}
}
