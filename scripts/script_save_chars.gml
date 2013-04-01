global.newRoom = true;
//TODO: Add loop to save all alive blue players
//Store player id
playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
playerId = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".playerId");

if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".playerId") )
{
    ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".playerId",playerId);
}
else
{
    ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".playerId",playerId.id);
}
//Store player name
if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".name") )
{
    ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".name",playerId.name);
}
else
{
    ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".name",playerId.name);
}
//Store player hit points
if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".hitPoints") )
{
    ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".hitPoints",playerId.hitPoints);
}
else
{
    ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".hitPoints",playerId.hitPoints);
}
//Store weapon equipped
if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".inventory_weapon_1") )
{
    ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".inventory_weapon_1",playerId.inventorySlotWeapon);
}
else
{
    ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".inventory_weapon_1",playerId.inventorySlotWeapon);
}
//Store armour equipped
if ( ds_map_exists(global.savedPlayerData, string(global.currentPlayer)+".inventory_armour_1") )
{
    ds_map_replace(global.savedPlayerData, string(global.currentPlayer)+".inventory_armour_1",playerId.inventorySlotArmour);
}
else
{
    ds_map_add(global.savedPlayerData, string(global.currentPlayer)+".inventory_armour_1",playerId.inventorySlotArmour);
}

totalRedPlayers = ds_grid_get(global.teamGrids, 3, 1);
global.numberOfRedPlayersToCarryOver = totalRedPlayers - global.numberOfRedPlayersKilled;
