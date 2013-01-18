/*
global.dslist_ItemStats = ds_list_create();
ds_list_add(dslist_ItemStats,"name");
ds_list_add(dslist_ItemStats,"attack");
ds_list_add(dslist_ItemStats,"dicePool");
ds_list_add(dslist_ItemStats,"defense");
ds_list_add(dslist_ItemStats,"totalHitPoints");
ds_list_add(dslist_ItemStats,"totalActionPoints");
ds_list_add(dslist_ItemStats,"damage");
ds_list_add(dslist_ItemStats,"totalNumberOfAttacks");
*/
//INI file -- read existing or create using defaults
ini_open("config.ini");

//Weapons
    //Axe
    itemWeaponAxeName = "Axe";
    itemWeaponAxeDamage = 2;
    script_ini_read_key("Items","item_weapon_axe_name", itemWeaponAxeName,"string");
    script_ini_read_key("Items","item_weapon_axe_attack", 0,"real");
    script_ini_read_key("Items","item_weapon_axe_dicePool", 0,"real");
    script_ini_read_key("Items","item_weapon_axe_defense", 0,"real");
    script_ini_read_key("Items","item_weapon_axe_totalHitPoints", 0,"real");
    script_ini_read_key("Items","item_weapon_axe_totalActionPoints", 0,"real");
    itemWeaponAxeDamage = script_ini_read_key("Items","item_weapon_axe_damage", itemWeaponAxeDamage,"real");
    script_ini_read_key("Items","item_weapon_axe_totalNumberOfAttacks", 0,"real");
    
    //Chainsaw
    itemWeaponChainsawName = "Chainsaw";
    itemWeaponChainsawDicePool = 1;
    script_ini_read_key("Items","item_weapon_chainsaw_name", itemWeaponChainsawName,"string");
    script_ini_read_key("Items","item_weapon_chainsaw_attack", 0,"real");
    itemWeaponChainsawDicePool = script_ini_read_key("Items","item_weapon_chainsaw_dicePool", itemWeaponChainsawDicePool,"real");
    script_ini_read_key("Items","item_weapon_chainsaw_defense", 0,"real");
    script_ini_read_key("Items","item_weapon_chainsaw_totalHitPoints", 0,"real");
    script_ini_read_key("Items","item_weapon_chainsaw_totalActionPoints", 0,"real");
    script_ini_read_key("Items","item_weapon_chainsaw_damage", 0,"real");
    script_ini_read_key("Items","item_weapon_chainsaw_totalNumberOfAttacks", 0,"real");
    
    //Kitchen Knife
    itemWeaponKnifeKitchenName = "Kitchen Knife";
    itemWeaponKnifeKitchenDamage = 1;
    script_ini_read_key("Items","item_weapon_knife_kitchen_name", itemWeaponKnifeKitchenName,"string");
    script_ini_read_key("Items","item_weapon_knife_kitchen_attack", 0,"real");
    script_ini_read_key("Items","item_weapon_knife_kitchen_dicePool", 0,"real");
    script_ini_read_key("Items","item_weapon_knife_kitchen_defense", 0,"real");
    script_ini_read_key("Items","item_weapon_knife_kitchen_totalHitPoints", 0,"real");
    script_ini_read_key("Items","item_weapon_knife_kitchen_totalActionPoints", 0,"real");
    itemWeaponKnifeKitchenDamage = script_ini_read_key("Items","item_weapon_knife_kitchen_damage", itemWeaponKnifeKitchenDamage,"real");
    script_ini_read_key("Items","item_weapon_knife_kitchen_totalNumberOfAttacks", 0,"real");
    
    //Rapier Sword
    itemWeaponSwordRapierName = "Rapier";
    itemWeaponSwordRapierNumberOfAttacks = 1;
    script_ini_read_key("Items","item_weapon_sword_rapier_name", itemWeaponSwordRapierName,"string");
    script_ini_read_key("Items","item_weapon_sword_rapier_attack", 0,"real");
    script_ini_read_key("Items","item_weapon_sword_rapier_dicePool", 0,"real");
    script_ini_read_key("Items","item_weapon_sword_rapier_defense", 0,"real");
    script_ini_read_key("Items","item_weapon_sword_rapier_totalHitPoints", 0,"real");
    script_ini_read_key("Items","item_weapon_sword_rapier_totalActionPoints", 0,"real");
    script_ini_read_key("Items","item_weapon_sword_rapier_damage", 0,"real");
    itemWeaponSwordRapierNumberOfAttacks = script_ini_read_key("Items","item_weapon_sword_rapier_totalNumberOfAttacks", itemWeaponSwordRapierNumberOfAttacks,"real");

//Armour
    //Riot Helmet
    itemArmourHelmetRiotName = "Riot Helmet";
    itemArmourHelmetRiotDefense = 1;
    script_ini_read_key("Items","item_armour_helmet_riot_name", itemArmourHelmetRiotName,"string");
    script_ini_read_key("Items","item_armour_helmet_riot_attack", 0,"real");
    script_ini_read_key("Items","item_armour_helmet_riot_dicePool", 0,"real");
    itemArmourHelmetRiotDefense = script_ini_read_key("Items","item_armour_helmet_riot_defense", itemArmourHelmetRiotDefense,"real");
    script_ini_read_key("Items","item_armour_helmet_riot_totalHitPoints", 0,"real");
    script_ini_read_key("Items","item_armour_helmet_riot_totalActionPoints", 0,"real");
    script_ini_read_key("Items","item_armour_helmet_riot_damage", 0,"real");
    script_ini_read_key("Items","item_armour_helmet_riot_totalNumberOfAttacks", 0,"real");
    
    //Riot Shield
    itemArmourShieldRiotName = "Riot Shield";
    itemArmourShieldRiotDefense = 2;
    itemArmourShieldRiotActionPoints = -1;
    script_ini_read_key("Items","item_armour_shield_riot_name", itemArmourShieldRiotName,"string");
    script_ini_read_key("Items","item_armour_shield_riot_attack", 0,"real");
    script_ini_read_key("Items","item_armour_shield_riot_dicePool", 0,"real");
    itemArmourShieldRiotDefense = script_ini_read_key("Items","item_armour_shield_riot_defense", itemArmourShieldRiotDefense,"real");
    script_ini_read_key("Items","item_armour_shield_riot_totalHitPoints", 0,"real");
    itemArmourShieldRiotActionPoints = script_ini_read_key("Items","item_armour_shield_riot_totalActionPoints", itemArmourShieldRiotActionPoints,"real");
    script_ini_read_key("Items","item_armour_shield_riot_damage", 0,"real");
    script_ini_read_key("Items","item_armour_shield_riot_totalNumberOfAttacks", 0,"real");
    
    //Riot Vest
    itemArmourChestRiotName = "Riot Vest";
    itemArmourChestRiotDefense = 2;
    itemArmourChestRiotTotalHitPoints = 1;
    script_ini_read_key("Items","item_armour_chest_riot_name", itemArmourChestRiotName,"string");
    script_ini_read_key("Items","item_armour_chest_riot_attack", 0,"real");
    script_ini_read_key("Items","item_armour_chest_riot_dicePool", 0,"real");
    itemArmourChestRiotDefense = script_ini_read_key("Items","item_armour_chest_riot_defense", itemArmourChestRiotDefense,"real");
    itemArmourChestRiotTotalHitPoints = script_ini_read_key("Items","item_armour_chest_riot_totalHitPoints", itemArmourChestRiotTotalHitPoints,"real");
    script_ini_read_key("Items","item_armour_chest_riot_totalActionPoints", 0,"real");
    script_ini_read_key("Items","item_armour_chest_riot_damage", 0,"real");
    script_ini_read_key("Items","item_armour_chest_riot_totalNumberOfAttacks", 0,"real");
    
ini_close();



    

//Add Weapons to the game
global.mapItemWeapon = ds_map_create();

////Axe
ds_map_add(global.mapItemWeapon,"item.weapon.axe.name",itemWeaponAxeName);
ds_map_add(global.mapItemWeapon,"item.weapon.axe.damage",itemWeaponAxeDamage);
//ds_map_add(global.mapItemWeapon,"item.weapon.axe.object",obj_item_weapon_axe);
ds_map_add(global.mapItemWeapon,"item.weapon.axe.inventory",obj_inventory_weapon_axe);

////Kitchen Knife
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.name",itemWeaponKnifeKitchenName);
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.damage",itemWeaponKnifeKitchenDamage);
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.inventory",obj_inventory_weapon_knife_kitchen);

////Sword
ds_map_add(global.mapItemWeapon,"item.weapon.sword.rapier.name",itemWeaponSwordRapierName);
ds_map_add(global.mapItemWeapon,"item.weapon.sword.rapier.totalNumberOfAttacks",itemWeaponSwordRapierNumberOfAttacks);
ds_map_add(global.mapItemWeapon,"item.weapon.sword.rapier.inventory",obj_inventory_weapon_sword_rapier);

////Chainsaw
ds_map_add(global.mapItemWeapon,"item.weapon.chainsaw.name",itemWeaponChainsawName);
ds_map_add(global.mapItemWeapon,"item.weapon.chainsaw.dicePool",itemWeaponChainsawDicePool);
ds_map_add(global.mapItemWeapon,"item.weapon.chainsaw.inventory",obj_inventory_weapon_chainsaw);


//Add Armour to the game
global.mapItemArmour = ds_map_create();

////Riot Helmet
ds_map_add(global.mapItemArmour,"item.armour.helmet.riot.name",itemArmourHelmetRiotName);
ds_map_add(global.mapItemArmour,"item.armour.helmet.riot.defense",itemArmourHelmetRiotDefense);
ds_map_add(global.mapItemArmour,"item.armour.helmet.riot.inventory",obj_inventory_armour_helmet_riot);

////Riot Shield
ds_map_add(global.mapItemArmour,"item.armour.shield.riot.name",itemArmourShieldRiotName);
ds_map_add(global.mapItemArmour,"item.armour.shield.riot.defense",itemArmourShieldRiotDefense);
ds_map_add(global.mapItemArmour,"item.armour.shield.riot.actionPoints",itemArmourShieldRiotActionPoints);
ds_map_add(global.mapItemArmour,"item.armour.shield.riot.inventory",obj_inventory_armour_shield_riot);



