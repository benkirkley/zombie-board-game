/*
draw_formattedtext(x,y,string)
*/

if !variable_global_exists("fonts"){ //if the ds containing all the fonts has not been created yet
globalvar fonts; //create it
fonts=ds_map_create();}
var arg2,strings,string_x,string_y,string_colour,string_underlined,
command,innercommand,command_length,command_set,command_set_to,
command_beginning,command_end,command_valid,characters_drawn,
current_character,text_length,text_cropped,cfont_mapname,
cfont_name,cfont_size,cfont_format,previous_text,constant;

arg2=" "+argument2;
strings=1; //no commands have been made yet
strings[strings]=""; //nothing has been written yet
string_x[strings]=argument0; string_y[strings]=argument1; //x,y co-ordinates of the string
string_colour[strings]=c_black; //the default colour
string_alpha[strings]=1; //opaque
string_underlined[strings]=false; //the string is not underlined to begin with
string_font[strings]=-1; //default font
cfont_name="Arial"; cfont_size=12; cfont_format=0; //default text settings
characters_drawn=0;
text_length=string_length(arg2); //how many characters are in the string
previous_text=0; //the last string that actually had text in and not just a command

while (characters_drawn<text_length){ //if there are still more letters to be drawn
current_character=string_char_at(arg2,characters_drawn+1);
 //checks the current character
if current_character!="["{ //if a command is not being executed
characters_drawn+=1; //a new character is being drawn
if current_character!="#"{ //if it's not a newline character
strings[strings]+=current_character; //add the new character to the string
previous_text=strings;}
else{
draw_set_font(string_font[previous_text]);
strings+=1; strings[strings]=""; string_x[strings]=argument0; string_y[strings]=string_y[strings-1]
+(string_count("#",strings[strings-1]
)+1)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1];}
}
else{ //if a command is being executed
text_cropped=string_copy(arg2,characters_drawn+1,text_length-
characters_drawn); //only uses the text that has not been drawn yet
command_beginning=string_pos("[",text_cropped);

command_end=string_pos("]",text_cropped);

inner_command=false; //there is no inner command found so far
if command_end!=0{ //used for checking whether the command contains a command - if it does the outer one is rendered useless
command=string_copy(text_cropped,command_beginning+1,
command_end-(command_beginning+1)); //gets the command
if string_pos("[",command)!=0{ //checks whether there is an inner command
inner_command=true;}}
if command_end=0 or inner_command=true{ //if the end of the command is not specified
characters_drawn+=1; //just draw the [ character
strings[strings]+=current_character;
previous_text=strings;}
else{ //if there is a command
command_length=string_length(command); //gets the length of the command
command_set=string_pos("=",command); //finds whether the command is a toggle (like [bold]), or setting something (like [colour=255])
command_valid=false; //so far, the command has not been checking to see if it is a valid one, or not
if command_set=0{ //if it is a toggle command like [bold]
switch (command){ //find which command it is and use it
case "normal":
case "n":
command_valid=true;
cfont_format=0;
cfont_mapname=cfont_name+"_"+string(cfont_format)+"
_"+string(cfont_size);
if !ds_map_exists(fonts,cfont_mapname){ds_map_add(fonts,
cfont_mapname,font_add(cfont_name,cfont_size,false,false,
32,127));}
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; draw_set_font(string_font[strings]); break;
case "/italic":
case "/i":
command_valid=true;
cfont_format=font_get_bold(string_font[strings]
)*2;
cfont_mapname=cfont_name+"_"+string(cfont_format)+"
_"+string(cfont_size);
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; draw_set_font(string_font[strings]); break;
case "/bold":
case "/b":
command_valid=true;
cfont_format=font_get_italic(string_font[strings]
);
cfont_mapname=cfont_name+"_"+string(cfont_format)+"
_"+string(cfont_size);
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; draw_set_font(string_font[strings]); break;
case "/underline":
case "/u":
command_valid=true;
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=false; string_font[strings]=string_font[strings-
1]; break;
case "/font":
command_valid=true;
cfont_name="Arial";
cfont_mapname=cfont_name+"_"+string(cfont_format)+"
_"+string(cfont_size);
if !ds_map_exists(fonts,cfont_mapname){ds_map_add(fonts,
cfont_mapname,font_add(cfont_name,cfont_size,cfont_format>
=2,(cfont_format=1 or cfont_format=3),32,127));}
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; draw_set_font(string_font[strings]); break;
case "italic":
case "i":
command_valid=true;
cfont_format=1+font_get_bold(string_font[strings]
)*2;
cfont_mapname=cfont_name+"_"+string(cfont_format)+"
_"+string(cfont_size);
if !ds_map_exists(fonts,cfont_mapname){ds_map_add(fonts,
cfont_mapname,font_add(cfont_name,cfont_size,cfont_format>
=2,true,32,127));}
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; draw_set_font(string_font[strings]); break;
case "bold":
case "b":
command_valid=true;
cfont_format=2+font_get_italic(string_font[strings]
);
cfont_mapname=cfont_name+"_"+string(cfont_format)+"
_"+string(cfont_size);
if !ds_map_exists(fonts,cfont_mapname){ds_map_add(fonts,
cfont_mapname,font_add(cfont_name,cfont_size,true,(cfont_format=1 or cfont_format=3),32,127));}
strings+=1; strings[strings]="";if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; draw_set_font(string_font[strings]); break;
case "underline":
case "u":
command_valid=true;
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=true; string_font[strings]=string_font[strings-
1]; break;
}}
else{ //if the command is a setting one like [colour=255]
command_set_to=string_copy(command,command_set+1,command_length-
command_set);
switch (string_copy(command,0,command_set-1)){ //find which command is being set, and set it to whatever it's being set to
case "colour":
case "color":
case "c":
command_valid=true;
var colour;
constant=(string_digits(command_set_to)!=command_set_to);
 //checks whether the command is made up of numbers, or is a string/mix of numbers
if constant=true{colour=execute_string("return "+command_set_to+";");}else{colour=real(command_set_to);
}
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=colour; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; break;
case "alpha":
case "a":
command_valid=true;
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=real(command_set_to);
 string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; break;
case "font":
command_valid=true;
var font_found,f,fa;
font_found=false;
fa=font_add("",1,0,0,1,1);
for (f=0;f<=fa;f+=1){
if font_get_name(f)=command_set_to{font_found=true; break;}}
font_delete(fa);
if !font_found{
cfont_name=command_set_to;
cfont_mapname=cfont_name+"_"+string(cfont_format)+"
_"+string(cfont_size);
if !ds_map_exists(fonts,cfont_mapname){ds_map_add(fonts,
cfont_mapname,font_add(cfont_name,cfont_size,cfont_format>
=2,(cfont_format=1 or cfont_format=3),32,127));}}
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; if font_found=false{string_font[strings]=ds_map_find_value(fonts,
cfont_mapname);}else{string_font[strings]=f;
} draw_set_font(string_font[strings]); break;
case "size":
command_valid=true;
cfont_size=real(string_digits(command_set_to));
cfont_mapname=cfont_name+"_"+string(cfont_format)+"
_"+string(cfont_size);
if !ds_map_exists(fonts,cfont_mapname){ds_map_add(fonts,
cfont_mapname,font_add(cfont_name,cfont_size,cfont_format>
=2,(cfont_format=1 or cfont_format=3),32,127));}
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=ds_map_find_value(fonts,
cfont_mapname); draw_set_font(string_font[strings]); break;
case "image":
case "img":
command_valid=true;
var spr,imgindx,bracket;
bracket[1]=string_pos("(",command_set_to);

bracket[2]=string_pos(")",command_set_to);

if bracket[1]=0 or bracket[2]=0{imgindx=0;}
else{imgindx=real(string_digits(string_copy(command_set_to,
bracket[1]+1,(string_length(command_set_to)-
bracket[1])-1))); command_set_to=string_copy(command_set_to,0,bracket[
1]-1);}
constant=(string_digits(command_set_to)!=command_set_to);
 //checks whether the command is made up of numbers, or is a string/mix of numbers
if constant=true{spr=execute_string("return "+command_set_to+";");}else{spr=real(string_digits(command_set_to));
}
draw_sprite(spr,imgindx,string_x[strings]+string_width(strings[
strings])+sprite_get_width(spr)/2,(string_y[
strings]-sprite_get_height(spr)/2)+2);
strings+=1; strings[strings]=""; if strings[strings-1]=""{string_x[
strings]=string_x[strings-1]}else{string_x[
strings]=(string_x[previous_text]+string_width(strings[
previous_text]))}; string_x[strings]+=sprite_get_width(spr); string_y[strings]=string_y[previous_text]
+string_count("#",strings[previous_text]
)*string_height("#"); string_colour[strings]=string_colour[strings-
1]; string_alpha[strings]=string_alpha[strings-
1]; string_underlined[strings]=string_underlined[
strings-1]; string_font[strings]=string_font[strings-
1]; break;
}}
if command_valid=false{ //if the command was not a real one
strings[strings]+="["+command+"
]";//just draw the text instead
previous_text=strings;}
characters_drawn+=command_length+2; //skip the rest of the command
}}}

var s,sh;
s=0;
repeat (strings){ //for all the parts of the text
s+=1;
draw_set_color(string_colour[s]);
draw_set_alpha(string_alpha[s]);
draw_set_font(string_font[s]);
draw_set_valign(fa_top);
sh=string_height("#");
if strings[s]!=""{
draw_text(string_x[s],(string_y[s]-
sh*0.78),strings[s]); //draw the string
if string_underlined[s]=true{
draw_line(string_x[s],string_y[s]+2,
string_x[s]+string_width(strings[s]),
string_y[s]+2)} //underline the text
}}
