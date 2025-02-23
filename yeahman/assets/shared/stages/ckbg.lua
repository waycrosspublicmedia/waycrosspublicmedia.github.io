

function onCreate()
    makeLuaSprite('bg', 'stages/ck/ckbg22', -500, 0);
    makeLuaSprite('table', 'stages/ck/cktable', -500, 0);
    
    addLuaSprite('bg', false);
    addLuaSprite('table', true);

    scaleObject("bg", 1.5, 1.5)
    scaleObject("table", 1.5, 1.5)
    setScrollFactor("table", 0.95, 0.95)

    makeAnimatedLuaSprite("speaker",'stages/ck/PaperSpeaker',0,80);
    addAnimationByPrefix("speaker", "i", "Speaker Bop",24,false)
    scaleObject("speaker", 1.5, 1.5)
    addLuaSprite('speaker', false);

    setProperty("speaker.x", getProperty("bg.x") + ((getProperty("bg.width") - getProperty("speaker.width"))/2) - 10)


    setProperty("bg.antialiasing", false)
    setProperty("table.antialiasing", false)
    setProperty("speaker.antialiasing", false)

end


function onBeatHit()
    playAnim("speaker", "i")
end


function onGameOver()

    openCustomSubstate("ckGameover",true)
    

    return Function_Stop
end


local allowedToLeave = false
function onCustomSubstateCreate(name)
    if name == 'ckGameover' then

        runHaxeCode([[

            game.camHUD.visible = false;
            game.boyfriend.visible = false;


            var b = new FlxSprite().makeGraphic(1,1,FlxColor.BLACK);
            b.scale.set(FlxG.width * 4,FlxG.height * 4);
            b.updateHitbox();
            b.scrollFactor.set();
            b.alpha = 0.5;
            b.screenCenter();
            add(b);
            
            var ckDead = new Character(0,0,'ckDead',true);
            add(ckDead);
            ckDead.x = game.boyfriend.x;
            ckDead.y = game.boyfriend.y;
            ckDead.x -= 40;
            FlxTween.tween(ckDead, {x: ckDead.x + 40},0.025, {type: 4,onComplete: (twn)->{
                if (twn.executions == 8) 
                {
                    twn.cancel();
                }
            }});

            FlxG.camera.scroll.x = ckDead.x + (ckDead.width/2) - (FlxG.width/2) - 200;

            game.modchartSprites.set('deadKAY',ckDead);

        ]])

        playSound("clipped",1,'ckDied')

        runTimer("ripped",2)

        --weird workaround but whatever lol
        runHaxeCode([[
            import psychlua.LuaUtils;

            

            game.modchartSounds.get('ckDied').onComplete = ()->
            {
                game.modchartTweens.set('_camblackFade', FlxTween.tween(game.modchartSprites.get('_camblack'), {alpha: 1}, 1, {ease: LuaUtils.getTweenEaseByString('retro'),
				    onComplete: function(twn:FlxTween) 
                    {
					    game.modchartTweens.remove('_camblackFade');
					    game.callOnLuas('onTweenCompleted', ['_camblackFade', 'vars']);
				    }
			    }));
            }

        ]])

        makeLuaSprite("_ckBG")
        makeGraphic("_ckBG",1,1,'FFF9E4')
        scaleObject("_ckBG", screenWidth, screenHeight)
        setObjectCamera("_ckBG",'other')
        addLuaSprite("_ckBG",true)

        setProperty("_ckBG.alpha", 0)
        
        makeLuaSprite("_ck",'gameover/deack')
        scaleObject("_ck", 0.8, 0.8)
        screenCenter("_ck")
        setObjectCamera("_ck",'other')
        addLuaSprite("_ck",true)

        setProperty("_ck.alpha", 0)
        
        makeLuaSprite("_camblack")
        makeGraphic("_camblack",1,1,'000000')
        scaleObject("_camblack", screenWidth, screenHeight)
        setObjectCamera("_camblack",'other')
        addLuaSprite("_camblack",true)

        setProperty("_camblack.alpha", 0)


        -- doTweenAlpha("_camblackFade", "_camblack", 1, 1, "retro")
    end
end

function onTweenCompleted(tag)
    if tag == '_camblackFade' then
        playMusic("CKdeath",0,true)
        musicFadeIn(4,0,0.7)
        setProperty("_ck.alpha", 1)
        setProperty("_ckBG.alpha", 1)
        runTimer("waitToFadeBack",0.6)
    end

    if tag == '_camblackFadeTwo' then
        allowedToLeave = true
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    
    if tag == 'ripped' then
        playAnim("deadKAY", "rip")
    end

    if tag == 'waitToFadeBack' then
        doTweenAlpha("_camblackFadeTwo", "_camblack", 0, 1, "retro")
    end
end

function onCustomSubstateUpdatePost(name, elapsed)
    if name == 'ckGameover' then

        runHaxeCode([[
            if (game.modchartSprites.exists('deadKAY'))
            {
                game.modchartSprites.get('deadKAY').animation.update(FlxG.elapsed);
            }
        ]])

        if keyJustPressed('accept') and allowedToLeave then
            restartSong(false)
        end


        if keyJustPressed('back') and allowedToLeave then
            exitSong()
        end
    end
end