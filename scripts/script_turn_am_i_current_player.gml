/* Every turn, check if I am the active player */

gridCurrentTeam = ds_grid_get(obj_master.teamGrids, 1, global.currentTeam);
currentPlayerId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);

if ( currentPlayerId = self.id )
{
    amICurrentPlayer = true;
    
    // Highlight the current player with a yellow square
    obj_master.playerYellowBorderId.x = x;
    obj_master.playerYellowBorderId.y = y;
}
