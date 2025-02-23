function opponentNoteHit(note)
{
if (game.dad.curCharacter == "ruv-remaster" && note.noteType != "GF Note")
   {
   ruv();
   }
}

function goodNoteHit(note)
{
if (game.boyfriend.curCharacter == "ruv-remaster" && note.noteType != "GF Note")
   {
   ruv();
   } else {
   game.gf.specialAnim = false;
   }
}

function ruv()
{
FlxG.camera.shake(0.01, 0.08);
game.camHUD.shake(0.01, 0.08);
game.camHUD.zoom += 0.025;
game.gf.playAnim("scared", true);
game.gf.specialAnim = true;
}