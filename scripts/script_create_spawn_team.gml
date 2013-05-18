/* This script uses a team's spawn point data to spawn players on the board */
teamId=argument0;


if (teamId == 0 && global.turnCounter == 1)
{
    var stackOfBluePlayersInHere = ds_list_create();
    with(obj_player_blue)
    {
        ds_list_add(stackOfBluePlayersInHere,id);
    }
    //show_message("stackOfBluePlayersInHere Size: " + string(ds_list_size(stackOfBluePlayersInHere)));
}

if (teamId == 1 && global.turnCounter == 1 && global.redPlacedAddedToList == false)
{
    var stackOfRedPlayersInHere = ds_list_create();
    with(obj_player_red)
    {
       ds_list_add(stackOfRedPlayersInHere,id);
    }
}


playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
playerNumberToSpawn = 0;

var numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, teamId);
var spawnZones = ds_grid_get(global.teamGrids, 5, teamId);
var numberOfSpawnZones = ds_grid_height(spawnZones);

//show_message("global.numberOfBluePlayers: " + string(global.numberOfBluePlayers));

//Loop through spawn zones
for (h=0; h < numberOfSpawnZones; h+=1)
{
    var spawnPointsGrid = ds_grid_get(spawnZones, 0, h);
    var numberOfSpawnPoints = ds_grid_height(spawnPointsGrid);
    if (teamId == 1)
    {
        randomize();
        var rollForNumberOfPlayersToSpawn = floor(random(100));
        //if ( rollForNumberOfPlayersToSpawn >= 0 && rollForNumberOfPlayersToSpawn <= 0 ) var numberOfPlayersToSpawn = 0;
        if ( rollForNumberOfPlayersToSpawn >= 0 && rollForNumberOfPlayersToSpawn <= 50 ) var numberOfPlayersToSpawn = 1;
        if ( rollForNumberOfPlayersToSpawn >= 51 && rollForNumberOfPlayersToSpawn <= 90 ) var numberOfPlayersToSpawn = 2;
        if ( rollForNumberOfPlayersToSpawn >= 91 && rollForNumberOfPlayersToSpawn <= 99 ) var numberOfPlayersToSpawn = 3;
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
        for (playerNumber=playerNumberToSpawn; playerNumber<stopLoopAtThisNumber; playerNumber += 1)
        {
            //Check if a spawn point is available in this zone
            for (k=0; k < numberOfSpawnPoints; k +=1)
            {
                spawnDirection = ds_grid_get(spawnPointsGrid, 0, k);
                spawnPointX = ds_grid_get(spawnPointsGrid, 1, k);
                //show_message("spawnPointX: " + string(spawnPointX));
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
                    gridCurrentTeamDataMap = ds_grid_get(global.teamGrids, 6, teamId);
                    //Find the first unspawned player on this team
                    while ( ds_map_find_value(gridCurrentTeamDataMap, (string(playerNumber)+".has_spawned")) )
                    {
                        playerNumber += 1;
                        playerNumberToSpawn += 1;
                        stopSpawingAtThisPlayerNumber += 1;
                    }
                    if ( playerNumberToSpawn < stopLoopAtThisNumber)     
                        script_create_new_player(teamId, playerNumber);
                    playerNumberToSpawn += 1;
                    k = numberOfSpawnPoints; //break loop k
                }
            }
            if (playerNumber == stopSpawingAtThisPlayerNumber )
            {
                //show_message("Stop spawning");
                playerNumber = stopLoopAtThisNumber //break loop playerNumber
            }
        }
    }
}


if (teamId == 0 && global.turnCounter == 1)
{
    with(obj_player_blue)
    {
        teamId=argument0;
        for (i=0; i < ds_list_size(stackOfBluePlayersInHere); i+=1)
        {
            wasIAlreadyInHere = ds_list_find_value(stackOfBluePlayersInHere,i);
            if (wasIAlreadyInHere==id)
            {
                playerDataMap = ds_grid_get(global.teamGrids, 6, teamId);
                numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, teamId);
                objectForThisInstance = ds_grid_get(global.teamGrids, 4, teamId);
                thisTeamsSpawnGrid =  ds_grid_get(global.teamGrids, 5, teamId);
                id.thisPlayerId = numberOfPlayersOnThisTeam;
                global.totalPlayers += 1;
                
                numberOfPlayersOnTeam = ds_map_find_value(playerDataMap,".numberOfPlayersOnTeam");
                ds_map_add(playerDataMap,string(numberOfPlayersOnTeam)+".playerId",id);
                ds_map_add(playerDataMap,string(numberOfPlayersOnTeam)+".name",name);
                ds_map_add(playerDataMap,string(numberOfPlayersOnTeam)+".is_alive",is_alive);
                ds_map_add(playerDataMap,string(numberOfPlayersOnTeam)+".has_spawned",true);
                ds_map_add(playerDataMap,string(numberOfPlayersOnTeam)+".inventory_weapon_1",inventorySlotWeapon);
                ds_map_add(playerDataMap,string(numberOfPlayersOnTeam)+".inventory_armour_1",inventorySlotArmour);
                ds_map_replace(playerDataMap,".numberOfPlayersOnTeam",numberOfPlayersOnTeam+1);
                ds_grid_set(global.teamGrids, 3, teamId, numberOfPlayersOnThisTeam+1);
                
                global.numberOfBluePlayers += 1;
            }
        }
    }
    ds_list_destroy(stackOfBluePlayersInHere);
}

if (teamId == 1 && global.turnCounter == 1 && global.redPlacedAddedToList == false)
{
    global.redPlacedAddedToList = true;
    with(obj_player_red)
    {
        teamId=argument0;
        for (i=0; i < ds_list_size(stackOfRedPlayersInHere); i+=1)
        {
            wasIAlreadyInHere = ds_list_find_value(stackOfRedPlayersInHere,i);
            if (wasIAlreadyInHere == id)
            {
                playerDataMap = ds_grid_get(global.teamGrids, 6, teamId);
                numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, teamId);
                objectForThisInstance = ds_grid_get(global.teamGrids, 4, teamId);
                thisTeamsSpawnGrid =  ds_grid_get(global.teamGrids, 5, teamId);
                var numberOfSpawnedPlayers = 0;
                for (i=0; i < numberOfPlayersOnThisTeam; i++)
                {
                    if (ds_map_find_value(playerDataMap,string(i)+".has_spawned"))
                    {
                        numberOfSpawnedPlayers += 1;
                    }
                }
                id.thisTeamId = teamId;
                id.thisPlayerId = numberOfSpawnedPlayers;
                global.totalPlayers += 1;
                
                numberOfPlayersOnTeam = ds_map_find_value(playerDataMap,".numberOfPlayersOnTeam");
                ds_map_add(playerDataMap,string(numberOfSpawnedPlayers)+".playerId",id);
                ds_map_add(playerDataMap,string(numberOfSpawnedPlayers)+".name",name);
                ds_map_add(playerDataMap,string(numberOfSpawnedPlayers)+".is_alive",is_alive);
                ds_map_add(playerDataMap,string(numberOfSpawnedPlayers)+".has_spawned",true);
                ds_map_add(playerDataMap,string(numberOfSpawnedPlayers)+".inventory_weapon_1",inventorySlotWeapon);
                ds_map_add(playerDataMap,string(numberOfSpawnedPlayers)+".inventory_armour_1",inventorySlotArmour);
                ds_map_replace(playerDataMap,".numberOfPlayersOnTeam",numberOfPlayersOnTeam+1);
                ds_grid_set(global.teamGrids, 3, teamId, numberOfPlayersOnThisTeam+1);
                
                global.numberOfRedPlayers += 1;
            }
        }
    }
    ds_list_destroy(stackOfRedPlayersInHere);
}
