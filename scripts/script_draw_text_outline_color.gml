/*
argument0: x position of text
argument1: y position of text
argument2: how big the outline is
argument3: the text shown.
argument4: the color of the text
argument5: the color of the outline
*/

var color;
color=draw_get_color();
draw_set_color(argument5);
for(i=argument0-argument2;i<=argument0+argument2;
i+=1){
for(n=argument1-argument2;n<=argument1+argument2;
n+=1){
draw_text(i,n,argument3);}}
draw_set_color(argument4);
draw_text(argument0,argument1,argument3);
draw_set_color(color);
