import psychlua.LuaUtils;

import hxcodec.flixel.FlxVideo;

var globalData:Array<Array<Dynamic>> = [];

createGlobalCallback('makeVideoSprite', function(tag:String, videoFile:String, ?x:Float, ?y:Float, ?camera:String, ?shouldLoop:Bool, ?volume:Float)
{
	var videoData:Array<Dynamic> = [];
	
	if (game.modchartSprites.exists(tag + '_video'))
	{
		debugPrint(' ', FlxColor.RED);
		return;
	}
	
	if (!FileSystem.exists(Paths.video(videoFile)))
	{
		debugPrint('The video file "' + videoFile + '" cannot be found!', FlxColor.RED);
		return;
	}
	
	var sprite:FlxSprite = new FlxSprite(x, y).makeGraphic(1, 1, FlxColor.TRANSPARENT);
	sprite.camera = LuaUtils.cameraFromString(camera);
	game.modchartSprites.set(tag + '_video', sprite);
	LuaUtils.getTargetInstance().add(sprite);
	
	var video:FlxVideo = new FlxVideo();
	
	video.alpha = 0;
	//video.scale = 1;
	
	video.onTextureSetup.add(function()
	{
		sprite.loadGraphic(video.bitmapData);
	});
	
	video.play(Paths.video(videoFile), shouldLoop);

   video.volume = volume;
	
	video.onEndReached.add(function()
	{
		video.dispose();
		
		if (FlxG.game.contains(video))
			FlxG.game.removeChild(video);
		
		if (globalData.indexOf(videoData) >= 0)
			globalData.remove(videoData);
		
		if (game.modchartSprites.exists(tag + '_video'))
		{
			game.modchartSprites.get(tag + '_video').destroy();
			game.modchartSprites.remove(tag + '_video');
		}
			
		game.callOnLuas('onVideoFinished', [tag]);
		
		return;
	}, true);
	
	FlxG.game.addChild(video);
	
	videoData.push(video);
	videoData.push(sprite);
	
	globalData.push(videoData);
});

function onPause()
{
	for (video in globalData)
	{
		if (video[0] != null)
		{
			video[0].pause();
			
			if (FlxG.autoPause)
			{
				if (FlxG.signals.focusGained.has(video[0].resume))
					FlxG.signals.focusGained.remove(video[0].resume);

				if (FlxG.signals.focusLost.has(video[0].pause))
					FlxG.signals.focusLost.remove(video[0].pause);
			}
		}
	}
}

function onResume()
{
	for (video in globalData) 
	{
		if (video[0] != null)
			video[0].resume();
			
		if (FlxG.autoPause)
		{
			if (!FlxG.signals.focusGained.has(video[0].resume))
				FlxG.signals.focusGained.add(video[0].resume);

			if (!FlxG.signals.focusLost.has(video[0].pause))
				FlxG.signals.focusLost.add(video[0].pause);
		}
	}
}

function onDestroy()
{
	for (video in globalData)
	{
		video[0].stop();

		if (FlxG.game.contains(video[0]))
			FlxG.game.removeChild(video[0]);
	}
}

var cache:Array<String> = ['sing'];

function precacheVideos()
{
	for (i in 0 ... cache.length)
	{
		var video:FlxVideo = new FlxVideo();
		video.play(Paths.video(cache[i]));
		video.stop();
	}
}

precacheVideos();
