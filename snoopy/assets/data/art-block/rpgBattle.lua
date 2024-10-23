originyBar = 0

function onCreate()

    makeLuaSprite('redBar','',-200,650+200)
	makeGraphic('redBar',2000,100,'FF1800')
	addLuaSprite('redBar',false)
    setScrollFactor('redBar',0,0)
	setObjectOrder('redBar', 8)
    setObjectCamera('redBar','hud')

	originyBar = getProperty('redBar.y')
end

function onBeatHit()

end

function onEvent( name, value1,value2)

end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

end

function onStepHit()

end

function onCreatePost()

end

tabTurns = 1

function onUpdate()
	--setProperty('bfIcon1.alpha', 0.0001)
	--setProperty('snoopyIcon1.alpha', 0.0001)

	if keyboardJustPressed('TAB') then
        tabTurns = tabTurns + 1
        if tabTurns == 2 then
            doTweenY('tabY', 'redBar', originyBar-200, 0.6, 'quintOut');

			doTweenAlpha('iconPlayerDisappear', 'bfIcon1', 0.0001, 0.1, 'linear');
			doTweenAlpha('iconOppDisappear', 'snoopyIcon1', 0.0001, 0.1, 'linear');
			doTweenAlpha('healthbarDisappear', 'healthBar', 0.0001, 0.1, 'linear');
			doTweenAlpha('healthbarEdgesDisappear', 'healthBarEdges', 0.0001, 0.1, 'linear');
			doTweenAlpha('scoreDisappear', 'scoreTxt', 0.0001, 0.1, 'linear');

        else
            tabTurns = 1
            doTweenY('tabY', 'redBar', originyBar+0, 0.6, 'quadOut');

			doTweenAlpha('iconPlayerAppear', 'bfIcon1', 1, 0.1, 'linear');
			doTweenAlpha('iconOppAppear', 'snoopyIcon1', 1, 0.1, 'linear');
			doTweenAlpha('healthbarAppear', 'healthBar', 1, 0.1, 'linear');
			doTweenAlpha('healthbarEdgesAppear', 'healthBarEdges', 1, 0.1, 'linear');
			doTweenAlpha('scoreAppear', 'scoreTxt', 1, 0.1, 'linear');
        end
    end
end
