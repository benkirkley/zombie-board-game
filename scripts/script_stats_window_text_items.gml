key = argument0;
value = argument1;

//show_message( "Key: " + string(key) + ", Value: " + string(value) );

var itemStat = ds_map_find_value(mapItemsStats, string(itemString)+"_" + key);
if (itemStat != 0)
{
    text += "#"+string(value)+": "
    if (itemStat > 0) text += "+";
    text +=  +string(itemStat);
}
