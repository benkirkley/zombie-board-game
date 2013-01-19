typeOfWindow=argument0;

    if ( position_meeting(mouse_x, mouse_y, self) )
    {
        if ( statsWindowsId == false )
        {  
            if (typeOfWindow == "player")
            {
                statsWindowsId = instance_create(mouse_x+20,mouse_y+6,obj_stats);
                global.statsWindowPlayerID = self.id;
            }
            else if (typeOfWindow == "item")
            {
                show_message("Item");
            }
        }
        else
        {
            statsWindowsId.x = mouse_x+20;
            statsWindowsId.y = mouse_y+6;
        }
    }
    else
    {
        if (statsWindowsId)
        {   
            with (statsWindowsId) {instance_destroy();}
            statsWindowsId = 0;
        }
    }

