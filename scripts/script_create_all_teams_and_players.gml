//Define variables
global.totalPlayers = 0;
global.numberOfTeams = 2;

numberOfBluePlayers = 1;
playerBlueGrid = ds_grid_create(4,numberOfBluePlayers);
playerBlueDataMap = ds_map_create();

numberOfRedPlayers = 8;
playerRedGrid = ds_grid_create(4,numberOfRedPlayers);
playerRedDataMap = ds_map_create();

//SCRIPT: create the spawn points where players will appear
script_create_spawn_points();

//Put all player grids into container grid
//GRID: |table_id|teams_grid|team_name|team_player_count|
global.teamGrids = ds_grid_create(7,global.numberOfTeams);
ds_grid_set(global.teamGrids, 0, 0, 0);
ds_grid_set(global.teamGrids, 1, 0, playerBlueGrid);
ds_grid_set(global.teamGrids, 2, 0, "Blue");
ds_grid_set(global.teamGrids, 3, 0, numberOfBluePlayers);
ds_grid_set(global.teamGrids, 4, 0, obj_player_blue);
ds_grid_set(global.teamGrids, 5, 0, blueSpawnZones);
ds_grid_set(global.teamGrids, 6, 0, playerBlueDataMap);
ds_grid_set(global.teamGrids, 0, 1, 1);
ds_grid_set(global.teamGrids, 1, 1, playerRedGrid);
ds_grid_set(global.teamGrids, 2, 1, "Red");
ds_grid_set(global.teamGrids, 3, 1, numberOfRedPlayers);
ds_grid_set(global.teamGrids, 4, 1, obj_player_red);
ds_grid_set(global.teamGrids, 5, 1, redSpawnZones);
ds_grid_set(global.teamGrids, 6, 1, playerRedDataMap);

//SCRIPT: spawn first team
script_create_spawn_team(global.currentTeam);

//Highlight the starting player
gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
currentPlayerId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
playerHighlightId = instance_create(currentPlayerId.x,currentPlayerId.y,obj_player_highlight);
