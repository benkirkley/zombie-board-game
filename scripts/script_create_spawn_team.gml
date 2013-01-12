i=argument0;

var numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, i);
var playerNumberToSpawn = 0;

var spawnZones = ds_grid_get(global.teamGrids, 5, i);
var numberOfSpawnZones = ds_grid_height(spawnZones);    
var spawnWaitingCount = 0;

//Loop through spawn zones
for (h=0; h < numberOfSpawnZones; h+=1)
{
    var spawnPointsGrid = ds_grid_get(spawnZones, 0, h);
    var numberOfSpawnPoints = ds_grid_height(spawnPointsGrid);
    
    randomize();
    var rollForNumberOfPlayersToSpawn = floor(random(100));
    if ( rollForNumberOfPlayersToSpawn >= 0 && rollForNumberOfPlayersToSpawn <= 25 ) var numberOfPlayersToSpawn = 1;
    if ( rollForNumberOfPlayersToSpawn >= 26 && rollForNumberOfPlayersToSpawn <= 60 ) var numberOfPlayersToSpawn = 2;
    if ( rollForNumberOfPlayersToSpawn >= 61 && rollForNumberOfPlayersToSpawn <= 99 ) var numberOfPlayersToSpawn = 3;
    //show_message("numberOfPlayersToSpawn: "+ string(numberOfPlayersToSpawn) );
    
    //Loop through players and spawn, but remember who last player was from previous zone. 
    var stopLoopAtThisNumber = numberOfPlayersOnThisTeam + playerNumberToSpawn;
    var stopSpawingAtThisPlayerNumber = (numberOfPlayersToSpawn - 1 + playerNumberToSpawn);
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
                k = numberOfSpawnPoints; //break loop k
            }
        }
        if (j == stopSpawingAtThisPlayerNumber )
        {
            j = stopLoopAtThisNumber //break loop j
        }
    }
}
