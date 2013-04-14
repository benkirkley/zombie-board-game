global.newRoom = true;

playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);

totalPlayers = ds_grid_get(global.teamGrids, 3, global.currentTeam);
for (i=0; i < totalPlayers; i+=1)
{
    //show_message(ds_map_find_value(playerDataMap, string(i) + ".name"));
    if ( ds_map_find_value(playerDataMap, string(i) + ".has_spawned") == true )
    {
        if ( ds_map_find_value(playerDataMap, string(i) + ".is_alive") == true )
        {
            playerId = ds_map_find_value(playerDataMap,string(i)+".playerId");
            
            script_save_char_api(i, ".playerId", playerId);
            script_save_char_api(i, ".name", playerId.name);
            script_save_char_api(i, ".characterName", playerId.characterName);
            script_save_char_api(i, ".attack", playerId.attack);
            script_save_char_api(i, ".dicePool", playerId.dicePool);
            script_save_char_api(i, ".defense", playerId.defense);
            script_save_char_api(i, ".totalHitPoints", playerId.totalHitPoints);
            script_save_char_api(i, ".hitPoints", playerId.hitPoints);
            script_save_char_api(i, ".totalActionPoints", playerId.totalActionPoints);
            script_save_char_api(i, ".damage", playerId.damage);
            script_save_char_api(i, ".totalNumberOfAttacks", playerId.totalNumberOfAttacks);
            script_save_char_api(i, ".moveSpeed", playerId.moveSpeed);
            script_save_char_api(i, ".is_alive", playerId.is_alive);
            script_save_char_api(i, ".inventorySlotWeapon", playerId.inventorySlotWeapon);
            script_save_char_api(i, ".inventorySlotArmour", playerId.inventorySlotArmour);
        }
    }

}
totalRedPlayers = ds_grid_get(global.teamGrids, 3, 1);
global.numberOfRedPlayersToCarryOver = totalRedPlayers - global.numberOfRedPlayersKilled;
