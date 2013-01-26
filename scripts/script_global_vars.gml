//DEFAULT VALUES//

global.endTurn = false;
global.numberOfRedPlayersKilled = 0;

global.currentPlayer = 0;
global.currentTeam = 0;

global.debug = true;
global.debug_show_combat_rolls = false ;
global.debug_show_roll_for_chance_of_item_drop = false ;

//INI file -- read existing or create using defaults
ini_open("config.ini");
    global.debug_show_combat_rolls = script_ini_read_key("Debug","debug_show_combat_rolls", global.debug_show_combat_rolls,"real");
    global.currentTeam = script_ini_read_key("Start","starting_team", global.currentTeam,"real");
    global.debug_show_roll_for_chance_of_item_drop = script_ini_read_key("Debug","debug_show_roll_for_chance_of_item_drop", global.debug_show_roll_for_chance_of_item_drop,"real");
ini_close();

global.collidableObjects = ds_list_create();
ds_list_add(global.collidableObjects, obj_player_blue);
ds_list_add(global.collidableObjects, obj_player_red);
ds_list_add(global.collidableObjects, obj_wall_hidden);
