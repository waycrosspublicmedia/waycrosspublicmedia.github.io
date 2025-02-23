
function onCreate()
	
	setProperty("skipCountdown", true);

	makeLuaSprite('void')
	makeGraphic("void",1,1)
	setScrollFactor('void', 1, 1);
	scaleObject('void', 5000, 5000);
	
	makeLuaSprite('dabg', 'stages/fuego/fuego_bg2', -400, -400);
	setScrollFactor('dabg', 1, 1);
	scaleObject('dabg', 1.1, 1.1);


	addLuaSprite('void', false);
	addLuaSprite('dabg', false);

	setProperty("showCombo", false)
    setProperty("showComboNum", false)
    setProperty("showRating", false)


	
end
function onCreatePost()
	runHaxeCode([[
		for (i in game.playerStrums) {
			i.alpha = 0;
		}
		
		var video = new VideoSprite();
    	video.addCallback('onFormat',()->{
        video.setGraphicSize(FlxG.width);
        video.updateHitbox();
        video.cameras = [game.camHUD];
    	});
		game.videos.add(video);
    
		video.addCallback('onEnd',()->{
			var time = (Conductor.beatToSeconds(game.curBeat) - Conductor.beatToSeconds(game.curBeat-1)) / 1000;

			FlxG.camera.fade(FlxColor.WHITE,time,true);
		});
    
    	video.load('YUHSTORYBOARD.mp4',[VideoSprite.muted]);
		setVar('vid',video);
		game.comboGroup.visible = false;

		
	]])
end


function onSongStart()
	runHaxeCode([[
		var video = getVar('vid');

    	video.play();
    	game.addBehindDad(video);
	]])
end

--i should add more actual zooms instead of just bops
function onEvent(eventName, value1, value2, strumTime)
	if eventName == '' and value1 == 'fadeHUD' then
		runHaxeCode([[
			var time = (Conductor.beatToSeconds(game.curBeat) - Conductor.beatToSeconds(game.curBeat-1)) / 1000;
			for (i in game.playerStrums) {
				FlxTween.tween(i, {alpha: 1},time * 2, {ease: FlxEase.sineOut});
			}
		]])
	end
	--die die die die die 
	--dude all i do is runhaxecode i will never use lua the way psych intends
	if eventName == '' and value1 == 'zoomIn' then
		runHaxeCode([[
			var time = ((Conductor.beatToSeconds(game.curBeat) - Conductor.beatToSeconds(game.curBeat-1)) / 1000);

			game.isCameraOnForcedPos = true;
			var x = dad.getMidpoint().x + 150;
        	x += dad.cameraPosition[0] + game.opponentCameraOffset[0];

        	var y = dad.getMidpoint().y - 100;
        	y += dad.cameraPosition[1] + game.opponentCameraOffset[1];
			FlxTween.tween(camFollow, {x:x,y:y},time, {ease: FlxEase.circInOut,onUpdate: Void->{FlxG.camera.snapToTarget();},onComplete: Void->{game.isCameraOnForcedPos=false;}});



			FlxTween.num(FlxG.camera.zoom, game.defaultCamZoom + 0.2,time , {ease: FlxEase.circInOut,onComplete:Void->{game.defaultCamZoom = 0.625;}},(f)->{
				FlxG.camera.zoom = f;
				game.defaultCamZoom = f;
			});
		]])
	end

	--90% not gonna stay but i wanted to test smth
	if eventName == '' and value1 == 'testZoom' then
		
		runHaxeCode([[
			var time = ((Conductor.beatToSeconds(game.curBeat) - Conductor.beatToSeconds(game.curBeat-1)) / 1000);

			FlxTween.cancelTweensOf(FlxG.camera, ['zoom']);
			FlxTween.cancelTweensOf(game.camHUD, ['zoom']);
			game.camZooming = false;

			var finalResult = 0.6525;
			FlxTween.tween(FlxG.camera, {zoom: finalResult},time/4, {ease: FlxEase.cubeOut,onComplete: Void->game.camZooming=true});
			FlxTween.tween(game.camHUD, {zoom: game.camHUD.zoom + finalResult/50},time/4, {ease: FlxEase.cubeOut});

		]])

	end

	if eventName == '' and value1 == 'killTest' then
		runHaxeCode([[
			FlxTween.cancelTweensOf(FlxG.camera, ['zoom']);
			FlxTween.cancelTweensOf(game.camHUD, ['zoom']);
		]])

	end
end