if (resolveCombat == true )
{
    resolveCombat = false;
    script_combatPerform(id,dicePool,defense,attack,hitPoints,damage);
}

if ( hitPoints <= 0 )
{
    
    gridCurrentTeam = ds_grid_get(obj_master.teamGrids, 1, thisTeamId);
    ds_grid_set(gridCurrentTeam, 2, thisPlayerId, false);    

    with (id) instance_destroy();
}

