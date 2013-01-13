/* This script is called to change the active team */
    
global.currentPlayer = 0;
global.currentTeam += 1;
if ( global.currentTeam >= global.numberOfTeams ) global.currentTeam = 0 ;

//SCRIPT: create the team's players
script_create_spawn_team(global.currentTeam);

playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
isCurrentPlayerAlive = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".is_alive");

//Go to next team if all players on this team have had their turn
while (!isCurrentPlayerAlive)
{
    //show_message("He's dead, skip him");
    global.currentPlayer += 1;
    isCurrentPlayerAlive = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".is_alive");
    
    if ( global.currentPlayer == ds_map_find_value(playerDataMap,".numberOfPlayersOnTeam") ) 
    {
        global.currentPlayer = 0;
        global.currentTeam += 1;
        if ( global.currentTeam >= global.numberOfTeams ) global.currentTeam = 0 ;
        playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
        isCurrentPlayerAlive = ds_map_find_value(playerDataMap,string(counter)+".is_alive");
    }
}
