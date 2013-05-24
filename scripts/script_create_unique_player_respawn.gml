if ( ds_map_exists(global.specialPlayersMap, id ))
{
    var thisPlayersDataMap = ds_map_find_value(global.specialPlayersMap, id );
    if ( ds_map_find_value(thisPlayersDataMap, "is_alive") == false)
    {
        instance_destroy();
    }
    else
    {
        x = ds_map_find_value(thisPlayersDataMap, "x" );
        y = ds_map_find_value(thisPlayersDataMap, "y" );
        image_angle = ds_map_find_value(thisPlayersDataMap, "image_angle" );
        hitPoints = ds_map_find_value(thisPlayersDataMap, "hit_points" );
        //show_message(hitPoints);
    }
}
else
{
    //if (isUnique)
    //{
        var thisPlayersDataMap = ds_map_create();
        ds_map_add(thisPlayersDataMap, "x", x);
        ds_map_add(thisPlayersDataMap, "y", y);
        ds_map_add(thisPlayersDataMap, "image_angle", image_angle);
        ds_map_add(thisPlayersDataMap, "hit_points", hitPoints);
        ds_map_add(thisPlayersDataMap, "is_alive", true);
        
        ds_map_add(global.specialPlayersMap, id, thisPlayersDataMap);
    //}
}
