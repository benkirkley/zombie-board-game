playerId = argument0;
if ( ds_map_exists(global.specialPlayersMap, playerId ))
{
     var thisPlayersDataMap = ds_map_find_value(global.specialPlayersMap, playerId );
     ds_map_replace(thisPlayersDataMap, "x", playerId.x);
     ds_map_replace(thisPlayersDataMap, "y", playerId.y);
     ds_map_replace(thisPlayersDataMap, "hit_points", playerId.hitPoints);
     ds_map_replace(global.specialPlayersMap, playerId, thisPlayersDataMap);
}
show_message("Save unique player data");
