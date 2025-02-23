local dialogueCount = 0

function doDialogue()
dialogueCount = dialogueCount + 1;

 if dialogueCount == 1 then
  startDialogue("dialogue1");
 elseif dialogueCount == 2 then
  startDialogue("dialogue2");
 end

end