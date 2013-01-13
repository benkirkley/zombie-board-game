/***************************************************
  TEXT
 ***************************************************/

section = argument0;
key = argument1;
keyDefault = argument2;
keyType = argument3
 
 
if ( ini_key_exists(section,key) )
{
    //show_message("key_exists");
    if (keyType == "real")
    {
        return ini_read_real(section,key,-1);
    }
    else if (keyType == "string")
    {
        return ini_read_string(section,key,"error"); 
    }
}
else
{
    //show_message("key_does_not_exist");
    if (keyType == "real")
    {
       ini_write_real(section,key,keyDefault);
    }
    else if (keyType == "string")
    {
        ini_write_string(section,key,keyDefault);
    }
    return keyDefault;
}
