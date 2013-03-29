textLabel = argument0;

draw_set_color(c_lime)
draw_rectangle(x,y,x+16,y+16,0)
draw_set_color(c_black)
draw_rectangle(x+1,y+1,x+15,y+15,0)

draw_set_color(c_lime)
draw_set_font(font1)
draw_text(x+28,y-2,textLabel);


if (mouse_x > x and mouse_y > y and mouse_x < x+16 and mouse_y < y+16)
{  
    if mouse_check_button_pressed(mb_left)
    {
        if (checked = 0)
        {
            checked = 1
        }
        else if (checked = 1)
        {
            checked = 0
        }
    }
}
    
if (checked = 1)
{
    draw_set_color(c_lime)
    draw_rectangle(x+3,y+3,x+13,y+13,0)
    
    return true;
    //obj_player_red.currentSpeed = 8;
}
else
{
    return false;
    //obj_player_red.currentSpeed = 4;
}
