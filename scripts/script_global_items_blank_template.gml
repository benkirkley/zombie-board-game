itemType = argument0;
itemName = argument1;
itemIniString = argument2;
dslist_ItemStats = argument3;

script_ini_read_key("Items","item_" + string(itemType) + "_"+ string(itemIniString) + "_name",itemName,"string");

for (i=1; i<ds_list_size(dslist_ItemStats); i+=1)
{
    itemStat = ds_list_find_value(dslist_ItemStats, i);
    script_ini_read_key("Items","item_" + string(itemType) + "_"+ string(itemIniString) + "_" + string(itemStat),0,"real");
}
 
 
