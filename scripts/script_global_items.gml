/***************************************************
  This script creates all of the items that can be
  used in the game. It read from or creates and INI 
  file and sets up all of the data structures.
 ***************************************************/

//Setup all Data Structures
    //This lists all the possible stats an item can have
    global.dslist_ItemStats = ds_list_create();
    ds_list_add(global.dslist_ItemStats,"name");
    ds_list_add(global.dslist_ItemStats,"attack");
    ds_list_add(global.dslist_ItemStats,"dicePool");
    ds_list_add(global.dslist_ItemStats,"defense");
    ds_list_add(global.dslist_ItemStats,"totalHitPoints");
    ds_list_add(global.dslist_ItemStats,"totalActionPoints");
    ds_list_add(global.dslist_ItemStats,"damage");
    ds_list_add(global.dslist_ItemStats,"totalNumberOfAttacks");
    
    //This lists the category of items available
    global.dslist_ItemTypes = ds_list_create();
    ds_list_add(global.dslist_ItemTypes,"weapon");
    ds_list_add(global.dslist_ItemTypes,"armour");
    ds_list_add(global.dslist_ItemTypes,"consumable");
    
    //Store a list of the items available to each category
    global.dslist_AllWeaponStrings = ds_list_create();
    global.dslist_AllArmourStrings = ds_list_create();
    global.dslist_AllConsumableStrings = ds_list_create();
    
    //Store the details of each item
    global.mapItemWeaponStats = ds_map_create();
    global.mapItemArmourStats = ds_map_create();
    global.mapItemConsumableStats = ds_map_create();
    
    //Reference item categories with their list of items
    global.mapItemTypeAndStatsMap = ds_map_create();
    ds_map_add(global.mapItemTypeAndStatsMap,0,global.mapItemWeaponStats);
    ds_map_add(global.mapItemTypeAndStatsMap,1,global.mapItemArmourStats);
    ds_map_add(global.mapItemTypeAndStatsMap,2,global.mapItemConsumableStats);

//INI file -- read existing or create using defaults
ini_open("config.ini");

//Weapons
    //Axe
    itemName = "Axe";
    itemDamage = 2;
    
    itemString = "item_weapon_axe";
    ds_list_add(global.dslist_AllWeaponStrings,itemString);
    
    script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    script_ini_read_key("Items",string(itemString)+"_attack", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_dicePool", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_defense", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalHitPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalActionPoints", 0,"real");
    itemDamage = script_ini_read_key("Items",string(itemString)+"_damage", itemDamage,"real");
    script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", 0,"real");
    
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_damage",itemDamage);
    ds_map_add(global.mapItemWeaponStats,obj_item_weapon_axe,string(itemString));
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_inventory_weapon_axe);
    
    
    //Chainsaw
    itemName = "Chainsaw";
    itemDicePool = 1;
    
    itemString = "item_weapon_chainsaw";
    ds_list_add(global.dslist_AllWeaponStrings,itemString);
    
    script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    script_ini_read_key("Items",string(itemString)+"_attack", 0,"real");
    itemDicePool = script_ini_read_key("Items",string(itemString)+"_dicePool", itemDicePool,"real");
    script_ini_read_key("Items",string(itemString)+"_defense", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalHitPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalActionPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_damage", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", 0,"real");
    
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_dicePool",itemDicePool);
    ds_map_add(global.mapItemWeaponStats,obj_item_weapon_chainsaw,string(itemString));
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_inventory_weapon_chainsaw);
    
    
    //Kitchen Knife
    itemName = "Kitchen Knife";
    itemDamage = 1;
    
    itemString = "item_weapon_knife_kitchen";
    ds_list_add(global.dslist_AllWeaponStrings,itemString);
    
    script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    script_ini_read_key("Items",string(itemString)+"_attack", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_dicePool", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_defense", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalHitPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalActionPoints", 0,"real");
    itemDamage = script_ini_read_key("Items",string(itemString)+"_damage", itemDamage,"real");
    script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", 0,"real");
    
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_damage",itemDamage);
    ds_map_add(global.mapItemWeaponStats,string(itemString),obj_item_weapon_knife_kitchen);
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_inventory_weapon_knife_kitchen);
    
    //Rapier Sword
    itemName = "Rapier";
    itemTotalNumberOfAttacks = 1;
    
    itemString = "item_weapon_sword_rapier";
    ds_list_add(global.dslist_AllWeaponStrings,itemString);
    
    script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    script_ini_read_key("Items",string(itemString)+"_attack", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_dicePool", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_defense", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalHitPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalActionPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_damage", 0,"real");
    itemTotalNumberOfAttacks = script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", itemTotalNumberOfAttacks,"real");
    
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_totalNumberOfAttacks",itemTotalNumberOfAttacks);
    ds_map_add(global.mapItemWeaponStats,string(itemString),obj_item_weapon_sword_rapier);
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_inventory_weapon_sword_rapier);

//Armour
    //Riot Helmet
    itemName = "Riot Helmet";
    itemDefense = 1;
    
    itemString = "item_armour_helmet_riot";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    
    script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    script_ini_read_key("Items",string(itemString)+"_attack", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_dicePool", 0,"real");
    itemDefense = script_ini_read_key("Items",string(itemString)+"_defense", itemDefense,"real");
    script_ini_read_key("Items",string(itemString)+"_totalHitPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalActionPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_damage", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", 0,"real");
    
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_defense",itemDefense);
    ds_map_add(global.mapItemArmourStats,string(itemString),obj_item_armour_helmet_riot);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_inventory_armour_helmet_riot);
    
    //Riot Shield
    itemName = "Riot Shield";
    itemDefense = 2;
    itemTotalActionPoints = -1;
    
    itemString = "item_armour_shield_riot";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    
    script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    script_ini_read_key("Items",string(itemString)+"_attack", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_dicePool", 0,"real");
    itemDefense = script_ini_read_key("Items","item_armour_shield_riot_defense", itemDefense,"real");
    script_ini_read_key("Items",string(itemString)+"_totalHitPoints", 0,"real");
    itemTotalActionPoints = script_ini_read_key("Items",string(itemString)+"_totalActionPoints", itemTotalActionPoints,"real");
    script_ini_read_key("Items",string(itemString)+"_damage", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", 0,"real");
    
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_defense",itemDefense);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_actionPoints",itemTotalActionPoints);
    ds_map_add(global.mapItemArmourStats,string(itemString),obj_item_armour_shield_riot);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_inventory_armour_shield_riot);
    
    //Riot Vest
    itemName = "Riot Vest";
    itemDefense = 1;
    itemTotalHitPoints = 1;
    
    itemString = "item_armour_chest_riot";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    
    script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    script_ini_read_key("Items",string(itemString)+"_attack", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_dicePool", 0,"real");
    itemDefense = script_ini_read_key("Items",string(itemString)+"_defense", itemDefense,"real");
    itemTotalHitPoints = script_ini_read_key("Items",string(itemString)+"_totalHitPoints", itemTotalHitPoints,"real");
    script_ini_read_key("Items",string(itemString)+"_totalActionPoints", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_damage", 0,"real");
    script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", 0,"real");
    
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_defense",itemDefense);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_defense",itemTotalHitPoints);
    ds_map_add(global.mapItemArmourStats,string(itemString),obj_item_armour_chest_riot);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_inventory_armour_chest_riot);
    
//Consumables
    //Medkit
    itemName = "Medkit";
    itemHealPoints = 5;
    //itemTotalUses = 1;
    
    itemString = "item_consumable_medkit";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    script_ini_read_key("Items",string(itemString)+"_healPoints", itemHealPoints,"real");
    //script_ini_read_key("Items",string(itemString)+"_totalUses", itemTotalUses,"real");
    
    ds_map_add(global.mapItemConsumableStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemConsumableStats,string(itemString)+"_healPoints",itemHealPoints);
    ds_map_add(global.mapItemConsumableStats,string(itemString),obj_item_armour_helmet_riot);
    ds_map_add(global.mapItemConsumableStats,string(itemString)+"_inventory",obj_item_consumable_medkit);
    
    
ini_close();




