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
ds_map_add(global.mapItemWeapon,"item.weapon.axe.dicePool",2);
//ds_map_add(playerBlueDataMap,"item.weapon.axe.object",obj_item_weapon_axe);
ds_map_add(global.mapItemWeapon,"item.weapon.axe.inventory",obj_inventory_weapon_axe);

////Kitchen Knife
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.name","Kitchen Knife");
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.dicePool",2);
//ds_map_add(playerBlueDataMap,"item.weapon.axe.object",obj_item_weapon_axe);
ds_map_add(global.mapItemWeapon,"item.weapon.knife.kitchen.inventory",obj_inventory_weapon_knife_kitchen);





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
