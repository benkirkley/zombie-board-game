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
for (i=0; i < global.numberOfTeams; i +=1 )
{
    //show_message("Team: "+string(i));
    numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, i);
    playerNumberToSpawn = 0;
    
    spawnZones = ds_grid_get(global.teamGrids, 5, i);
    numberOfSpawnZones = ds_grid_height(spawnZones);    
    spawnWaitingCount = 0;
    
    for (h=0; h < numberOfSpawnZones; h+=1)
    {
        /*
        show_message("numberOfSpawnZones: "+string(numberOfSpawnZones)
                    +"#thisSpawnZone(h): "+string(h)
        );
        */
        spawnPointsGrid = ds_grid_get(spawnZones, 0, h);
        
         
        numberOfSpawnPoints = ds_grid_height(spawnPointsGrid);
        
        
        for (ia=0; ia < numberOfSpawnZones; ia +=1)
        {
            rollForNumberOfPlayersToSpawn = floor(random(100));
            if ( rollForNumberOfPlayersToSpawn >= 0 && rollForNumberOfPlayersToSpawn <= 49 ) var numberOfPlayersToSpawn = 1;
            if ( rollForNumberOfPlayersToSpawn >= 50 && rollForNumberOfPlayersToSpawn <= 84 ) var numberOfPlayersToSpawn = 2;
            if ( rollForNumberOfPlayersToSpawn >= 85 && rollForNumberOfPlayersToSpawn <= 99 ) var numberOfPlayersToSpawn = 3;
        }
            show_message("numberOfPlayersToSpawn: "+ string(numberOfPlayersToSpawn) );
        
        stopLoopAtThisNumber = numberOfPlayersOnThisTeam + playerNumberToSpawn;
        stopSpawingAtThisPlayerNumber = (numberOfPlayersToSpawn - 1 + playerNumberToSpawn);
        for (j=playerNumberToSpawn; j<stopLoopAtThisNumber; j += 1)
        {
            /*
            show_message("j: " + string(j)
                        +"#playerNumberToSpawn: " + string(playerNumberToSpawn)
                        +"#total: " + string(stopLoopAtThisNumber)
                        +"#i: " + string(i)
            );
            */
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
                    
                    if (k == numberOfSpawnPoints-1) {
                        //Add this player to spawn waiting count
                        //show_message("No spawn points left.");
                        spawnWaitingCount += 1;
                        //show_message("spawnWaitingCount: " + string(spawnWaitingCount));
                    }
                }
                else
                {
                    script_create_new_player(i, j);
                    playerNumberToSpawn += 1;
                    k = numberOfSpawnPoints; //break loop
                }
            }
            //show_message("stopLoopAtThisNumber: "+ string(stopLoopAtThisNumber) );
            if (j == stopSpawingAtThisPlayerNumber )
            {
                /*
                show_message("STOP NOW"
                            +"#j: "+string(j) 
                            +"#numberOfPlayersToSpawn: "+ string(numberOfPlayersToSpawn)
                            +"numberOfPlayersToSpawn - 1 + playerNumberToSpawn: " + string(numberOfPlayersToSpawn - 1 + playerNumberToSpawn)            
                );
                */
                j = stopLoopAtThisNumber 
            }
            else
            {
                /*
                show_message("OK"
                            +"#j: "+string(j) 
                            +"#numberOfPlayersToSpawn: "+ string(numberOfPlayersToSpawn)
                            +"#numberOfPlayersToSpawn - 1 + playerNumberToSpawn: " + string(numberOfPlayersToSpawn - 1 + playerNumberToSpawn)            
                );
                */
            }
        }
    }
}

//Highlight the starting player
gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
currentPlayerId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
playerHighlightId = instance_create(currentPlayerId.x,currentPlayerId.y,obj_player_highlight);
