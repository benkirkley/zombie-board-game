/***************************************************
  This script creates all of the items that can be
  used in the game. It read from or creates and INI 
  file and sets up all of the data structures.
 ***************************************************/

//Setup all Data Structures
    //This lists all the possible stats an item can have
    
    global.mapAllItemStats = ds_map_create();
    ds_map_add(global.mapAllItemStats,"name","Name");
    ds_map_add(global.mapAllItemStats,"attack","Attack Dice");
    ds_map_add(global.mapAllItemStats,"damage","Damage");
    ds_map_add(global.mapAllItemStats,"defense","Defense");
    ds_map_add(global.mapAllItemStats,"dicePool","Dice Pool");
    ds_map_add(global.mapAllItemStats,"totalHitPoints","Max Hit Points");
    ds_map_add(global.mapAllItemStats,"totalActionPoints","Max Action Points");
    ds_map_add(global.mapAllItemStats,"totalNumberOfAttacks","Max Attacks");
    ds_map_add(global.mapAllItemStats,"healPoints","HP Heal");
    
    
    //List: item categories
    global.dslist_ItemTypes = ds_list_create();
    ds_list_add(global.dslist_ItemTypes,"weapon");
    ds_list_add(global.dslist_ItemTypes,"armour");
    ds_list_add(global.dslist_ItemTypes,"consumable");
    
    //List: all item objects
    global.dslist_AllItemObjects = ds_list_create();
    ds_list_add(global.dslist_AllItemObjects,obj_item_weapon_axe);
    ds_list_add(global.dslist_AllItemObjects,obj_item_weapon_chainsaw);
    ds_list_add(global.dslist_AllItemObjects,obj_item_weapon_knife_kitchen);
    ds_list_add(global.dslist_AllItemObjects,obj_item_weapon_sword_rapier);
    ds_list_add(global.dslist_AllItemObjects,obj_item_armour_helmet_riot);
    ds_list_add(global.dslist_AllItemObjects,obj_item_armour_chest_riot);
    ds_list_add(global.dslist_AllItemObjects,obj_item_armour_shield_riot);
    ds_list_add(global.dslist_AllItemObjects,obj_item_consumable_medkit);
    
    //Map: all item objects with type
    global.mapAllItemObjects = ds_grid_create(2,8);
    ds_grid_add(global.mapAllItemObjects, 0, 0, "weapon");
    ds_grid_add(global.mapAllItemObjects, 1, 0, obj_item_weapon_axe);
    ds_grid_add(global.mapAllItemObjects, 0, 1, "weapon");
    ds_grid_add(global.mapAllItemObjects, 1, 1, obj_item_weapon_chainsaw);
    ds_grid_add(global.mapAllItemObjects, 0, 2, "weapon");
    ds_grid_add(global.mapAllItemObjects, 1, 2, obj_item_weapon_knife_kitchen);
    ds_grid_add(global.mapAllItemObjects, 0, 3, "weapon");
    ds_grid_add(global.mapAllItemObjects, 1, 3, obj_item_weapon_sword_rapier);
    ds_grid_add(global.mapAllItemObjects, 0, 4, "armour");
    ds_grid_add(global.mapAllItemObjects, 1, 4, obj_item_armour_helmet_riot);
    ds_grid_add(global.mapAllItemObjects, 0, 5, "armour");
    ds_grid_add(global.mapAllItemObjects, 1, 5, obj_item_armour_chest_riot);
    ds_grid_add(global.mapAllItemObjects, 0, 6, "armour");
    ds_grid_add(global.mapAllItemObjects, 1, 6, obj_item_armour_shield_riot);
    ds_grid_add(global.mapAllItemObjects, 0, 7, "consumable");
    ds_grid_add(global.mapAllItemObjects, 1, 7, obj_item_consumable_medkit);
    
    
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
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_item_weapon_axe);
    
    
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
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_item_weapon_chainsaw);
    
    
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
    ds_map_add(global.mapItemWeaponStats,obj_item_weapon_knife_kitchen,string(itemString));
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_item_weapon_knife_kitchen);
    
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
    ds_map_add(global.mapItemWeaponStats,obj_item_weapon_sword_rapier,string(itemString));
    ds_map_add(global.mapItemWeaponStats,string(itemString)+"_inventory",obj_item_weapon_sword_rapier);

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
    
    script_items_create(global.mapItemArmourStats);
    ds_map_add(global.mapItemArmourStats,obj_item_armour_helmet_riot,string(itemString));
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_item_armour_helmet_riot);
    
    //Riot Shield
    itemName = "Riot Shield";
    itemAttack = 0;
    itemDamage = 0;
    itemDefense = 3;
    itemDicePool = 0;
    itemTotalHitPoints = 0;
    itemTotalActionPoints = -1;
    itemTotalNumberOfAttacks = 0;
    
    itemString = "item_armour_shield_riot";
    ds_list_add(global.dslist_AllArmourStrings,itemString);
    
    script_items_create(global.mapItemArmourStats);
    ds_map_add(global.mapItemArmourStats,obj_item_armour_shield_riot,string(itemString));
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_item_armour_shield_riot);
    
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
    ds_map_add(global.mapItemArmourStats,obj_item_armour_chest_riot,string(itemString));
    ds_map_add(global.mapItemArmourStats,string(itemString)+"_inventory",obj_item_armour_chest_riot);
    
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
    ds_map_add(global.mapItemConsumableStats,obj_item_consumable_medkit,string(itemString));
    
ini_close();




