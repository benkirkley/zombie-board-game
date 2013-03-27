/*
   When not moving, check to see if a direction key is held.
   If so, assign x/y speed and change status to moving.
*/
if (isMoving == false && amICurrentPlayer == true)
{   
    //DEBUG:  use numpad 5 to being up a debug dialog
    
    if ( keyboard_check_pressed( vk_numpad5 ) )
    {
        //DEBUG HERE
        //show_message(id);
    }
    
    if ( keyboard_check_pressed( vk_enter ) )
    {
        global.endTurn = true;
    }
    
    if ( keyboard_check_pressed( ord("M") ) )
    {
        var isOnNextRoomTile = place_meeting(x,y,obj_zone_exit);
        var isOnPrevRoomTile = place_meeting(x,y,obj_zone_exit_prev);
        
        if ( isOnNextRoomTile ||  isOnPrevRoomTile )
        {
            //TODO: Add loop to save all alive blue players
            //Store player id
            if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".playerId") )
            {
                ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".playerId",id);
            }
            else
            {
                ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".playerId",id);
            }
            //Store player name
            if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".name") )
            {
                ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".name",name);
            }
            else
            {
                ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".name",name);
            }
            //Store player hit points
            if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".hitPoints") )
            {
                ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".hitPoints",hitPoints);
            }
            else
            {
                ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".hitPoints",hitPoints);
            }
            //Store weapon equipped
            if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".inventory_weapon_1") )
            {
                ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".inventory_weapon_1",inventorySlotWeapon);
            }
            else
            {
                ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".inventory_weapon_1",inventorySlotWeapon);
            }
            //Store armour equipped
            if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".inventory_armour_1") )
            {
                ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".inventory_armour_1",inventorySlotArmour);
            }
            else
            {
                ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".inventory_armour_1",inventorySlotArmour);
            }
            
            totalRedPlayers = ds_grid_get(global.teamGrids, 3, 1);
            global.numberOfRedPlayersToCarryOver = totalRedPlayers - global.numberOfRedPlayersKilled;
            
            if (isOnPrevRoomTile) room_goto_previous();
            if (isOnNextRoomTile) room_goto_next();
        }
    }
    
    //ITEMS: Pick up
    if ( keyboard_check_pressed( ord("E") ) )
    {
        /*
        var thisObject = object_get_name(self.object_index);         
        finalX = x;
        finalY = y;
        /*
        //Check if player is colliding with an item
        for (i=0; i < ds_list_size(global.dslist_AllItemObjects); i += 1)
        {   
            collidableObjects = ds_list_find_value(global.dslist_AllItemObjects,i);
            collide = script_collision_perform(collidableObjects,self.object_index);
            if ( collide )
            {
                //show_message("Collision");
                return false;
            }
        }
        */
        global.itemsOnThisTile = ds_list_create();
        global.tempThisPlayer = id;
        with (obj_item_parent)
        {
            if (instance_position(global.tempThisPlayer.x,global.tempThisPlayer.y,id))
            {
                ds_list_add(global.itemsOnThisTile,id);
                //show_message(string(object_get_name(object_index))+": " +string(id)) ;
            }
        }
        if (ds_list_size(global.itemsOnThisTile) > 0)
        {
            ds_list_sort(global.itemsOnThisTile,true);
            //objectToCheckWith = (ds_list_find_value(global.itemsOnThisTile,0).object_index);
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
    
    
    if (currentPlayerId == self.id && ( (actionPoints + equippedWeaponActionPoints + equippedArmourActionPoints) > 0 || (numberOfAttacks  + equippedWeaponNumberOfAttacks + equippedArmourNumberOfAttacks) > 0) )
    {
        //Arrow Keys and Numpad Keys
        if ( keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_numpad6) )
        {   
            angle = 270;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = 0;
        }
    
        if ( keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_numpad8) )
        {
            angle = 0;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = -moveSpeed;
        }
    
        if ((keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_numpad4)) )
        {
            angle = 90;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = 0;
        }
    
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_numpad2) )
        {
            angle = 180;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = moveSpeed;
        }
        
        //Diagonal Numpad Keys
        if ( keyboard_check_pressed(vk_numpad1) )
        {
            angle = 135;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad3) )
        {
            angle = 225;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad7) )
        {
            angle = 45;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = -moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad9) )
        {
            angle = 315;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = -moveSpeed;
        }
    }
}

/*
   When moving, subtract from moveTimer our moveSpeed value
   and update location relevant to set speeds.
   Stop moving when moveTimer reaches zero.
*/
/*
//if ( isMoving == true || (isMoving == false && moveTimer >= 0 && moveTimer < gridSize ) )
if ( isMoving == true )
{
    //Check if final resting position is occupied
    if (moveTimer == gridSize)
    {
        if (speedX != 0 ){
            finalX = x + ( (gridSize/moveSpeed) * speedX );
        } else {
            finalX = x;
        }
        
        if (speedY != 0 ){
            finalY = y + ( (gridSize/moveSpeed) * speedY );
        } else {
            finalY = y;
        }
        
        var thisObject = object_get_name(self.object_index); 
       
        for (i=0; i < ds_list_size(global.collidableObjects); i+=1)
        {   
            collide = script_collision_perform( ds_list_find_value(global.collidableObjects,i), self.object_index);
            if ( collide )
            {
                //show_message("Collision");
                return false;
            }
        }
    }
    //Move if no collision and player has moves
    if ( !collide && (actionPoints + equippedWeaponActionPoints + equippedArmourActionPoints) > 0 )
    {
        direction = angle;
        image_angle = angle;
        x += speedX;
        y += speedY;
        moveTimer -= moveSpeed;
        image_speed=1;
        script_stats_window_destroy();
                
        if (moveTimer == 0)
        {
            image_speed=0;
            image_index += 1;
            isMoving = false;
            if (equippedWeaponActionPoints > 0)
            {
                equippedWeaponActionPoints -= 1;
            }
            else if (equippedArmourActionPoints > 0)
            {
                equippedArmourActionPoints -= 1;
            }
            else
            {
                actionPoints -=1 ;
            }
            collide = 1;
        }
    }
    else
    {
        isMoving = false;
    }
}
*/
