if (hitPoints > 5)
{
    healthBarOutlineLength = 60/totalHitPoints;
}
else
{
    healthBarOutlineLength = 12;
}
healthBarOutlineHeight = 6;
xOffsetStart = -30;
yOffsetStart = 28;

draw_set_alpha(1);
draw_set_color(c_lime);
//draw_rectangle(x+xOffsetStart,y+yOffsetStart,x+xOffsetStart+60,y+yOffsetStart-healthBarOutlineHeight,true);
for (i=0; i<hitPoints; i+=1)
{
    xOffset = xOffsetStart +(healthBarOutlineLength*i);
    yOffset = yOffsetStart;
    draw_rectangle(x+xOffset+1,y+yOffset-2,x+xOffset+healthBarOutlineLength-1,y+yOffset-healthBarOutlineHeight+2,false);
}
draw_set_alpha(1);
