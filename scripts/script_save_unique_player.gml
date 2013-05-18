thisPlayerId = argument0;
if ( ds_map_exists(global.specialPlayersMap, thisPlayerId ))
{
     var thisPlayersDataMap = ds_map_find_value(global.specialPlayersMap, thisPlayerId );
     ds_map_replace(thisPlayersDataMap, "x", thisPlayerId.x);
     ds_map_replace(thisPlayersDataMap, "y", thisPlayerId.y);
     ds_map_replace(thisPlayersDataMap, "hit_points", thisPlayerId.hitPoints);
     ds_map_replace(global.specialPlayersMap, thisPlayerId, thisPlayersDataMap);
}
