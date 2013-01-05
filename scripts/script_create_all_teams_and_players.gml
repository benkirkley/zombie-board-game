//Define variables
global.totalPlayers = 0;
global.numberOfTeams = 2;

numberOfBluePlayers = 1;
playerBlueGrid = ds_grid_create(3,numberOfBluePlayers);

numberOfRedPlayers = 6;
playerRedGrid = ds_grid_create(3,numberOfRedPlayers);

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
    numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, i);
    spawnPointsGrid = ds_grid_get(global.teamGrids, 5, i);
    //spawnPointX = ds_grid_get(spawnPointsGrid, 1, 0);
    //spawnPointY = ds_grid_get(spawnPointsGrid, 2, 0);
    
    
    /****
    var collidableObjects;
    collidableObjects[0]=obj_player_blue;
    collidableObjects[1]=obj_player_red;
    collidableObjects[2]=obj_wall_hidden;
    ***/
    
    numberOfSpawnPoints = ds_grid_height(spawnPointsGrid);
    for (j=0; j < numberOfPlayersOnThisTeam; j += 1)
    {
        for (k=0; k < numberOfSpawnPoints; k +=1)
        {
            spawnDirection = ds_grid_get(spawnPointsGrid, 0, k);
            spawnPointX = ds_grid_get(spawnPointsGrid, 1, k);
            spawnPointY = ds_grid_get(spawnPointsGrid, 2, k);
            
            if ( instance_position(spawnPointX,spawnPointY,all) )
            {
                /*
                show_message("spawnPointX: " + string(spawnPointX)
                            +"#spawnPointY: " + string(spawnPointY)
                            +"#Team: " + string(i) + " - Player: " + string(j)
                
                );
                */
                if (k == numberOfSpawnPoints-1) show_message("No spawn points left!");
            }
            else
            {
                script_create_new_player(i, j);
                k = numberOfSpawnPoints; //break loop
            }
        }
    
        
    
        //script_create_new_player(i, j);
    }
}

//Highlight the starting player
gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
currentPlayerId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
playerHighlightId = instance_create(currentPlayerId.x,currentPlayerId.y,obj_player_highlight);
