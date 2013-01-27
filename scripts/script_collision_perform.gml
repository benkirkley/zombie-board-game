var objectToCheckWith = argument0;
var thisObject = argument1;
direction = angle;
image_angle = angle;

collisionObjectId = collision_point(finalX,finalY,objectToCheckWith,true,true)
if ( collisionObjectId && (objectToCheckWith != thisObject) ) 
{
    if ( script_collision_item(objectToCheckWith) )
    {
        //Only allow team0 (blue) to pick up items
        if (id.thisTeamId == 0)
        {
            var loopLimit = ds_map_size(global.mapItemTypeAndStatsMap);
            for (ie=0; ie < loopLimit; ie+=1)
            {
                itemObjectName=object_get_name(objectToCheckWith); 
                mapItemStats = ds_map_find_value(global.mapItemTypeAndStatsMap, ie);
                itemString = ds_map_find_value(mapItemStats,objectToCheckWith);
                if (is_string(itemString) )
                {
                    if (itemString != "")
                    {
                        var oldWeapon = 0;
                        var oldArmour = 0;
                        if (ie == 0)
                        {
                            oldWeapon = id.inventorySlotWeapon;
                            id.equippedWeapon = itemString;
                            id.inventorySlotWeapon = string(itemString) + "_inventory";
                            script_inventory_destroy_items();
                            script_inventory_create_items();
                            script_items_equip("weapon",itemString,id);
                            ie = loopLimit //break loop
                        }
                        else if(ie == 1)
                        {
                            oldArmour = id.inventorySlotArmour;
                            id.equippedArmour = itemString;
                            id.inventorySlotArmour = string(itemString) + "_inventory";
                            script_inventory_destroy_items();
                            script_inventory_create_items();
                            script_items_equip("armour",itemString,id);
                            ie = loopLimit //break loop
                        }
                        else if(ie == 2)
                        {
                            //HEALTH
                            script_items_consume("consumable", itemString,id);
                        }
                        ie = ds_map_size(global.mapItemTypeAndStatsMap) //break loop
                        
                        with (collisionObjectId) { instance_destroy(); }
                        //Put item in inventory on to ground
                        if (is_string(oldWeapon))
                        {
                            oldWeaponObject = ds_map_find_value(global.mapItemWeaponStats,oldWeapon)
                            itemId = instance_create(x,y,oldWeaponObject);
                        }
                        if (is_string(oldArmour))
                        {
                            oldArmourObject = ds_map_find_value(global.mapItemArmourStats,oldArmour)
                            //show_message(oldArmourObject);
                            itemId = instance_create(x,y,oldArmourObject);
                        }
                         
                    }
                }
            }
            
        }
        return true; //no blocking collision
    }
        
    if ( script_collision_wall(objectToCheckWith) )
    {
        //show_message("Blocked");
        return true; //blocking collision
    }
    else
    {
        //show_message("Attack");
        if (equippedWeaponNumberOfAttacks > 0)
        {
            equippedWeaponNumberOfAttacks -= 1
            script_combat_trigger(objectToCheckWith);
        }
        else if (equippedArmourNumberOfAttacks > 0)
        {
            equippedArmourNumberOfAttacks -= 1
            script_combat_trigger(objectToCheckWith);
        }
        else if (numberOfAttacks > 0)
        {
            numberOfAttacks -= 1;
            script_combat_trigger(objectToCheckWith);
        }
    }
    
    return true; //blocking collision

}
else if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith == thisObject) )
{
    //show_message("Friendly, treat like a wall");
    script_collision_wall(objectToCheckWith)
    return true; //blocking collision
}

return false; //no blocking collision
