// Attaaaacckkk!
if (resolveCombat == true )
{
    resolveCombat = false;
    script_combatPerform(id,dicePool,defense,numberOfAttacks,hitPoints,damage,name,totalNumberOfAttacks);
}

// I died. Is any one else alive on my team?
if ( hitPoints <= 0 )
{
    
    gridCurrentTeam = ds_grid_get(global.teamGrids, 1, thisTeamId);
    ds_grid_set(gridCurrentTeam, 2, thisPlayerId, false);
    
    var teamStillHasPlayers = false;
    loopLimit = ds_grid_height(gridCurrentTeam) ;
    for (i=0; i < loopLimit; i +=1 )
    {
        //show_message( "Checking for players left alive on Team " + string(gridCurrentTeam) + ": " + string(ds_grid_get(gridCurrentTeam, 2, i)) );
        if ( ds_grid_get(gridCurrentTeam, 2, i) == true )
        {
            var teamStillHasPlayers = true;
            i = loopLimit; //break loop
            
        }
    }
    
    with (id) instance_destroy();
    if (!teamStillHasPlayers) {
        teamName = ds_grid_get( global.teamGrids, 2, global.currentTeam );
        show_message(string(teamName) + " wins! Restarting game");
        game_restart()
    }
    
}

