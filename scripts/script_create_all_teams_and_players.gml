//DEFAULT VALUES
global.numberOfTeams = 2;
numberOfBluePlayers = 1;
//numberOfRedPlayers = 9;

global.currentTeam = 0;
global.currentPlayer = 0;
global.numberOfRedPlayersKilled = 0;

//Debug
//var blueStartingWeapon = "";
//var blueStartingArmour = "";

//INI file -- read existing or create using defaults
ini_open("config.ini");
    numberOfBluePlayers = script_ini_read_key("Start","number_of_blue_players", numberOfBluePlayers,"real");
    //numberOfRedPlayers = script_ini_read_key("Start","number_of_red_players", numberOfRedPlayers,"real");
    //blueStartingWeapon = script_ini_read_key("Start","blue_player_starting_weapon", blueStartingWeapon,"string");
    //blueStartingArmour = script_ini_read_key("Start","blue_player_starting_armour", blueStartingArmour,"string");
ini_close();

//Define variables
global.totalPlayers = 0;
//global.numberOfTeams = 2;

//numberOfBluePlayers = 1;
playerBlueDataMap = ds_map_create();
ds_map_add(playerBlueDataMap,".numberOfPlayersOnTeam",0);

//numberOfRedPlayers = 9;
playerRedDataMap = ds_map_create();
ds_map_add(playerRedDataMap,".numberOfPlayersOnTeam",0);

//SCRIPT: create the spawn points where players will appear
if (global.roomTile == "dining")
{
    script_create_spawn_points_room_dining();
}
else if (global.roomTile == "garage")
{
    script_create_spawn_points_room_garage();
}
else if (global.roomTile == "bedroom_1")
{
    script_create_spawn_points_room_bedroom_1();
}
else if (global.roomTile == "bedroom_2")
{
    script_create_spawn_points_room_bedroom_2();
}
else if (global.roomTile == "corridor_1")
{
    script_create_spawn_points_room_corridor_1();
}
else if (global.roomTile == "corridor_2")
{
    script_create_spawn_points_room_corridor_2();
}
else if (global.roomTile == "kitchen")
{
    script_create_spawn_points_room_kitchen();
}
else if (global.roomTile == "driveway")
{
    script_create_spawn_points_room_driveway();
}

if (global.numberOfRedPlayersToCarryOver)
{
    numberOfRedPlayers += global.numberOfRedPlayersToCarryOver;
    global.numberOfRedPlayersToCarryOver = 0;
}
//Put all player grids into container grid
//GRID: |table_id|teams_grid|team_name|team_player_count|
global.teamGrids = ds_grid_create(7,global.numberOfTeams);
ds_grid_set(global.teamGrids, 0, 0, 0);
ds_grid_set(global.teamGrids, 1, 0, 0); //DEFUNCT -- delete me soon
ds_grid_set(global.teamGrids, 2, 0, "Blue");
ds_grid_set(global.teamGrids, 3, 0, numberOfBluePlayers);
ds_grid_set(global.teamGrids, 4, 0, obj_player_blue);
ds_grid_set(global.teamGrids, 5, 0, blueSpawnZones);
ds_grid_set(global.teamGrids, 6, 0, playerBlueDataMap);
ds_grid_set(global.teamGrids, 0, 1, 1);
ds_grid_set(global.teamGrids, 1, 1, 0); //DEFUNCT -- delete me soon
ds_grid_set(global.teamGrids, 2, 1, "Red");
ds_grid_set(global.teamGrids, 3, 1, numberOfRedPlayers);
ds_grid_set(global.teamGrids, 4, 1, obj_player_red);
ds_grid_set(global.teamGrids, 5, 1, redSpawnZones);
ds_grid_set(global.teamGrids, 6, 1, playerRedDataMap);

//SCRIPT: spawn first team

    
script_create_spawn_team(0);
script_create_spawn_team(1);

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
