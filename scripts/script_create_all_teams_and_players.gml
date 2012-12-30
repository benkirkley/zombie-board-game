global.totalPlayers = 0;
global.numberOfTeams=2;

numberOfBluePlayers = 1;
playerBlueGrid = ds_grid_create(3,numberOfBluePlayers);
numberOfRedPlayers = 4;
playerRedGrid = ds_grid_create(3,numberOfRedPlayers);

startingPositonBlueX = 384;
startingPositonBlueY = 64;

startingPositonRedX = 128;
startingPositonRedY = 64;

//Which teams and how many players on each team
//GRID: |table_id|group_name|player_count|
playerGroupsGrid = ds_grid_create(3, global.numberOfTeams);
ds_grid_set(playerGroupsGrid, 0, 0, 0);
ds_grid_set(playerGroupsGrid, 1, 0, "Blue Team");
ds_grid_set(playerGroupsGrid, 2, 0, numberOfBluePlayers);
ds_grid_set(playerGroupsGrid, 0, 1, 1);
ds_grid_set(playerGroupsGrid, 1, 1, "Red Team");
ds_grid_set(playerGroupsGrid, 2, 1, numberOfRedPlayers);

//Put all player grids into container grid
global.teamGrids = ds_grid_create(2,global.numberOfTeams);
ds_grid_set(global.teamGrids, 0, 0, 0);
ds_grid_set(global.teamGrids, 1, 0, playerBlueGrid);
ds_grid_set(global.teamGrids, 0, 1, 0);
ds_grid_set(global.teamGrids, 1, 1, playerRedGrid);

for(i = 0; i < numberOfBluePlayers; i += 1)
{
    script_create_new_player(0, startingPositonBlueX, startingPositonBlueY, obj_blue, "Blue", playerBlueGrid, i);
    
}

for(j=0; j < numberOfRedPlayers; j += 1)
{
    script_create_new_player(1, startingPositonRedX,startingPositonRedY, obj_red, "Red", playerRedGrid, j);
}



//Highlight the starting player
playerYellowBorderId = instance_create(startingPositonBlueX,startingPositonBlueY,obj_yellow_border);
