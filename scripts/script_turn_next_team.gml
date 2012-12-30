    //show_message("No more players on team");
    global.currentPlayer = 0;
    global.currentTeam += 1;
    if ( global.currentTeam >= global.numberOfTeams ) global.currentTeam = 0 ;
    
    gridCurrentTeam = ds_grid_get(obj_master.teamGrids, 1, global.currentTeam);
    isCurrentPlayerAlive = ds_grid_get(gridCurrentTeam, 2, global.currentPlayer);
    //show_message("isCurrentPlayerAlive: " + string(isCurrentPlayerAlive));
    
    //while (ds_grid_get(gridCurrentTeam, 2, global.currentPlayer) == false)
    while (!isCurrentPlayerAlive)
    {
        
        global.currentPlayer += 1;
        gridCurrentTeam = ds_grid_get(obj_master.teamGrids, 1, global.currentTeam);
        isCurrentPlayerAlive = ds_grid_get(gridCurrentTeam, 2, global.currentPlayer);
        if ( global.currentPlayer == ds_grid_height(gridCurrentTeam) )
        {
            global.currentPlayer = 0;
            global.currentTeam += 1;
            if ( global.currentTeam >= global.numberOfTeams ) global.currentTeam = 0 ;
            gridCurrentTeam = ds_grid_get(obj_master.teamGrids, 1, global.currentTeam);
            isCurrentPlayerAlive = ds_grid_get(gridCurrentTeam, 2, global.currentPlayer);
        }
    }
    /*
    show_message("currentPlayer: " + string(global.currentPlayer) +
                "#currentTeam: " + string(global.currentTeam) +
                "#isCurrentPlayerAlive: " + string(isCurrentPlayerAlive)
    );
    */
