itemType = argument0
itemString = argument1;
currentPlayerId = argument2;

if (itemType == "weapon")
{
    currentPlayerId.equippedWeaponName = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_name");
    currentPlayerId.equippedWeaponAttack = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_attack");
    currentPlayerId.equippedWeaponDicePool = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_dicePool");
    currentPlayerId.equippedWeaponTotalHitPoints = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_totalHitPoints");
    currentPlayerId.equippedWeaponTotalActionPoints = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_totalActionPoints");
    currentPlayerId.equippedWeaponDamage = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_damage");
    currentPlayerId.equippedWeaponTotalNumberOfAttacks = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_totalNumberOfAttacks");
    currentPlayerId.equippedWeaponString = itemString;
    
    currentPlayerId.inventorySlotWeapon =string(currentPlayerId.equippedWeaponString) + "_inventory";
    
}
else if (itemType == "armour")
{
    currentPlayerId.equippedArmourName = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_name");
    currentPlayerId.equippedArmourAttack = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_attack");
    currentPlayerId.equippedArmourDicePool = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_dicePool");
    currentPlayerId.equippedArmourTotalHitPoints = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_totalHitPoints");
    currentPlayerId.equippedArmourTotalActionPoints = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_totalActionPoints");
    currentPlayerId.equippedArmourDamage = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_damage");
    currentPlayerId.equippedArmourTotalNumberOfAttacks = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_totalNumberOfAttacks");
    currentPlayerId.equippedArmourString = itemString;    

    currentPlayerId.inventorySlotArmour = string(currentPlayerId.equippedArmourString) + "_inventory";
}


