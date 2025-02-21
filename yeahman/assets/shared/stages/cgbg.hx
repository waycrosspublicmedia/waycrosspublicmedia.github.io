package example_mods.stages;

import backend.ClientPrefs;
import flixel.util.FlxTimer;

var video;
var videoFinished:Bool = false;



function onCreate()
{

	game.skipCountdown = true;


}
function onCreatePost()
{
	video = new VideoSprite();
	video.addCallback('onFormat', () -> {
		video.scale.set(1.5, 1.5);
		video.updateHitbox();
		video.screenCenter();
		video.cameras = [game.camOther];
	});
	video.load('salesday.mp4');
	add(video);
	game.videos.add(video);

	video.play();
	video.antialiasing = ClientPrefs.data.antialiasing;
	video.addCallback("onEnd", function()
		{
			startSong();
			//tweaking for some reason (for chroma) so maybe moving it to a function inside the script helps
			// new FlxTimer().start(1, function(_)
			// {
			// 	videoFinished = true;
			// 	game.startCountdown();
			// });
		}, true);

	

}


function onStartCountdown()
	{
		return videoFinished ? Function_Continue : Function_Stop;
	}



function startSong()
	{
		new FlxTimer().start(1, function(_)
			{
				videoFinished = true;
				game.startCountdown();
	
				for (i in game.opponentStrums)
				{
					i.x = -1000;
					i.visible = false;
					i.alpha = 0;
				}
			});
	
	}