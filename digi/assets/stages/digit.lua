function onCreate()
	makeLuaSprite('bg','bgstuffs/circus',-810,-60)
	addLuaSprite('bg',false)

	makeLuaSprite('blackscreen', 'blackscreen', -50, 0);
	addLuaSprite('blackscreen', false)
    	setObjectCamera('blackscreen', 'hud')
	scaleObject('blackscreen', 6, 6)
	setProperty('blackscreen.alpha', 0)

makeLuaText('watermark', "Coding, Charting and Playable by Herox | Song by I Dan K | Art by Kyng | Background by Matias Idk", 0, 5, 0);
    setTextSize('watermark', 22);
    addLuaText('watermark');
    setObjectCamera('watermark', 'other');
end

function onCreatePost()
	setProperty('gf.alpha', 0)
end

function onStepHit()
if curStep == 184 then
	setProperty("defaultCamZoom", 0.8)
	end

if curStep == 186 then
	setProperty("defaultCamZoom", 0.9)
	end

if curStep == 188 then
	setProperty("defaultCamZoom", 1)
	end

if curStep == 190 then
	setProperty("defaultCamZoom", 1.1)
	end

if curStep == 191 then
	setProperty("defaultCamZoom", 1.2)
	end

if curStep == 192 or curStep == 480 then
	setProperty("defaultCamZoom", 0.7)
	end
end

function onBeatHit()
if curBeat == 92 then
	setProperty('blackscreen.alpha', 1)
	end

if curBeat == 96 then
	cameraFlash('other', 'FFFFFF', 0.5)
	setProperty('blackscreen.alpha', 0)
	setProperty('gf.alpha', 1)
	end

if curBeat == 110 then
	noteTweenAlpha("NoteAlpha1", 0, 0, 0.25, 'expoOut')
	noteTweenAlpha("NoteAlpha2", 1, 0, 0.25, 'expoOut') 
	noteTweenAlpha("NoteAlpha3", 2, 0, 0.25, 'expoOut')
	noteTweenAlpha("NoteAlpha4", 3, 0, 0.25, 'expoOut')

        noteTweenX('bfTween1', 4, 400, 0.5, 'bounceOut');
        noteTweenX('bfTween2', 5, 510, 0.5, 'bounceOut');
        noteTweenX('bfTween3', 6, 620, 0.5, 'bounceOut');
        noteTweenX('bfTween4', 7, 730, 0.5, 'bounceOut');
	end

if curBeat == 116 then
	setProperty("defaultCamZoom", 0.9)
	end

if curBeat == 128 or curBeat == 136 or curBeat == 144 or curBeat == 152 then
	setProperty("defaultCamZoom", 0.8)
	end

if curBeat == 132 or curBeat == 148 then
	setProperty("defaultCamZoom", 0.9)
	end

if curBeat == 140 or curBeat == 155 or curBeat == 160 then
	setProperty("defaultCamZoom", 0.7)
	end

if curBeat == 158 then
	setProperty("defaultCamZoom", 0.9)
	end

if curBeat == 159 then
	setProperty("defaultCamZoom", 1.1)
	end

if curBeat == 160 then
	cameraFlash('other', 'FFFFFF', 0.5)
    	setObjectCamera('blackscreen', 'other')

	noteTweenAlpha("NoteAlpha1", 0, 1, 0.5, 'expoOut')
	noteTweenAlpha("NoteAlpha2", 1, 1, 0.5, 'expoOut') 
	noteTweenAlpha("NoteAlpha3", 2, 1, 0.5, 'expoOut')
	noteTweenAlpha("NoteAlpha4", 3, 1, 0.5, 'expoOut')

        noteTweenX('bfTween1', 4, 735, 0.25, 'bounceOut');
        noteTweenX('bfTween2', 5, 845, 0.25, 'bounceOut');
        noteTweenX('bfTween3', 6, 955, 0.25, 'bounceOut');
        noteTweenX('bfTween4', 7, 1065, 0.25, 'bounceOut');
	end

if curBeat == 192 then
	cameraFlash('other', 'FFFFFF', 0.5)
	setProperty('gf.alpha', 0)
	end

if curBeat == 226 then
		doTweenAlpha('camHUD', 'camHUD', 0, 0.5)
	end

if curBeat == 240 then
		doTweenAlpha('blackscreen', 'blackscreen', 1, 15)
	end

if curBeat == 256 then
	cameraFlash('other', 'FFFFFF', 2)
	doTweenAlpha('blackscreen', 'blackscreen', 1, 0.001)
	end
end
