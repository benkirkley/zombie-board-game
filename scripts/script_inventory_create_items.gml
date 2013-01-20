/***************************************************
  This script adds the items equipped by the active
  player into the inventory window
 ***************************************************/

 //Get the current player's ID
playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
currentPlayerId = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".playerId");

//If the player has an item equipped, show it

global.equippedWeapon = ds_map_find_value(global.mapItemWeaponStats, currentPlayerId.inventorySlotWeapon);
if (global.equippedWeapon)
{
    global.equippedWeaponId = instance_create(20+16,10+16,global.equippedWeapon);
    global.equippedWeaponId.image_xscale = global.equippedWeaponId.image_xscale * 0.5
    global.equippedWeaponId.image_yscale = global.equippedWeaponId.image_yscale * 0.5
}

global.equippedArmour = ds_map_find_value(global.mapItemArmourStats, currentPlayerId.inventorySlotArmour);
if (global.equippedArmour)
{
    global.equippedArmourId = instance_create(64+16,10+16,global.equippedArmour);
    global.equippedArmourId.image_xscale = global.equippedArmourId.image_xscale * 0.5
    global.equippedArmourId.image_yscale = global.equippedArmourId.image_yscale * 0.5
}
