//DEFAULT VALUES

dslist_ItemStats = ds_list_create();
ds_list_add(dslist_ItemStats,"name");
ds_list_add(dslist_ItemStats,"attack");
ds_list_add(dslist_ItemStats,"dicePool");
ds_list_add(dslist_ItemStats,"defense");
ds_list_add(dslist_ItemStats,"totalHitPoints");
ds_list_add(dslist_ItemStats,"totalActionPoints");
ds_list_add(dslist_ItemStats,"damage");
ds_list_add(dslist_ItemStats,"totalNumberOfAttacks");

//dslist_ItemAllWeapons = ds_list_create();
//ds_list_add(dslist_ItemAllWeapons,"Axe");
//dslist_ItemAllArmour = ds_list_create();

ini_open("config.ini");
script_global_items_blank_template("weapon","Axe","axe",dslist_ItemStats);
script_global_items_blank_template("weapon","Chainsaw","chainsaw",dslist_ItemStats);
script_global_items_blank_template("weapon","Kitchen Knife","knife_kitchen",dslist_ItemStats);
script_global_items_blank_template("weapon","Rapier","sword_rapier",dslist_ItemStats);

script_global_items_blank_template("armour","Riot Helmet","helmet_riot",dslist_ItemStats);
script_global_items_blank_template("armour","Riot Shield","shield_riot",dslist_ItemStats);
script_global_items_blank_template("armour","Riot Vest","chest_riot",dslist_ItemStats);
/*
//Weapons
    //Axe
    script_ini_read_key("Items","item_weapon_axe_name", "Axe","string");
    script_ini_read_key("Items","item_weapon_axe_attack", 0,real);
    script_ini_read_key("Items","item_weapon_axe_dicePool", 0,real);
    script_ini_read_key("Items","item_weapon_axe_defense", 0,real);
    script_ini_read_key("Items","item_weapon_axe_totalHitPoints", 0,real);
    script_ini_read_key("Items","item_weapon_axe_totalActionPoints", 0,real);
    script_ini_read_key("Items","item_weapon_axe_damage", 2,real);
    script_ini_read_key("Items","item_weapon_axe_totalNumberOfAttacks", 0,real);
    
    //Chainsaw
    script_ini_read_key("Items","item_weapon_chainsaw_name", "Chainsaw","string");
    script_ini_read_key("Items","item_weapon_chainsaw_attack", 0,real);
    script_ini_read_key("Items","item_weapon_chainsaw_dicePool", 1,real);
    script_ini_read_key("Items","item_weapon_chainsaw_defense", 0,real);
    script_ini_read_key("Items","item_weapon_chainsaw_totalHitPoints", 0,real);
    script_ini_read_key("Items","item_weapon_chainsaw_totalActionPoints", 0,real);
    script_ini_read_key("Items","item_weapon_chainsaw_damage", 0,real);
    script_ini_read_key("Items","item_weapon_chainsaw_totalNumberOfAttacks", 0,real);
*/
ini_close();

itemWeaponAxeName = "Axe";
itemWeaponAxeDamage = 2;

itemWeaponKnifeKitchenName = "Kitchen Knife";
itemWeaponKnifeKitchenDamage = 1;

itemWeaponSwordRapierName = "Rapier";
itemWeaponSwordRapiernumberOfAttacks = 1;

itemWeaponChainsawName = "Chainsaw";
itemWeaponChainsawDicePool = 1;

itemArmourHelmetRiotName = "Riot Helmet";
itemArmourHelmetRiotDefense = 1;

itemArmourShieldRiotName = "Riot Shield";
itemArmourShieldRiotDefense = 2;
itemArmourShieldRiotActionPoints = -1;


ini_open("config.ini");
/*
    for (i=0; i<ds_list_size(dslist_ItemStats); i+=1)
    {
        itemStat = ds_list_find_value(dslist_ItemStats, i);
        //script_global_items_stats(itemStat,"name","Axe","item_weapon_axe_name","string");
        
        if (itemStat = "name")
        {
            itemWeaponAxeName = "Axe";
            itemWeaponAxeName = script_ini_read_key("Items","item_weapon_axe_name", itemWeaponAxeName,"string");
        } 
        else if (itemStat = "damage")
        {
            itemWeaponAxeDamage = 2;
            itemWeaponAxeDamage = script_ini_read_key("Items","item_weapon_axe_damage", itemWeaponAxeDamage,"real");
        } 
        else
        {
            script_ini_read_key("Items","item_weapon_axe_"+string(itemStat), 0,"real");
        }
            
    }
*/
    
    

ini_close();


//INI file -- read existing or create using defaults
//ini_open("config.ini");
    //global.debug_show_combat_rolls = script_ini_read_key("Debug","debug_show_combat_rolls", global.debug_show_combat_rolls,"real");
//ini_close();




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
ds_map_add(global.mapItemWeapon,"item.weapon.sword.rapier.totalNumberOfAttacks",itemWeaponSwordRapiernumberOfAttacks);
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






/*
attack = 0;
dicePool=2;
defense=5;
totalHitPoints=5;
totalActionPoints=4;
damage = 2;
totalNumberOfAttacks = 1;
*/
