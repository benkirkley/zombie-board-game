//DEFAULT VALUES//

global.endTurn = false;
global.numberOfRedPlayersKilled = 0;
global.numberOfTeams = 0;
global.numberOfRedPlayersToCarryOver = 0;
global.numberOfBluePlayers = 0;

global.currentPlayer = 0;
global.currentTeam = 1;

global.debug = true;
global.debug_show_combat_rolls = false ;
global.debug_show_roll_for_chance_of_item_drop = false ;
global.debug_all_items_on_map = false;
global.debug_show_ai_path = false;

//INI file -- read existing or create using defaults
ini_open("config.ini");
    global.debug_show_combat_rolls = script_ini_read_key("Debug","debug_show_combat_rolls", global.debug_show_combat_rolls,"real");
    global.currentTeam = script_ini_read_key("Start","starting_team", global.currentTeam,"real");
    global.debug_show_roll_for_chance_of_item_drop = script_ini_read_key("Debug","debug_show_roll_for_chance_of_item_drop", global.debug_show_roll_for_chance_of_item_drop,"real");
    global.debug_all_items_on_map = script_ini_read_key("Debug","debug_all_items_on_map", global.debug_all_items_on_map,"real");
    global.debug_show_ai_path = script_ini_read_key("Debug","debug_show_ai_path", global.debug_show_ai_path,"real");
    global.numberOfBluePlayers = script_ini_read_key("Start","number_of_blue_players", global.numberOfBluePlayers,"real");
ini_close();

global.collidableObjects = ds_list_create();
ds_list_add(global.collidableObjects, obj_player_blue);
ds_list_add(global.collidableObjects, obj_player_red);
ds_list_add(global.collidableObjects, obj_wall_hidden);

global.savedPlayerData = ds_map_create();
global.numberOfTeams = 2;
global.teamGrids = ds_grid_create(7,global.numberOfTeams);

global.checked = 0;
global.showHealthBars = true;

global.spawnRedOnLoad = false;
global.newRoom = false;
global.previousRoom = room_0;
global.blueSpawnZoneId = 0;
global.turnCounter = 1;
global.redPlacedAddedToList = false;

global.specialPlayersMap = ds_map_create();
global.specialPlayersList = ds_list_create();
global.specialItemsMap = ds_map_create();
