//DEFAULT VALUES//

global.endTurn = false;
global.numberOfRedPlayersKilled = 0;

global.currentPlayer = 0;
global.currentTeam = 0;

global.debug = true;
global.debug_show_combat_rolls = false ;
global.debug_show_roll_for_chance_of_item_drop = false ;

//Add Weapons to the game
global.mapItemWeapon = ds_map_create();

////Axe
ds_map_add(global.mapItemWeapon,"item.weapon.axe.name","Axe");
ds_map_add(global.mapItemWeapon,"item.weapon.axe.damage",2);
//ds_map_add(global.mapItemWeapon,"item.weapon.axe.object",obj_item_weapon_axe);
ds_map_add(global.mapItemWeapon,"item.weapon.axe.inventory",obj_inventory_weapon_axe);

////Kitchen Knife
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.name","Kitchen Knife");
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.damage",1);
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.inventory",obj_inventory_weapon_knife_kitchen);

////Sword
ds_map_add(global.mapItemWeapon,"item.weapon.sword.rapier.name","Rapier");
ds_map_add(global.mapItemWeapon,"item.weapon.sword.rapier.totalNumberOfAttacks",1);
ds_map_add(global.mapItemWeapon,"item.weapon.sword.rapier.inventory",obj_inventory_weapon_sword_rapier);

////Chainsaw
ds_map_add(global.mapItemWeapon,"item.weapon.chainsaw.name","Chainsaw");
ds_map_add(global.mapItemWeapon,"item.weapon.chainsaw.dicePool",1);
ds_map_add(global.mapItemWeapon,"item.weapon.chainsaw.inventory",obj_inventory_weapon_chainsaw);


//Add Armour to the game
global.mapItemArmour = ds_map_create();

////Riot Helmet
ds_map_add(global.mapItemArmour,"item.armour.helmet.riot.name","Riot Helmet");
ds_map_add(global.mapItemArmour,"item.armour.helmet.riot.defense",1);
ds_map_add(global.mapItemArmour,"item.armour.helmet.riot.inventory",obj_inventory_armour_helmet_riot);

////Riot Shield
ds_map_add(global.mapItemArmour,"item.armour.shield.riot.name","Riot Shield");
ds_map_add(global.mapItemArmour,"item.armour.shield.riot.defense",2);
ds_map_add(global.mapItemArmour,"item.armour.shield.riot.actionPoints",-1);
ds_map_add(global.mapItemArmour,"item.armour.shield.riot.inventory",obj_inventory_armour_shield_riot);



//INI file -- read existing or create using defaults
ini_open("config.ini");
    global.debug_show_combat_rolls = script_ini_read_key("Debug","debug_show_combat_rolls", global.debug_show_combat_rolls,"real");
    global.currentTeam = script_ini_read_key("Start","starting_team", global.currentTeam,"real");
    global.debug_show_roll_for_chance_of_item_drop = script_ini_read_key("Debug","debug_show_roll_for_chance_of_item_drop", global.debug_show_roll_for_chance_of_item_drop,"real");
ini_close();









dicePool=2;
defense=5;
totalHitPoints=5;
totalActionPoints=4;
damage = 2;
totalNumberOfAttacks = 4;
