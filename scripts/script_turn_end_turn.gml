/* This script is called when the End Turn button has been pressed */

if (global.endTurn == true )
{
    //show_message("End Turn button pressed");
    global.endTurn = false;
    
    //Get the current player's id and Action Points   
    gridCurrentTeamDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
    numberOfPlayersOnTeam = ds_map_find_value(gridCurrentTeamDataMap, ".numberOfPlayersOnTeam");
    currentPlayerId = ds_map_find_value(gridCurrentTeamDataMap, (string(global.currentPlayer)+".playerId"))
  
    
    //Reset variables on turn end
    if (currentPlayerId.actionPoints == 0) currentPlayerId.isMoving = false
    currentPlayerId.amICurrentPlayer = false;
    currentPlayerId.actionPoints = currentPlayerId.totalActionPoints;
    currentPlayerId.numberOfAttacks = currentPlayerId.totalNumberOfAttacks;
    
    script_inventory_destroy_items();
    
    //Check if there are any other players on this team 
    
    if ( global.currentPlayer < numberOfPlayersOnTeam-1 )
    {
        //show_message("Go to next player on this team");
        global.currentPlayer += 1;
        
        isNextPlayerAlive = ds_map_find_value(gridCurrentTeamDataMap, string(global.currentPlayer) + ".is_alive");
        nextPlayerName = ds_map_find_value(gridCurrentTeamDataMap, string(global.currentPlayer) + ".name");
        
        while (!isNextPlayerAlive) {
            //show_message("Next player is dead, skip him.");
            global.currentPlayer += 1;
            if ( global.currentPlayer == numberOfPlayersOnTeam )
            {
                isNextPlayerAlive = 1; //break while loop
                script_turn_next_team();
                script_inventory_create_items();
            }
            else
            {
                isNextPlayerAlive = ds_map_find_value(gridCurrentTeamDataMap, string(global.currentPlayer) + ".is_alive");
            }
        }
        script_inventory_create_items();
    }
    else
    {
        //show_message("All players on this team have moved");
        script_turn_next_team();
        script_inventory_create_items();
    }
    
}
