/* This script uses a team's spawn point data to spawn players on the board */

i=argument0;

var numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, i);
playerNumberToSpawn = 0;

var spawnZones = ds_grid_get(global.teamGrids, 5, i);
var numberOfSpawnZones = ds_grid_height(spawnZones);    
spawnWaitingCount = 0;

//Loop through spawn zones
for (h=0; h < numberOfSpawnZones; h+=1)
{
    var spawnPointsGrid = ds_grid_get(spawnZones, 0, h);
    var numberOfSpawnPoints = ds_grid_height(spawnPointsGrid);
    
    randomize();
    var rollForNumberOfPlayersToSpawn = floor(random(100));
    if ( rollForNumberOfPlayersToSpawn >= 0 && rollForNumberOfPlayersToSpawn <= 33 ) var numberOfPlayersToSpawn = 1;
    if ( rollForNumberOfPlayersToSpawn >= 34 && rollForNumberOfPlayersToSpawn <= 66 ) var numberOfPlayersToSpawn = 2;
    if ( rollForNumberOfPlayersToSpawn >= 67 && rollForNumberOfPlayersToSpawn <= 99 ) var numberOfPlayersToSpawn = 3;
    //show_message("numberOfPlayersToSpawn: "+ string(numberOfPlayersToSpawn) );
    
    //Loop through players and spawn, but remember who last player was from previous zone. 
    var stopLoopAtThisNumber = numberOfPlayersOnThisTeam;
    var stopSpawingAtThisPlayerNumber = (numberOfPlayersToSpawn - 1 + playerNumberToSpawn);
    
    for (j=playerNumberToSpawn; j<stopLoopAtThisNumber; j += 1)
    {
        
        //Check if a spawn point is available in this zone
        for (k=0; k < numberOfSpawnPoints; k +=1)
        {
            spawnDirection = ds_grid_get(spawnPointsGrid, 0, k);
            spawnPointX = ds_grid_get(spawnPointsGrid, 1, k);
            spawnPointY = ds_grid_get(spawnPointsGrid, 2, k);
            
            if ( !instance_position(spawnPointX,spawnPointY,all) )
            {
                gridCurrentTeamDataMap = ds_grid_get(global.teamGrids, 6, i);
                //show_message( ds_map_find_value(gridCurrentTeamDataMap, (string(j)+".name")) );
                while ( ds_map_exists(gridCurrentTeamDataMap, (string(j)+".has_spawned")) )
                {
                    j += 1;
                    playerNumberToSpawn += 1;
                    stopSpawingAtThisPlayerNumber += 1;
                }

                if ( playerNumberToSpawn < stopLoopAtThisNumber) script_create_new_player(i, j);
                playerNumberToSpawn += 1;
                k = numberOfSpawnPoints; //break loop k
            }
        }
        if (j == stopSpawingAtThisPlayerNumber )
        {
            //show_message("Stop spawning");
            j = stopLoopAtThisNumber //break loop j
        }
    }
}
