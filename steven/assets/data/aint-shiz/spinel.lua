function onCreate()
setProperty('gf.alpha', 0);
--setProperty('boyfriend.alpha', 0);

setProperty('Black2.alpha', 1);
--setProperty('Black.alpha', 0.9);

setPropertyFromClass('GameOverSubstate', 'characterName', 'su-death'); --Character json file for the death animation
setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'SUdeathfx'); --put in mods/sounds/
setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'LLYLoop'); --put in mods/music/
setPropertyFromClass('GameOverSubstate', 'endSoundName', 'LLYEnd'); --put in mods/music/
end