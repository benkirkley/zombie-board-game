/* This script is called to create a new player based on the given parameters */

var teamId = argument0;
var counter = argument1;
var is_alive = 1;
var name = "";
              
playerDataMap = ds_grid_get(global.teamGrids, 6, teamId);
nameOfTeam = ds_grid_get(global.teamGrids, 2, teamId);
numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, teamId);
objectForThisInstance = ds_grid_get(global.teamGrids, 4, teamId);
thisTeamsSpawnGrid =  ds_grid_get(global.teamGrids, 5, teamId);

global.totalPlayers += 1;

//Check if player was saved from previous room
doesPlayerExistInSave = ds_map_find_value(global.savedPlayerData,string(counter)+".playerId");
if (doesPlayerExistInSave)
{
    name = ds_map_find_value(global.savedPlayerData, string(counter) + ".name");
    is_alive = ds_map_find_value(global.savedPlayerData, string(counter) + ".is_alive");          
}
          
if (is_alive)
{
    //CREATE the instance and assign some initial variables
    var playerId = instance_create(spawnPointX,spawnPointY,objectForThisInstance);
    
    
    playerId.thisTeamId = teamId;
    playerId.thisPlayerId = counter;
    playerId.name = name;
    if (playerId.name=="") playerId.name = string(nameOfTeam) + " Player " + string(counter+1);
    playerId.is_alive = true;
    playerId.direction = spawnDirection;
    playerId.image_angle = spawnDirection;
    playerId.image_speed=0;
    
    numberOfPlayersOnTeam = ds_map_find_value(playerDataMap,".numberOfPlayersOnTeam");
    ds_map_replace(playerDataMap,".numberOfPlayersOnTeam",numberOfPlayersOnTeam+1);
    ds_map_add(playerDataMap,string(counter)+".playerId",playerId);
    ds_map_add(playerDataMap,string(counter)+".name",playerId.name);
    ds_map_add(playerDataMap,string(counter)+".is_alive",true);
    ds_map_add(playerDataMap,string(counter)+".has_spawned",true);
    ds_map_add(playerDataMap,string(counter)+".inventory_weapon_1",false);
    ds_map_add(playerDataMap,string(counter)+".inventory_armour_1",false);
}
