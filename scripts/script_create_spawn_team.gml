/* This script uses a team's spawn point data to spawn players on the board */

i=argument0;

var numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, i);
playerNumberToSpawn = 0;

var spawnZones = ds_grid_get(global.teamGrids, 5, i);
var numberOfSpawnZones = ds_grid_height(spawnZones);    

//Loop through spawn zones
for (h=0; h < numberOfSpawnZones; h+=1)
{
    var spawnPointsGrid = ds_grid_get(spawnZones, 0, h);
    var numberOfSpawnPoints = ds_grid_height(spawnPointsGrid);
    if (i = 1)
    {
        randomize();
        var rollForNumberOfPlayersToSpawn = floor(random(100));
        rollForNumberOfPlayersToSpawn=2;
        if ( rollForNumberOfPlayersToSpawn >= 1 && rollForNumberOfPlayersToSpawn <= 20 ) var numberOfPlayersToSpawn = 0;
        if ( rollForNumberOfPlayersToSpawn >= 21 && rollForNumberOfPlayersToSpawn <= 70 ) var numberOfPlayersToSpawn = 1;
        if ( rollForNumberOfPlayersToSpawn >= 71 && rollForNumberOfPlayersToSpawn <= 95 ) var numberOfPlayersToSpawn = 2;
        if ( rollForNumberOfPlayersToSpawn >= 96 && rollForNumberOfPlayersToSpawn <= 99 ) var numberOfPlayersToSpawn = 3;
    }
    else
    {
        numberOfPlayersToSpawn = numberOfPlayersOnThisTeam;
    }
    
    if (numberOfPlayersToSpawn > 0)
    {
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
                
                //Is this spot free?
                var checkSpotForObject = false;
                for (n=0; n < ds_list_size(global.collidableObjects); n+=1)
                {
                    var objectToCheckWith = ds_list_find_value(global.collidableObjects, n)
                    var checkSpotForObject = instance_position(spawnPointX,spawnPointY,objectToCheckWith)
                    if (checkSpotForObject) n = ds_list_size(global.collidableObjects) //break loop
                }
                
                if ( !checkSpotForObject )
                {
                    gridCurrentTeamDataMap = ds_grid_get(global.teamGrids, 6, i);
                    //Find the first unspawned player on this team
                    while ( ds_map_find_value(gridCurrentTeamDataMap, (string(j)+".has_spawned")) )
                    {
                        j += 1;
                        playerNumberToSpawn += 1;
                        stopSpawingAtThisPlayerNumber += 1;
                    }
                    if ( playerNumberToSpawn < stopLoopAtThisNumber)     
                        script_create_new_player(i, j);
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
}
