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
                        if (ie == 0)
                        {
                            id.equippedWeapon = itemString;
                            id.inventorySlotWeapon = string(itemString) + "_inventory";
                            script_inventory_destroy_items();
                            script_inventory_create_items();
                            script_items_equip("weapon",itemString,id);
                            ie = loopLimit //break loop
                        }
                        else if(ie == 1)
                        {
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
                        }
                        ie = ds_map_size(global.mapItemTypeAndStatsMap) //break loop
                        
                    }
                }
                with (collisionObjectId) { instance_destroy(); }
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
