// Attaaaacckkk!
if (resolveCombat == true )
{
    resolveCombat = false;
    script_combat_perform(id,dicePool,defense,numberOfAttacks,hitPoints,damage,name,totalNumberOfAttacks);
}

// I died. Is any one else alive on my team?
if ( hitPoints <= 0 )
{
   // show_message(string(thisPlayerId) + " Died");
    show_message("thisPlayerId: " + string(thisPlayerId)
                +"#id: " + string(id)
    );
    totalNumberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, thisTeamId)
    playerDataMap = ds_grid_get(global.teamGrids, 6, thisTeamId);
    ds_map_replace(playerDataMap,string(thisPlayerId) + ".is_alive",false);
    ds_map_replace(global.savedPlayerData, string(thisPlayerId) + ".is_alive",false);
    thisPlayerId.is_alive = false;
    
    global.numberOfRedPlayersKilled += 1;
    
    var teamStillHasPlayers = false;
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
    
    if (!teamStillHasPlayers && (loopLimit >= totalNumberOfPlayersOnThisTeam) && global.currentTeam == 1)
    {
        teamName = ds_grid_get( global.teamGrids, 2, global.currentTeam );
        room_goto(room_dead);
    }
    
    
    if (thisTeamId > 0) script_drop_random_item(false,false);
}
