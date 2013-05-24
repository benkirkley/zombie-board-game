// Attaaaacckkk!
if (resolveCombat == true )
{
    resolveCombat = false;
    script_combat_perform(id,dicePool,defense,numberOfAttacks,hitPoints,damage,name,totalNumberOfAttacks);
}

// I died. Is any one else alive on my team?
if ( hitPoints <= 0 )
{
    totalNumberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, thisTeamId)
    playerDataMap = ds_grid_get(global.teamGrids, 6, thisTeamId);
    ds_map_replace(playerDataMap,string(thisPlayerId) + ".is_alive",false);
    ds_map_replace(global.savedPlayerData, string(thisPlayerId) + ".is_alive",false);
    is_alive = false;
    //show_message( thisPlayerId  );
    
    global.numberOfRedPlayersKilled += 1;
    
    
    if ( ds_map_exists(global.specialPlayersMap, id ))
    {
         var thisPlayersDataMap = ds_map_find_value(global.specialPlayersMap, id );
         ds_map_replace(thisPlayersDataMap, "x", x);
         ds_map_replace(thisPlayersDataMap, "y", y);
         ds_map_replace(thisPlayersDataMap, "hit_points", hitPoints);
         ds_map_replace(thisPlayersDataMap, "is_alive", false);
         ds_map_replace(global.specialPlayersMap, id, thisPlayersDataMap);
    }
    
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
