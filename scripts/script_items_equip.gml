itemType = argument0
itemString = argument1;
currentPlayerId = argument2;

if (itemType == "weapon")
{
    currentPlayerId.equippedWeaponName = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_name");
    currentPlayerId.equippedWeaponAttack = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_attack");
    currentPlayerId.equippedWeaponDefense = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_defense");
    currentPlayerId.equippedWeaponDicePool = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_dicePool");
    currentPlayerId.equippedWeaponDamage = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_damage");
    currentPlayerId.equippedWeaponTotalHitPoints = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_totalHitPoints");
    currentPlayerId.equippedWeaponHitPoints = currentPlayerId.equippedWeaponTotalHitPoints;
    currentPlayerId.equippedWeaponTotalActionPoints = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_totalActionPoints");
    currentPlayerId.equippedWeaponActionPoints = currentPlayerId.equippedWeaponTotalActionPoints;
    currentPlayerId.equippedWeaponTotalNumberOfAttacks = ds_map_find_value(global.mapItemWeaponStats,string(itemString)+"_totalNumberOfAttacks");
    currentPlayerId.equippedWeaponNumberOfAttacks = currentPlayerId.equippedWeaponTotalNumberOfAttacks;
    currentPlayerId.equippedWeaponString = itemString;
    
    currentPlayerId.inventorySlotWeapon =string(currentPlayerId.equippedWeaponString) + "_inventory";
    
}
else if (itemType == "armour")
{
    currentPlayerId.equippedArmourName = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_name");
    currentPlayerId.equippedArmourAttack = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_attack");
    currentPlayerId.equippedArmourDefense = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_defense");
    currentPlayerId.equippedArmourDicePool = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_dicePool");
    currentPlayerId.equippedArmourDamage = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_damage");
    currentPlayerId.equippedArmourTotalHitPoints = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_totalHitPoints");
    currentPlayerId.equippedArmourHitPoints = currentPlayerId.equippedArmourTotalHitPoints;
    currentPlayerId.equippedArmourTotalActionPoints = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_totalActionPoints");
    currentPlayerId.equippedArmourActionPoints = currentPlayerId.equippedArmourTotalActionPoints;
    currentPlayerId.equippedArmourTotalNumberOfAttacks = ds_map_find_value(global.mapItemArmourStats,string(itemString)+"_totalNumberOfAttacks");
    currentPlayerId.equippedArmourNumberOfAttacks = currentPlayerId.equippedArmourTotalNumberOfAttacks;
    currentPlayerId.equippedArmourString = itemString;    

    currentPlayerId.inventorySlotArmour = string(currentPlayerId.equippedArmourString) + "_inventory";
}


