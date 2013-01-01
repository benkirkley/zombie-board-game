//Define variables
global.totalPlayers = 0;
global.numberOfTeams = 2;

numberOfBluePlayers = 1;
playerBlueGrid = ds_grid_create(3,numberOfBluePlayers);

numberOfRedPlayers = 4;
playerRedGrid = ds_grid_create(3,numberOfRedPlayers);
/*
blueSpawnPoint1x = 384;
blueSpawnPoint1y = 64;
//GRID: |spawn_point_id|x|y|
blueSpawnPoints = ds_grid_create(3,2);
////Spawn 0
ds_grid_set(blueSpawnPoints,0,0,0);
ds_grid_set(blueSpawnPoints,1,0,384);
ds_grid_set(blueSpawnPoints,2,0,64);
ds_grid_set(blueSpawnPoints,0,1,0);
ds_grid_set(blueSpawnPoints,1,1,448);
ds_grid_set(blueSpawnPoints,2,1,64);

redSpawnPoint1x = 128;
redSpawnPoint1y = 128;
//GRID: |spawn_point_id|x|y|
redSpawnPoints = ds_grid_create(3,6);
////Spawn 0
ds_grid_set(redSpawnPoints,0,0,0);
ds_grid_set(redSpawnPoints,1,0,128);
ds_grid_set(redSpawnPoints,2,0,128);
ds_grid_set(redSpawnPoints,0,1,0);
ds_grid_set(redSpawnPoints,1,1,128);
ds_grid_set(redSpawnPoints,2,1,192);
ds_grid_set(redSpawnPoints,0,2,0);
ds_grid_set(redSpawnPoints,1,2,128);
ds_grid_set(redSpawnPoints,2,2,256);
////Spawn 1
ds_grid_set(redSpawnPoints,0,3,1);
ds_grid_set(redSpawnPoints,1,3,128);
ds_grid_set(redSpawnPoints,2,3,384);
ds_grid_set(redSpawnPoints,0,4,1);
ds_grid_set(redSpawnPoints,1,4,128);
ds_grid_set(redSpawnPoints,2,4,448);
ds_grid_set(redSpawnPoints,0,5,1);
ds_grid_set(redSpawnPoints,1,5,128);
ds_grid_set(redSpawnPoints,2,5,512);
*/
script_create_spawn_points();

//Put all player grids into container grid
//GRID: |table_id|teams_grid|team_name|team_player_count|
global.teamGrids = ds_grid_create(7,global.numberOfTeams);
ds_grid_set(global.teamGrids, 0, 0, 0);
ds_grid_set(global.teamGrids, 1, 0, playerBlueGrid);
ds_grid_set(global.teamGrids, 2, 0, "Blue");
ds_grid_set(global.teamGrids, 3, 0, numberOfBluePlayers);
ds_grid_set(global.teamGrids, 4, 0, obj_player_blue);
ds_grid_set(global.teamGrids, 5, 0, blueSpawnPoints);
ds_grid_set(global.teamGrids, 0, 1, 1);
ds_grid_set(global.teamGrids, 1, 1, playerRedGrid);
ds_grid_set(global.teamGrids, 2, 1, "Red");
ds_grid_set(global.teamGrids, 3, 1, numberOfRedPlayers);
ds_grid_set(global.teamGrids, 4, 1, obj_player_red);
ds_grid_set(global.teamGrids, 5, 1, redSpawnPoints);

//Create players on each team
for (i=0; i < global.numberOfTeams; i +=1 )
{
    //playersTeamsGrid = ds_grid_get(global.teamGrids, 1, i);
    //nameOfTeam = ds_grid_get(global.teamGrids, 2, i);
    numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, i);
    //objectForThisInstance = ds_grid_get(global.teamGrids, 4, i);
    //spawnPointX = ds_grid_get(global.teamGrids, 5, i);
    //spawnPointY = ds_grid_get(global.teamGrids, 6, i);
    
         
    for (j=0; j < numberOfPlayersOnThisTeam; j += 1)
    {
        script_create_new_player(i, j);
    }
}



//Highlight the starting player

gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
currentPlayerId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
playerHighlightId = instance_create(currentPlayerId.x,currentPlayerId.y,obj_player_highlight);
