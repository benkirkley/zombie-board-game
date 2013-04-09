showInteractiveText = argument0;
nextRoom = argument1;
playerOnThisZone = 0;
playerOnThisZone = collision_rectangle(bbox_left-16,bbox_bottom-16,bbox_right-16,bbox_top-16,obj_player_blue,false,false);

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
