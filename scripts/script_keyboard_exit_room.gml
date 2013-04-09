showInteractiveText = argument0;
nextRoom = argument1;
playerOnThisZone = 0;
playerOnThisZone = collision_rectangle(bbox_left-16,bbox_bottom-16,bbox_right-16,bbox_top-16,obj_player_blue,false,false);

//playerOnThisZone = collision_point(x,y,obj_player_blue,false,false);
/*
textString = "";
if (nextRoom == room_corridor_2)
{
    textString="#playerOnThisZone: " +string(playerOnThisZone)
              +"#obj_player_blue.x: " + string(obj_player_blue.x)
              +"#obj_player_blue.y: " +string(obj_player_blue.y)
              +"#bbox_left: " + string(bbox_left)
              +"#bbox_bottom: " + string(bbox_bottom)
              +"#bbox_right: " + string(bbox_right)
              +"#bbox_top: " + string(bbox_top)
                              ;
    obj_text_interactive.text = textString;
}
*/
if (playerOnThisZone)
{
    showInteractiveText = true;
    obj_text_interactive.text = "";
    if (playerOnThisZone.amICurrentPlayer)
    {
        if (!playerOnThisZone.isMoving)
        {
            if (playerOnThisZone.actionPoints == playerOnThisZone.totalActionPoints)
            {
                obj_text_interactive.text = "Press Space to exit room."
                                            +"#(Surviving zombies will follow you)"
                                            +"#thisExitId: " + string(id);
                                            ;
                if ( keyboard_check_pressed( vk_space ) )
                {
                    script_save_chars();
                    //room_goto_next();
                    global.previousRoom = room;
                    room_goto(nextRoom);
                }
            }
            else
            {
                obj_text_interactive.text = "It takes a full turn to leave the room"
                                            ;
            }
        }
    }
}
else
{
    if (showInteractiveText)
    {
        showInteractiveText = false;
        obj_text_interactive.text = "";
    }
}
