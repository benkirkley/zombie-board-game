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
ds_grid_set(global.teamGrids, 5, 0, blueSpawnZones);
ds_grid_set(global.teamGrids, 0, 1, 1);
ds_grid_set(global.teamGrids, 1, 1, playerRedGrid);
ds_grid_set(global.teamGrids, 2, 1, "Red");
ds_grid_set(global.teamGrids, 3, 1, numberOfRedPlayers);
ds_grid_set(global.teamGrids, 4, 1, obj_player_red);
ds_grid_set(global.teamGrids, 5, 1, redSpawnZones);

//Create players on each team
//Loop through teams
for (i=0; i < global.numberOfTeams; i +=1 )
{
    /*
    numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, i);
    playerNumberToSpawn = 0;
    
    spawnZones = ds_grid_get(global.teamGrids, 5, i);
    numberOfSpawnZones = ds_grid_height(spawnZones);    
    spawnWaitingCount = 0;
    
    //Loop through spawn zones
    for (h=0; h < numberOfSpawnZones; h+=1)
    {
        spawnPointsGrid = ds_grid_get(spawnZones, 0, h);
        numberOfSpawnPoints = ds_grid_height(spawnPointsGrid);
        
        randomize();
        rollForNumberOfPlayersToSpawn = floor(random(100));
        if ( rollForNumberOfPlayersToSpawn >= 0 && rollForNumberOfPlayersToSpawn <= 25 ) var numberOfPlayersToSpawn = 1;
        if ( rollForNumberOfPlayersToSpawn >= 26 && rollForNumberOfPlayersToSpawn <= 60 ) var numberOfPlayersToSpawn = 2;
        if ( rollForNumberOfPlayersToSpawn >= 61 && rollForNumberOfPlayersToSpawn <= 99 ) var numberOfPlayersToSpawn = 3;
        //show_message("numberOfPlayersToSpawn: "+ string(numberOfPlayersToSpawn) );
        
        //Loop through players and spawn, but remember who last player was from previous zone. 
        stopLoopAtThisNumber = numberOfPlayersOnThisTeam + playerNumberToSpawn;
        stopSpawingAtThisPlayerNumber = (numberOfPlayersToSpawn - 1 + playerNumberToSpawn);
        for (j=playerNumberToSpawn; j<stopLoopAtThisNumber; j += 1)
        {
            //Check if a spawn point is available in this zone
            for (k=0; k < numberOfSpawnPoints; k +=1)
            {
                spawnDirection = ds_grid_get(spawnPointsGrid, 0, k);
                spawnPointX = ds_grid_get(spawnPointsGrid, 1, k);
                spawnPointY = ds_grid_get(spawnPointsGrid, 2, k);
                
                if ( instance_position(spawnPointX,spawnPointY,all) )
                {                  
                    if (k == numberOfSpawnPoints-1) {
                        //Add this player to spawn waiting count
                        //show_message("No spawn points left.");
                        spawnWaitingCount += 1;
                    }
                }
                else
                {
                    script_create_new_player(i, j);
                    playerNumberToSpawn += 1;
                    k = numberOfSpawnPoints; //break loop
                }
            }
            if (j == stopSpawingAtThisPlayerNumber )
            {
                j = stopLoopAtThisNumber 
            }
        }
    }
    
    show_message("global.numberOfTeams: " + string(global.numberOfTeams) 
                +"#i :" + string(i)
                );
    */
   script_create_spawn_team(i)
}

//Highlight the starting player
gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
currentPlayerId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
playerHighlightId = instance_create(currentPlayerId.x,currentPlayerId.y,obj_player_highlight);
