if (global.blueSpawnZoneId)
{

    //GRID: |spawn_point_grid|is_active|is_random_spawn_count|
    blueSpawnZones = ds_grid_create(3,0);
    
    spawnWidth = global.blueSpawnZoneId.bbox_right - global.blueSpawnZoneId.bbox_left;
    spawnHeight = global.blueSpawnZoneId.bbox_bottom - global.blueSpawnZoneId.bbox_top;
    spawnWidthSize = round(spawnWidth / 64);
    spawnHeightSize = round(spawnHeight / 64);
    
    
    spawnStartX = (global.blueSpawnZoneId.x)-((32*spawnWidthSize)-32);
    spawnStartY = (global.blueSpawnZoneId.y)-((32*spawnHeightSize)-32);
    
    //GRID: |spawn_point_id|x|y|
    blueSpawnPoints = ds_grid_create(3,0);
    
    for (i=1; i <= spawnWidthSize; i+=1)
    {
        for (j=1; j <= spawnHeightSize; j+=1)
        {
            spawn_direction = (global.blueSpawnZoneId.image_angle)-180;
            spawnStartX = (spawnStartX + ((64*i)-64));
            spawnStartY = (spawnStartY + ((64*j)-64));
            
            ds_grid_resize(blueSpawnPoints,ds_grid_width(blueSpawnPoints),ds_grid_height(blueSpawnPoints)+1);
            ds_grid_set(blueSpawnPoints,0,j-1,spawn_direction);
            ds_grid_set(blueSpawnPoints,1,j-1,spawnStartX);
            ds_grid_set(blueSpawnPoints,2,j-1,spawnStartY);   
        }
        ////Add the new spawn point to the zone grid
        var current_height = ds_grid_height(blueSpawnZones);
        var current_width = ds_grid_width(blueSpawnZones);
        ds_grid_resize(blueSpawnZones,current_width,current_height+1);
        ds_grid_set(blueSpawnZones,0,current_height,blueSpawnPoints);
    }
}
else
{
    show_message("Nowhere to spawn Blue players");
}
