/* Every turn, check if I am the active player */
playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
currentPlayerId = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".playerId");

if ( currentPlayerId = self.id )
{
    amICurrentPlayer = true;
    
    // Highlight the current player with a yellow square
    obj_master.playerHighlightId.x = x;
    obj_master.playerHighlightId.y = y;
}
