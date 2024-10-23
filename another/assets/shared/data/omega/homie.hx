var canhead:Character = null;
function onCreatePost(){
    var dadX = game.dadGroup.x;
    var dadY = game.dadGroup.y;
    
    canhead = new Character(dadX - 400, dadY+150, 'nekuma');
    canhead.scrollFactor.set(1.2, 1.2);
    canhead.y += canhead.positionArray[1] - 50;
    game.add(canhead);
}

function onUpdate(){
    if (game.startedCountdown && game.generatedMusic){
        if (!canhead.stunned && canhead.holdTimer > Conductor.stepCrochet * 0.0011 * canhead.singDuration && StringTools.startsWith(canhead.animation.curAnim.name, 'sing') && !StringTools.endsWith(canhead.animation.curAnim.name, 'miss')){
            canhead.dance();
        }
    }
}

function onBeatHit(){
    if (curBeat % canhead.danceEveryNumBeats == 0 && canhead.animation.curAnim != null && !StringTools.startsWith(canhead.animation.curAnim.name, 'sing')){
        canhead.dance();
    }
}

var directions:Array = ['LEFT', 'DOWN', 'UP', 'RIGHT'];
function opponentNoteHit(note){
	if (note.noteType == 'Alt Animation') {
        canhead.playAnim(game.singAnimations[Math.abs(note.noteData)], true);
        canhead.holdTimer = 0;
    }
}

/*
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
		runHaxeCode([[
			canhead.playAnim(game.singAnimations[]]..direction..[[], true);
			canhead.holdTimer = 0;
		]]);
	end
end
*/