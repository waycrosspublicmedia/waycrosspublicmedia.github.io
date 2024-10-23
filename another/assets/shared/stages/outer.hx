var onGame:Bool = false;
var order:Int = members.indexOf(gfGroup)+4;
var screenVisible:Bool = true;

function onSongStart(){
    placeShitOnGame(550,-100);
    game.health = 0.99;
}

function onStartCountdown(){
}

function onCreatePost(){
    for (i in unspawnNotes) {
        remove(i);
        insert(order,i);
        i.scrollFactor.set(1, 1);
        i.visible = screenVisible;
    }
}

function placeShitOnGame(xOffset:Float = 0,yOffset:Float = 0){
    grpNoteSplashes.visible = false;
    remove(noteGroup);
    insert(order,noteGroup);
    noteGroup.cameras = [camGame];

    remove(uiGroup);
    insert(order,uiGroup);
    uiGroup.cameras = [camGame];
    for (i in uiGroup.members) {
        i.x += xOffset;
        i.y += yOffset;
    }
    remove(comboGroup);
    insert(order,comboGroup);
    comboGroup.cameras = [camGame];
    remove(strumLineNotes);
    insert(order,strumLineNotes);
    
    for (i in strumLineNotes.members) {
        i.scrollFactor.set(1, 1);
        i.x += xOffset;
        i.y += yOffset;
    }
    onGame = true;

    checkShit();
}

function checkShit(){
    noteGroup.visible = screenVisible;
    uiGroup.visible = screenVisible;
    comboGroup.visible = screenVisible;
    strumLineNotes.visible = screenVisible;

    comboGroup.visible = false;
    scoreTxt.visible = false;
    timeTxt.visible = false;
    timeBar.visible = false;
    botplayTxt.visible = cpuControlled;
}

function onUpdatePost(){
    for (i in notes.members) {
        if (Conductor.songPosition - i.strumTime > noteKillOffset - 90)
        {
            i.alpha = 0;
        }
    }
}

function onEvent(n,v1,v2){
    if (n == 'screen_display'){
        if (v2 != '') screenVisible = (v2 == 'true');
        checkShit();
    }
}