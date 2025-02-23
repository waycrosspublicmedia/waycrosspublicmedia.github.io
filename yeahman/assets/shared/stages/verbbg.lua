function onCreate()
	makeAnimatedLuaSprite('bg', 'stages/verb/verb_bg', -1500, -500);
	luaSpriteAddAnimationByPrefix('bg', 'loop', 'loop', 6, true)
	luaSpritePlayAnimation('bg', 'loop', true)
	setScrollFactor('bg', 1, 1);
	scaleObject('bg', 3.4, 3.4);
	addLuaSprite('bg', false);
	setProperty('bg.antialiasing', false)
end

function onUpdate()
	for i = 0,3 do
        noteTweenAlpha(i+0, i, 0, 0.0000001)
    end

	setProperty('scoreTxt.alpha', 0)
	setProperty('timeTxt.alpha', 0)
	setProperty('timeBar.alpha', 0)
	setProperty('timeBarBG.alpha', 0)
end