import openfl.filters.ShaderFilter;

var anais:Character;
var frames:FlxSprite;
var overlay:FlxSprite;
var sh = newShader('3D');
var skipIntro = false;

function onLoad(){
    var fuck = new FlxSprite().loadGraphic(Paths.image('gumball/gumballweekly_bg'));
    add(fuck);
}

function onCreatePost(){
    anais = new Character(1400, 700, 'anais');
    game.startCharacterPos(anais);
    anais.flipX = !anais.flipX;
    add(anais);
    game.gf.flipX = false;
    game.skipCountdown = true;
    game.setGameOverVideo('richard');

    if(!skipIntro){
        game.camGame.visible = false;
        frames = new FlxSprite();
        for(i in 1...6){
            frames.loadGraphic(Paths.image('gumball/gbframe_' + i));
        }
        frames.camera = game.camOther;
        frames.visible = false;
        add(frames);
    
        overlay = new FlxSprite().loadGraphic(Paths.image('gumball/gbframe_2overlay'));
        overlay.scale.set(0.625, 0.625);
        overlay.updateHitbox();
        overlay.screenCenter();
        overlay.camera = game.camOther;
        overlay.visible = false;
        add(overlay);
    
        game.camHUD.visible = false;
        game.camGame.setFilters([new ShaderFilter(sh)]);
    
    
        queueEvent(11, (s,s2)->{ changeFrame(1); frames.visible = true;  overlay.visible = true; });
        queueEvent(43, (s,s2)->{ changeFrame(2); });
        queueEvent(75, (s,s2)->{ changeFrame(3); });
        queueEvent(138, (s,s2)->{ changeFrame(4); });
        queueEvent(183, (s,s2)->{ changeFrame(5); });
        queueEvent(198, (s,s2)->{
            for(s in [frames, overlay]) { FlxTween.tween(s, {alpha: 0}, 2, {ease: FlxEase.circInOut}); }
        });
        queueEvent(224, (s,s2)->{
            game.camGame.visible = true;
            sh.data.zpos.value = [1];
        });
        queueEvent(228, (s,s2)->{
            sh.data.yrot.value = [-1];
        });
        queueEvent(230, (s,s2)->{
            sh.data.yrot.value = [1];
        });
        queueEvent(232, (s,s2)->{
            game.camHUD.visible = true;
            sh.data.yrot.value = [0];
            sh.data.zpos.value = [0];
            game.camHUD.flash(FlxColor.WHITE,1);
        });

        queueEvent(1608, (s,s2)->{
            game.camGame.visible = false;
            game.camHUD.visible = false;
        });
    }

    game.playHUD.comboOffsets = [-300, -120, -200, -120];
}

function onSpawnNotePost(note){
    if(note.noteType == 'Anais Note'){ 
        note.owner = anais;
    }
}

function goodNoteHit(note){
    if(note.noteType == 'Anais Note' && game.playerStrums.owner != anais)
    {
        anais.holdTimer = 0;
        game.playerStrums.owner = anais; // im so sorry cam a few things were rlly bothering me and i dont wanna mess with ur shit too much so
    }
    else if (note.noteType != 'Anais Note' && game.playerStrums.owner != game.boyfriend)
    {
        game.playerStrums.owner = game.boyfriend; // I realize theres a few issues bc of this but fuck it
    }
}

function onBeatHit(){
    var anim = anais.animation.curAnim.name;
    if(!StringTools.contains(anim, 'sing') && game.curBeat % 2 == 0) anais.dance();
}

function queueEvent(step, fucj){
    modManager.queueFuncOnce(step, fucj);
}

function changeFrame(frame){
    frames.loadGraphic(Paths.image('gumball/gbframe_' + frame));
    frames.scale.set(0.75, 0.75);
    frames.updateHitbox();
    frames.screenCenter();
}