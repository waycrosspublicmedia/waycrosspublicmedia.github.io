function opponentNoteHit(note)
{
if (game.dad.curCharacter == "ruv")
   {
   FlxG.camera.shake(0.01, 0.08);
   game.gf.playAnim("scared", true);
   game.gf.specialAnim = true;
   }
}

function goodNoteHit(note)
{
if (game.boyfriend.curCharacter == "ruv")
   {
   FlxG.camera.shake(0.01, 0.08);
   game.gf.playAnim("scared", true);
   game.gf.specialAnim = true;
   } else {
   game.gf.specialAnim = false;
   }
}