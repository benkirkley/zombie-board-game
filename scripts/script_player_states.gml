if (resolveCombat == true )
{
    resolveCombat = false;
    script_combatPerform(id,dicePool,defense,attack,hitPoints,damage,name);
}

if ( hitPoints <= 0 )
{
    
    gridCurrentTeam = ds_grid_get(obj_master.teamGrids, 1, thisTeamId);
    ds_grid_set(gridCurrentTeam, 2, thisPlayerId, false);
    
    var teamStillHasPlayers = false;
    loopLimit = ds_grid_height(gridCurrentTeam) ;
    for (i=0; i < loopLimit; i +=1 )
    {
        //show_message( ds_grid_get(gridCurrentTeam, 2, i) );
        if ( ds_grid_get(gridCurrentTeam, 2, i) == true )
        {
            var teamStillHasPlayers = true;
        }
    }
    
    with (id) instance_destroy();
    if (!teamStillHasPlayers) {
        teamName = ds_grid_get(obj_master.playerGroupsGrid, 1, global.currentTeam);
        show_message(string(teamName) + " wins! Restarting game");
        game_restart()
    }
    
}

