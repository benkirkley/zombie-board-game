// Attaaaacckkk!
if (resolveCombat == true )
{
    resolveCombat = false;
    script_combat_perform(id,dicePool,defense,numberOfAttacks,hitPoints,damage,name,totalNumberOfAttacks);
}

// I died. Is any one else alive on my team?
if ( hitPoints <= 0 )
{
    //show_message(string(thisPlayerId) + " Died");
    totalNumberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, thisTeamId)
    playerDataMap = ds_grid_get(global.teamGrids, 6, thisTeamId);
    ds_map_replace(playerDataMap,string(thisPlayerId) + ".is_alive",false);
    
    global.numberOfRedPlayersKilled += 1;
    
    var teamStillHasPlayers = false;
    //loopLimit = ds_grid_height(gridCurrentTeam) ;
    loopLimit = ds_map_find_value(playerDataMap,".numberOfPlayersOnTeam");
    for (i=0; i < loopLimit; i +=1 )
    {
        //show_message( "Checking for players left alive on Team");
        if ( ds_map_find_value(playerDataMap,string(i) + ".is_alive") )
        {
            var teamStillHasPlayers = true;
            //show_message("Found next player");
            i = loopLimit; //break loop
            
        }
    }
    
    with (id) instance_destroy();
    if (!teamStillHasPlayers && (loopLimit >= totalNumberOfPlayersOnThisTeam) ) {
        teamName = ds_grid_get( global.teamGrids, 2, global.currentTeam );
        show_message(string(teamName) + " wins! Restarting game");
        game_restart()
    }
    
    script_drop_random_item();
}

