//Define variables
global.totalPlayers = 0;
global.numberOfTeams = 2;

numberOfBluePlayers = 1;
playerBlueGrid = ds_grid_create(3,numberOfBluePlayers);

numberOfRedPlayers = 4;
playerRedGrid = ds_grid_create(3,numberOfRedPlayers);

numberOfTestPlayers = 2;
playerTestGrid = ds_grid_create(3,numberOfTestPlayers);

blueSpawnPoint1x = 384;
blueSpawnPoint1y = 64;

redSpawnPoint1x = 128;
redSpawnPoint1y = 128;

//Put all player grids into container grid
//GRID: |table_id|teams_grid|team_name|team_player_count|
global.teamGrids = ds_grid_create(7,global.numberOfTeams);
ds_grid_set(global.teamGrids, 0, 0, 0);
ds_grid_set(global.teamGrids, 1, 0, playerBlueGrid);
ds_grid_set(global.teamGrids, 2, 0, "Blue");
ds_grid_set(global.teamGrids, 3, 0, numberOfBluePlayers);
ds_grid_set(global.teamGrids, 4, 0, obj_blue);
ds_grid_set(global.teamGrids, 5, 0, blueSpawnPoint1x);
ds_grid_set(global.teamGrids, 6, 0, blueSpawnPoint1y);
ds_grid_set(global.teamGrids, 0, 1, 1);
ds_grid_set(global.teamGrids, 1, 1, playerRedGrid);
ds_grid_set(global.teamGrids, 2, 1, "Red");
ds_grid_set(global.teamGrids, 3, 1, numberOfRedPlayers);
ds_grid_set(global.teamGrids, 4, 1, obj_red);
ds_grid_set(global.teamGrids, 5, 1, redSpawnPoint1x);
ds_grid_set(global.teamGrids, 6, 1, redSpawnPoint1y);


//Create players on each team
for (i=0; i < global.numberOfTeams; i +=1 )
{
    playersTeamsGrid = ds_grid_get(global.teamGrids, 1, i);
    nameOfTeam = ds_grid_get(global.teamGrids, 2, i);
    numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, i);
    objectForThisInstance = ds_grid_get(global.teamGrids, 4, i);
    spawnPointX = ds_grid_get(global.teamGrids, 5, i);
    spawnPointY = ds_grid_get(global.teamGrids, 6, i);
     
    for (j=0; j < numberOfPlayersOnThisTeam; j += 1)
    {
        script_create_new_player(i, j);
    }
}



//Highlight the starting player
playerYellowBorderId = instance_create(blueSpawnPoint1x,blueSpawnPoint1y,obj_yellow_border);
