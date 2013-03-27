if (isMoving == false && amICurrentPlayer == true)
{
        //ITEMS: Pick up
    if ( keyboard_check_pressed( ord("E") ) )
    {
        global.itemsOnThisTile = ds_list_create();
        global.tempThisPlayer = id;
        with (obj_item_parent)
        {
            if (instance_position(global.tempThisPlayer.x,global.tempThisPlayer.y,id))
            {
                ds_list_add(global.itemsOnThisTile,id);
            }
        }
        if (ds_list_size(global.itemsOnThisTile) > 0)
        {
            ds_list_sort(global.itemsOnThisTile,true);
            objectToCheckWith = ds_list_find_value(global.itemsOnThisTile,0);
            script_which_item_is_this(objectToCheckWith, object_index);
        }
        ds_list_destroy(global.itemsOnThisTile);
        global.tempThisPlayer = 0;     
    }
    //ITEMS: Drop Weapon
    if ( keyboard_check_pressed( ord("F") ) )
    {
        oldWeapon = id.inventorySlotWeapon;
        if (is_string(oldWeapon))
        {
            oldWeaponObject = ds_map_find_value(global.mapItemWeaponStats,oldWeapon)
            itemId = instance_create(x,y,oldWeaponObject);
            with (global.equippedWeaponId) instance_destroy();
            global.equippedWeaponId = 0;
            id.inventorySlotWeapon = 0;
            
        }
                        
    }
    
    //ITEMS: Drop Armour
    if ( keyboard_check_pressed( ord("G") ) )
    {
        oldArmour = id.inventorySlotArmour;
        if (is_string(oldArmour))
        {
            oldArmourObject = ds_map_find_value(global.mapItemArmourStats,oldArmour)
            itemId = instance_create(x,y,oldArmourObject);
            with (global.equippedArmourId) instance_destroy();
            global.equippedArmourId = 0;
            id.inventorySlotArmour = 0;
            
        }
    }
}
