/* This script is called to change the active team */
    
global.currentPlayer = 0;
global.currentTeam += 1;
if ( global.currentTeam >= global.numberOfTeams ) global.currentTeam = 0 ;

script_create_spawn_team(global.currentTeam);

gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
isCurrentPlayerAlive = ds_grid_get(gridCurrentTeam, 2, global.currentPlayer);
/*
show_message("global.currentTeam :" + string(global.currentTeam)
            +"global.currentPlayer: " + string(global.currentPlayer)
            + " -- Alive: " + string(isCurrentPlayerAlive)
            );
*/

//Go to next team if all players on this team have had their turn
while (!isCurrentPlayerAlive)
{
    //show_message("He's dead, skip him");
    global.currentPlayer += 1;
    //gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
    isCurrentPlayerAlive = ds_grid_get(gridCurrentTeam, 2, global.currentPlayer);
    //show_message("global.currentPlayer: " + string(global.currentPlayer) + " -- Alive: " + string(isCurrentPlayerAlive) );
    
    if ( global.currentPlayer == ds_grid_height(gridCurrentTeam) )
    {
        global.currentPlayer = 0;
        global.currentTeam += 1;
        if ( global.currentTeam >= global.numberOfTeams ) global.currentTeam = 0 ;
        gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
        isCurrentPlayerAlive = ds_grid_get(gridCurrentTeam, 2, global.currentPlayer);
    }
}
