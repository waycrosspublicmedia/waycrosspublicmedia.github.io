import objects.VideoSprite;




var video;

function onCreatePost()
{
    
    video = new VideoSprite();
    video.addCallback('onFormat',()->{
        video.setGraphicSize(FlxG.width);
        video.updateHitbox();
        video.cameras = [game.camOther];
    });
    video.load('crypwalkcutscene.mp4',[VideoSprite.muted]);
    game.videos.add(video);

}

function onSongStart() {

    video.play();
    add(video);
    
}

