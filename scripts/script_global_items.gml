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
    ds_list_add(global.dslist_ItemStats,"damage");
    ds_list_add(global.dslist_ItemStats,"defense");
    ds_list_add(global.dslist_ItemStats,"dicePool");
    ds_list_add(global.dslist_ItemStats,"hitPoints");
    ds_list_add(global.dslist_ItemStats,"totalHitPoints");
    ds_list_add(global.dslist_ItemStats,"actionPoints");
    ds_list_add(global.dslist_ItemStats,"totalActionPoints");
    ds_list_add(global.dslist_ItemStats,"numberOfAttacks");
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
    itemAttack = 1;
    itemDamage = 0;
    itemDefense = 0;
    itemDicePool = 0;
    itemTotalHitPoints = 0;
    itemTotalActionPoints = 0;
    itemTotalNumberOfAttacks = 0;
    itemString = "item_weapon_axe";
    ds_list_add(global.dslist_AllWeaponStrings,itemString);
    
    script_items_create(global.mapItemWeaponStats);
    
    ds_map_add(global.mapItemWeaponStats,obj_item_weapon_axe,string(itemString));
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_inventory_weapon_axe);
    
    
    //Chainsaw
    itemName = "Chainsaw";
    itemAttack = 0;
    itemDamage = 0;
    itemDefense = 0;
    itemDicePool = 1;
    itemTotalHitPoints = 0;
    itemTotalActionPoints = 0;
    itemTotalNumberOfAttacks = 0;
    itemString = "item_weapon_chainsaw";
    ds_list_add(global.dslist_AllWeaponStrings,itemString);
    
    script_items_create(global.mapItemWeaponStats);
    
    ds_map_add(global.mapItemWeaponStats,obj_item_weapon_chainsaw,string(itemString));
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_inventory_weapon_chainsaw);
    
    
    //Kitchen Knife
    itemName = "Kitchen Knife";   
    itemAttack = 0;
    itemDamage = 1;
    itemDefense = 0;
    itemDicePool = 0;
    itemTotalHitPoints = 0;
    itemTotalActionPoints = 0;
    itemTotalNumberOfAttacks = 0;
    
    itemString = "item_weapon_knife_kitchen";
    ds_list_add(global.dslist_AllWeaponStrings,itemString);
    
    script_items_create(global.mapItemWeaponStats);
    
    ds_map_add(global.mapItemWeaponStats,string(itemString),obj_item_weapon_knife_kitchen);
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_inventory_weapon_knife_kitchen);
    
    //Rapier Sword
    itemName = "Rapier";
    itemAttack = 0;
    itemDamage = 0;
    itemDefense = 0;
    itemDicePool = 0;
    itemTotalHitPoints = 0;
    itemTotalActionPoints = 0;
    itemTotalNumberOfAttacks = 1;
    
    itemString = "item_weapon_sword_rapier";
    ds_list_add(global.dslist_AllWeaponStrings,itemString);
    
    script_items_create(global.mapItemWeaponStats);
    
    ds_map_add(global.mapItemWeaponStats,string(itemString),obj_item_weapon_sword_rapier);
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_inventory_weapon_sword_rapier);

//Armour
    //Riot Helmet
    itemName = "Riot Helmet";
    itemAttack = 0;
    itemDamage = 0;
    itemDefense = 1;
    itemDicePool = 0;
    itemTotalHitPoints = 0;
    itemTotalActionPoints = 0;
    itemTotalNumberOfAttacks = 0;
    
    itemString = "item_armour_helmet_riot";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    
    itemName = script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    itemAttack = script_ini_read_key("Items",string(itemString)+"_attack", itemAttack,"real");
    itemDicePool = script_ini_read_key("Items",string(itemString)+"_dicePool", itemDicePool,"real");
    itemDefense = script_ini_read_key("Items",string(itemString)+"_defense", itemDefense,"real");
    itemTotalHitPoints = script_ini_read_key("Items",string(itemString)+"_totalHitPoints", itemTotalHitPoints,"real");
    itemTotalActionPoints = script_ini_read_key("Items",string(itemString)+"_totalActionPoints", itemTotalActionPoints,"real");
    itemDamage = script_ini_read_key("Items",string(itemString)+"_damage", itemDamage,"real");
    itemTotalNumberOfAttacks = script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", itemTotalNumberOfAttacks,"real");
    
    script_items_create(global.mapItemArmourStats);
    
    ds_map_add(global.mapItemArmourStats,string(itemString),obj_item_armour_helmet_riot);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_inventory_armour_helmet_riot);
    
    //Riot Shield
    itemName = "Riot Shield";
    itemAttack = 0;
    itemDamage = 0;
    itemDefense = 2;
    itemDicePool = 0;
    itemTotalHitPoints = 0;
    itemTotalActionPoints = -1;
    itemTotalNumberOfAttacks = 0;
    
    itemString = "item_armour_shield_riot";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    
    script_items_create(global.mapItemArmourStats);
    
    ds_map_add(global.mapItemArmourStats,string(itemString),obj_item_armour_shield_riot);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_inventory_armour_shield_riot);
    
    //Riot Vest
    itemName = "Riot Vest";
    itemAttack = 0;
    itemDamage = 0;
    itemDefense = 1;
    itemDicePool = 0;
    itemTotalHitPoints = 1;
    itemTotalActionPoints = 0;
    itemTotalNumberOfAttacks = 0;
    
    itemString = "item_armour_chest_riot";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    
    script_items_create(global.mapItemArmourStats);
    
    ds_map_add(global.mapItemArmourStats,string(itemString),obj_item_armour_chest_riot);
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_inventory_armour_chest_riot);
    
//Consumables
    //Medkit
    itemName = "Medkit";
    itemHealPoints = 5;
    itemString = "item_consumable_medkit";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    
    itemName = script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
    itemHealPoints = script_ini_read_key("Items",string(itemString)+"_healPoints", itemHealPoints,"real");
    
    ds_map_add(global.mapItemConsumableStats,string(itemString)+"_name",itemName);
    ds_map_add(global.mapItemConsumableStats,string(itemString)+"_healPoints",itemHealPoints);
    ds_map_add(global.mapItemConsumableStats,string(itemString),obj_item_consumable_medkit);
    
ini_close();




