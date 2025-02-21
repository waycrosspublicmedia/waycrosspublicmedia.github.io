import objects.VideoSprite;
import flixel.tweens.FlxTween;
import openfl.filters.ShaderFilter;
import flixel.addons.display.FlxRuntimeShader;

var shader = new FlxRuntimeShader("
#pragma header

uniform float AMT;
uniform float SPEED;
uniform float iTime;
uniform float hue;
uniform float pix;

float random2d(vec2 n){
    return fract(sin(dot(n,vec2(12.9898,4.1414)))*43758.5453);
}

float randomRange(in vec2 seed,in float min,in float max){
    return min+random2d(seed)*(max-min);
}

float insideRange(float v,float bottom,float top){
    return step(bottom,v)-step(top,v);
}

void main()
{

    vec2 uv = openfl_TextureCoordv.xy;

    float time=floor(iTime*SPEED);
    vec4 outCol=flixel_texture2D(bitmap,uv);
    
    float maxOffset=AMT/32.;
    for(float i=0.;i<10.*AMT;i+=.25){
        float sliceY=random2d(vec2(time,2345.+float(i)));
        float sliceH=random2d(vec2(time,925.+float(i)))*.075;
        float hOffset=randomRange(vec2(time,25.+float(i)),-maxOffset,maxOffset);
        vec2 uvOff=uv.xy;
        uvOff.x+=hOffset;
        if(insideRange(openfl_TextureCoordv.y,sliceY,fract(sliceY+sliceH))==1.){
            outCol=flixel_texture2D(bitmap,uvOff);
        }
    }

    float Cmax = max(outCol.x, max(outCol.y, outCol.z));
    float Cmin = min(outCol.x, min(outCol.y, outCol.z));
    float delta = Cmax - Cmin;
    
    float H = 0.;
    float S = 0.;
    float V = Cmax;
    
    if(delta == 0.){
        H = 0.;
    } else if(outCol.x >= outCol.y && outCol.x >= outCol.z){
        H = 60. * mod((outCol.y - outCol.z) / delta, 6.);
    } else if(outCol.y >= outCol.x && outCol.y >= outCol.z){
        H = 60. * ((outCol.z - outCol.x) / delta + 2.);
    } else if(outCol.z >= outCol.y && outCol.z >= outCol.x){
        H = 60. * ((outCol.x - outCol.y) / delta + 4.);
    }
    
    if(Cmax == 0.){
        S = 0.;
    } else {
        S = delta / Cmax;
    }
    
    H = hue / 2. * 360.;
        
    float C = V * S;
    float X = C * (1. - abs(mod(H / 60., 2.) - 1.));
    float m = V - C;
    
    vec3 rgbP = vec3(0.);
    
    if(0. <= H && H < 60.){
        rgbP = vec3(C, X, 0.);
    } else if(60. <= H && H < 120.){
        rgbP = vec3(X, C, 0.);
    } else if(120. <= H && H < 180.){
        rgbP = vec3(0., C, X);
    } else if(180. <= H && H < 240.){
        rgbP = vec3(0., X, C);
    } else if(240. <= H && H < 300.){
        rgbP = vec3(X, 0., C);
    } else {
        rgbP = vec3(C, 0., X);
    }

    gl_FragColor = vec4(rgbP.x + m, rgbP.y + m, rgbP.z + m, outCol.a);

}
");

var disc;
var peakingTyler;
var eyes;

var video:VideoSprite;
function onCreatePost()
{

    var bg = new FlxSprite(-1000.2, -500.9).loadGraphic(Paths.image('stages/chromokopia/bg'));
    bg.scrollFactor.set(0.05,0.05);
    insert(4,bg);

    bg.setGraphicSize(4255 * 0.8,2521 * 0.8);
    bg.updateHitbox();


    video = new VideoSprite();
    video.addCallback('onFormat',()->{
        video.setGraphicSize(bg.width,bg.height);
        video.updateHitbox();
        video.x = bg.x;
        video.y = bg.y;
        video.scrollFactor.set(0.05,0.05);
        video.alpha = 0 ;
        FlxTween.tween(video, {alpha: 0.4},5);
    });
    video.load('chromokopia.mp4',[VideoSprite.muted]);
    insert(5,video);


    var tyler = new FlxSprite(0,0).loadGraphic(Paths.image('stages/chromokopia/cutout'));
    addBehindDad(tyler);
    tyler.cameras = [game.camExempt];

    peakingTyler = new FlxSprite(700,700).loadGraphic(Paths.image('stages/chromokopia/peak'));
    peakingTyler.visible = false;
    insert(6,peakingTyler);

    eyes = new FlxSprite(700,700).loadGraphic(Paths.image('stages/chromokopia/eyes'));
    eyes.visible = false;
    insert(7,eyes);

    disc = new FlxSprite(0,0).loadGraphic(Paths.image('stages/chromokopia/disc'));
    disc.scale.set(4,4);
    disc.updateHitbox();
    add(disc);
    disc.visible = false;

    var filter = new ShaderFilter(shader);

    shader.setFloat('hue',0.7);
    if (FlxG.camera.filters == null)
    {
        FlxG.camera.filters = [];
    }
    FlxG.camera.filters.push(filter);

    if (game.camExempt.filters == null)
    {
        game.camExempt.filters = [];
    }
    game.camExempt.filters.push(filter);

    game.camHUD.filters = [filter];

    game.camOther.filters = [filter];
}


function onStepHit()
{
    if (curStep == 128)
    {
        disc.visible = true;
        peakingTyler.visible = true;
        eyes.visible = true;

        FlxTween.tween(peakingTyler,{y: 0},10);
        FlxTween.tween(eyes,{y: 0},10, {onComplete: Void->{
            FlxTween.tween(eyes, {x: 700 - 20},0.6, {ease: FlxEase.cubeOut,startDelay: 2,onComplete: Void->{
                FlxTween.tween(eyes,{x: 700 + 20},0.5, {ease: FlxEase.cubeOut,startDelay: 1.5, onComplete: Void->{
                    FlxTimer.wait(2,()->{
                        FlxTween.tween(eyes,{x: 700},0.6);
                        FlxTween.tween(peakingTyler,{y: 700},10);
                        FlxTween.tween(eyes,{y: 700},10);
                    });
                }}); 
            }});
        }});



        video.play();
    }
}