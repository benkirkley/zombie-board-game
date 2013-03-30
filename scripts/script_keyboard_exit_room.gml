if (isMoving == false && amICurrentPlayer == true)
{
    if ( keyboard_check_pressed( ord("M") ) )
    {
        var isOnNextRoomTile = place_meeting(x,y,obj_zone_exit);
        var isOnPrevRoomTile = place_meeting(x,y,obj_zone_exit_prev);
        
        isOnNextRoomTile = true;
        if (( isOnNextRoomTile ||  isOnPrevRoomTile ) && (actionPoints == totalActionPoints) )
        {
            global.newRoom = true;
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
}
