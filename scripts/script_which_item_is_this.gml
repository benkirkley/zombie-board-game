collisionObjectId = argument0;
thisObject = argument1;
objectToCheckWith = collisionObjectId.object_index;

//Only allow team0 (blue) to pick up items
if (id.thisTeamId == 0)
{                
    //Cycle through the types of item maps and find a matching type
    var loopLimit = ds_map_size(global.mapItemTypeAndStatsMap);
    for (itemTypeMap=0; itemTypeMap < loopLimit; itemTypeMap+=1)
    {
        itemObjectName=object_get_name(objectToCheckWith); 
        mapItemStats = ds_map_find_value(global.mapItemTypeAndStatsMap, itemTypeMap);
        itemString = ds_map_find_value(mapItemStats,objectToCheckWith);
        if (is_string(itemString) )
        {
            //We have a match
            if (itemString != "")
            {  
                var oldWeapon = 0;
                var oldArmour = 0;
                if (itemTypeMap == 0)
                {
                    oldWeapon = id.inventorySlotWeapon;
                    id.equippedWeapon = itemString;
                    id.inventorySlotWeapon = string(itemString) + "_inventory";  
                    script_inventory_destroy_items();
                    script_inventory_create_items();
                    script_items_equip("weapon",itemString,id, collisionObjectId);
                    itemTypeMap = loopLimit //break loop
                }
                else if(itemTypeMap == 1)
                {
                    oldArmour = id.inventorySlotArmour;
                    id.equippedArmour = itemString;
                    id.inventorySlotArmour = string(itemString) + "_inventory";
                    script_inventory_destroy_items();
                    script_inventory_create_items();
                    script_items_equip("armour",itemString,id, collisionObjectId);
                    itemTypeMap = loopLimit //break loop
                }
                else if(itemTypeMap == 2)
                {
                    //HEALTH
                    script_items_consume("consumable", itemString, id, collisionObjectId);
                    itemTypeMap = loopLimit //break loop
                }
                itemTypeMap = ds_map_size(global.mapItemTypeAndStatsMap) //break loop
                
                with (collisionObjectId) { instance_destroy(); }
                //Put item in inventory on to ground
                if (is_string(oldWeapon))
                {
                    oldWeaponObject = ds_map_find_value(global.mapItemWeaponStats,oldWeapon)
                    if (oldWeaponObject)
                    {
                        itemId = instance_create(x,y,oldWeaponObject);
                        itemId.image_alpha = 0.5;
                    }
                }
                if (is_string(oldArmour))
                {
                    oldArmourObject = ds_map_find_value(global.mapItemArmourStats,oldArmour)
                    if (oldArmourObject)
                    {
                        itemId = instance_create(x,y,oldArmourObject);
                        itemId.image_alpha = 0.5;
                    }
                }
                 
            }
        }
    }
    
}
return true; //no blocking collision
