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
//show_message( ds_grid_get(playerGroupsGrid, 1, 2) );

//GRID: |instance_id|player_name|
//playerBlueGrid = ds_grid_create(3,numberOfBluePlayers);

for(i = 0; i < numberOfBluePlayers; i += 1)
{
    /*
    global.totalPlayers += 1;
    startingPositonBlueY -= (64 * i);
    
    //CREATE the instance and assign some initial variables
    var playerBlueId = instance_create(startingPositonBlueX,startingPositonBlueY,obj_blue);
    playerBlueId.thisPlayerId = i;
    playerBlueId.thisTeamId = 0;
    playerBlueId.name = "Blue Player " + string(i+1);

    //NEW GRID: |instance_id|player_name|alive|
    ds_grid_set(playerBlueGrid, 0, i, playerBlueId);
    ds_grid_set(playerBlueGrid, 1, i, playerBlueId.name);
    ds_grid_set(playerBlueGrid, 2, i, true);
    */
    script_create_new_player(0, startingPositonBlueX, startingPositonBlueY, obj_blue, "Blue", playerBlueGrid, i);
    
}

//GRID: |instance_id|player_name|
//playerRedGrid = ds_grid_create(3,numberOfRedPlayers);
for(j=0; j < numberOfRedPlayers; j += 1)
{
    /*
    global.totalPlayers += 1;
    newPositonRedY = startingPositonRedY + (128 * j);
    
    //CREATE the instance and assign some initial variables
    var playerRedId = instance_create(startingPositonRedX,newPositonRedY,obj_red);
    playerRedId.thisPlayerId = j;
    playerRedId.thisTeamId = 1;
    playerRedId.name = "Red Player " + string(j+1)

    //NEW GRID: |instance_id|player_name|alive|
    ds_grid_set(playerRedGrid, 0, j, playerRedId);
    ds_grid_set(playerRedGrid, 1, j, playerRedId.name);
    ds_grid_set(playerRedGrid, 2, j, true);
    */
    script_create_new_player(1, startingPositonRedX,startingPositonRedY, obj_red, "Red", playerRedGrid, j);
}

//Put all player grids into container grid
teamGrids = ds_grid_create(2,global.numberOfTeams);
ds_grid_set(teamGrids, 0, 0, 0);
ds_grid_set(teamGrids, 1, 0, playerBlueGrid);
ds_grid_set(teamGrids, 0, 1, 0);
ds_grid_set(teamGrids, 1, 1, playerRedGrid);

//Highlight the starting player
playerYellowBorderId = instance_create(startingPositonBlueX,startingPositonBlueY,obj_yellow_border);
