showInteractiveText = argument0;
nextRoom = argument1;
playerOnThisZone = 0;
playerOnThisZone = collision_rectangle(bbox_left-16,bbox_bottom-16,bbox_right-16,bbox_top-16,obj_player_blue,false,false);

if (playerOnThisZone)
{
    showInteractiveText = true;
    //obj_text_interactive.text = "";
    if (playerOnThisZone.amICurrentPlayer)
    {
        if (!playerOnThisZone.isMoving)
        {
            if (playerOnThisZone.actionPoints == playerOnThisZone.totalActionPoints)
            {
                //instance_create(320,608,obj_text_interactive);
                text = "Press Space to exit room."
                     +"#(Surviving zombies will follow you)"
                     ;    
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
                text = "It takes a full turn to leave the room"
                                            ;
            }
            var tempDepth = depth;
            depth = -10
            draw_set_halign(fa_center);
            draw_set_font(font1)
            draw_set_color(c_white);
            draw_set_alpha(1);
            draw_text(385,576,text);
            draw_set_halign(fa_left);
            depth = tempDepth;
        }
    }
}
else
{
    if (showInteractiveText)
    {
        showInteractiveText = false;
        //obj_text_interactive.text = "";
    }
}
