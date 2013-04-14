i = argument0;
attribute = argument1;
value = argument2;

if ( ds_map_exists(global.savedPlayerData, string(i)+string(attribute)) )
{
    ds_map_replace(global.savedPlayerData, string(i)+string(attribute),value);
}
else
{
    ds_map_add(global.savedPlayerData, string(i)+string(attribute),value);
}
