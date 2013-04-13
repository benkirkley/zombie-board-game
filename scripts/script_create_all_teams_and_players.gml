
//show_message(global.blueSpawnZoneId);
//DEFAULT VALUES
global.numberOfTeams = 2;
global.numberOfBluePlayers = 1;

//global.currentTeam = 0;
global.currentPlayer = 0;
global.numberOfRedPlayersKilled = 0;

//INI file -- read existing or create using defaults
ini_open("config.ini");
    global.numberOfBluePlayers = script_ini_read_key("Start","number_of_blue_players", global.numberOfBluePlayers,"real");
    //blueStartingWeapon = script_ini_read_key("Start","blue_player_starting_weapon", blueStartingWeapon,"string");
    //blueStartingArmour = script_ini_read_key("Start","blue_player_starting_armour", blueStartingArmour,"string");
ini_close();

//Define variables
global.totalPlayers = 0;
//global.numberOfTeams = 2;

playerBlueDataMap = ds_map_create();
ds_map_add(playerBlueDataMap,".numberOfPlayersOnTeam",0);

playerRedDataMap = ds_map_create();
ds_map_add(playerRedDataMap,".numberOfPlayersOnTeam",0);

//SCRIPT: create the spawn points where players will appear

global.blueSpawnZones = ds_grid_create(3,0);
script_create_blue_spawn_points(obj_zone_exit_parent, global.blueSpawnZones);

global.redSpawnZones = ds_grid_create(3,0);
script_create_blue_spawn_points(obj_zone_red_spawn_parent, global.redSpawnZones);

//Carry over unkilled red players
if (global.numberOfRedPlayersToCarryOver)
{
    global.numberOfRedPlayers += global.numberOfRedPlayersToCarryOver;
    global.numberOfRedPlayersToCarryOver = 0;
}
//Put all player grids into container grid
//GRID: |table_id|teams_grid|team_name|team_player_count|
global.teamGrids = ds_grid_create(7,global.numberOfTeams);
ds_grid_set(global.teamGrids, 0, 0, 0);
ds_grid_set(global.teamGrids, 1, 0, 0); //DEFUNCT -- delete me soon
ds_grid_set(global.teamGrids, 2, 0, "Blue");
ds_grid_set(global.teamGrids, 3, 0, global.numberOfBluePlayers);
ds_grid_set(global.teamGrids, 4, 0, obj_player_blue);
ds_grid_set(global.teamGrids, 5, 0, global.blueSpawnZones);
ds_grid_set(global.teamGrids, 6, 0, playerBlueDataMap);
ds_grid_set(global.teamGrids, 0, 1, 1);
ds_grid_set(global.teamGrids, 1, 1, 0); //DEFUNCT -- delete me soon
ds_grid_set(global.teamGrids, 2, 1, "Red");
ds_grid_set(global.teamGrids, 3, 1, global.numberOfRedPlayers);
ds_grid_set(global.teamGrids, 4, 1, obj_player_red);
ds_grid_set(global.teamGrids, 5, 1, global.redSpawnZones);
ds_grid_set(global.teamGrids, 6, 1, playerRedDataMap);

//SCRIPT: spawn first team
script_create_spawn_team(0);
if (global.spawnRedOnLoad == true) script_create_spawn_team(1);

//Highlight the starting player
gridCurrentTeam = ds_grid_get(global.teamGrids, 6, global.currentTeam);
currentPlayerId = ds_map_find_value(playerBlueDataMap,string(global.currentPlayer)+".playerId");
//show_message(global.currentTeam);
playerHighlightId = instance_create(currentPlayerId.x,currentPlayerId.y,obj_player_highlight);

script_inventory_create_items();

//Debug
if (global.debug_all_items_on_map)
{
    var item_x=608;
    var item_y=160
    for (var j=0; j < ds_list_size(global.dslist_AllItemObjects); j +=1 )
    {
        var tempObj = ds_list_find_value(global.dslist_AllItemObjects, j);
        instance_create(item_x,item_y,tempObj);
        item_x -= 64;
        if (item_x <= 352) 
        {
            item_x = 608;
            item_y = 224;
        }
    }
}
