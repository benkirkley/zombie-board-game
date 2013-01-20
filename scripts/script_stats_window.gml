typeOfWindow=argument0;
instanceId = argument1;

var offsetX = 20;
var offsetY = 6;

if ( position_meeting(mouse_x, mouse_y, self) )
{
    if ( statsWindowsId == false )
    {  
        if (instance_number(obj_stats) > 0 )
        {
            if (typeOfWindow == "player")
            { 
                var offsetX = -120;
                var offsetY = 6;
            }
            else if (typeOfWindow == "item")
            {
                var offsetX = -100;
                var offsetY = 6;
            }
        }
        statsWindowsId = instance_create(mouse_x+offsetX,mouse_y+offsetY,obj_stats);
        statsWindowsId.typeOfWindow = typeOfWindow;
        statsWindowsId.instanceId = instanceId;
        statsWindowsId.offsetX = offsetX;
        statsWindowsId.offsetY = offsetY;
    }
    else
    {
        //statsWindowsId.x = mouse_x + 20 + statsWindowsId.offsetX;
        //statsWindowsId.y = mouse_y + 6 + statsWindowsId.offsetY;
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

