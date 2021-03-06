global.newRoom = true;
//TODO: Add loop to save all alive blue players
//Store player id
playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);

totalPlayers = ds_grid_get(global.teamGrids, 3, global.currentTeam);
for (i=0; i < totalPlayers; i+=1)
{
    playerId = ds_map_find_value(playerDataMap,string(i)+".playerId");
    if ( ds_map_exists(global.savedPlayerData, string(i)+".playerId") )
    {
        ds_map_replace(global.savedPlayerData, string(i)+".playerId",playerId);
    }
    else
    {
        ds_map_add(global.savedPlayerData, string(i)+".playerId",playerId.id);
    }
    //Store player name
    if ( ds_map_exists(global.savedPlayerData, string(i)+".name") )
    {
        ds_map_replace(global.savedPlayerData, string(i)+".name",playerId.name);
    }
    else
    {
        ds_map_add(global.savedPlayerData, string(i)+".name",playerId.name);
    }
    //Store player hit points
    if ( ds_map_exists(global.savedPlayerData, string(i)+".hitPoints") )
    {
        ds_map_replace(global.savedPlayerData, string(i)+".hitPoints",playerId.hitPoints);
    }
    else
    {
        ds_map_add(global.savedPlayerData, string(i)+".hitPoints",playerId.hitPoints);
    }
    //Store weapon equipped
    if ( ds_map_exists(global.savedPlayerData, string(i)+".inventory_weapon_1") )
    {
        ds_map_replace(global.savedPlayerData, string(i)+".inventory_weapon_1",playerId.inventorySlotWeapon);
    }
    else
    {
        ds_map_add(global.savedPlayerData, string(i)+".inventory_weapon_1",playerId.inventorySlotWeapon);
    }
    //Store armour equipped
    if ( ds_map_exists(global.savedPlayerData, string(i)+".inventory_armour_1") )
    {
        ds_map_replace(global.savedPlayerData, string(i)+".inventory_armour_1",playerId.inventorySlotArmour);
    }
    else
    {
        ds_map_add(global.savedPlayerData, string(i)+".inventory_armour_1",playerId.inventorySlotArmour);
    }

}
totalRedPlayers = ds_grid_get(global.teamGrids, 3, 1);
global.numberOfRedPlayersToCarryOver = totalRedPlayers - global.numberOfRedPlayersKilled;
