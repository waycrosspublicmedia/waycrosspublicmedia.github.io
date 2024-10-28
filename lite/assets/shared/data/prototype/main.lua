function onCreatePost()
    runHaxeCode([[
        game.healthBar.flipX = true;
        game.iconP1.flipX = true;
        game.iconP2.flipX = true;
    ]])
end

function onUpdatePost()
    runHaxeCode([[
		game.iconP1.x = 600 - (game.healthBar.barCenter - 600) - (150 * game.iconP2.scale.x) / 2 - 26 * 2;
		game.iconP2.x = 600 - (game.healthBar.barCenter - 600) + (150 * game.iconP1.scale.x - 150) / 2 - 26;
    ]])
end