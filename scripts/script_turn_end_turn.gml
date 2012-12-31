/* This script is called when the End Turn button has been pressed */

if (global.endTurn == true )
{
    //show_message("End Turn button pressed");
    global.endTurn = false;
    amICurrentPlayer = false;
    
    //Get the current player's id and Action Points   
    gridCurrentTeam = ds_grid_get(global.teamGrids, 1, global.currentTeam);
    currentPlayerId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
    currentPlayerId.amICurrentPlayer = false;
    currentPlayerId.actionPoints = currentPlayerId.totalActionPoints;
    currentPlayerId.numberOfAttacks = currentPlayerId.totalNumberOfAttacks;
       
    //Check if there are any other players on this team
    var gridHeight = ds_grid_height(gridCurrentTeam);   
    if ( global.currentPlayer < ds_grid_height(gridCurrentTeam)-1 )
    {
        //show_message("Go to next player on this team");
        global.currentPlayer += 1;
        isNextPlayerAlive = ds_grid_get(gridCurrentTeam, 2, global.currentPlayer);
        nextPlayerName = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
        
        if (!isNextPlayerAlive) {
            //show_message("Next player is dead, skip him.");
            global.currentPlayer += 1;
            if ( global.currentPlayer == ds_grid_height(gridCurrentTeam) )
            {
                script_turn_next_team();
            }
        }
        
    }
    else
    {
        //show_message("All players on this team have moved");
        script_turn_next_team();
    }
    
}
