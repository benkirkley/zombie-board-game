

with (obj_player_blue)
{
    zoneIdToCheckWith = argument0;
    playerOnThisZone = 0;
    playerOnThisZone = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,zoneIdToCheckWith,false,false);
    if (playerOnThisZone)
    {
        if (amICurrentPlayer)
        {
            if (!isMoving)
            {
                if (actionPoints == totalActionPoints)
                {
                    //instance_create(320,608,obj_text_interactive);
                    text = "Press Space to exit room."
                         +"#(Surviving zombies will follow you)"
                         ;    
                                                ;
                    if ( keyboard_check_pressed( vk_space ) )
                    {
                        nextRoom = argument1;
                        script_save_chars();
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
}
