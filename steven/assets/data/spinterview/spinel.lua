function onCreate()
setProperty('gf.alpha', 0);
setProperty('boyfriend.alpha', 0);

setProperty('Black2.alpha', 1);
setProperty('Black.alpha', 0.9);

scalebf = 3;

setProperty('boyfriend.scale.x', scalebf);
setProperty('boyfriend.scale.y', scalebf);
setBlendMode('boyfriend', 'ADD');

setPropertyFromClass('GameOverSubstate', 'characterName', 'su-death'); --Character json file for the death animation
setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'SUdeathfx'); --put in mods/sounds/
setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'LLYLoop'); --put in mods/music/
setPropertyFromClass('GameOverSubstate', 'endSoundName', 'LLYEnd'); --put in mods/music/
end