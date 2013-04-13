with (obj_zone_exit_parent)
{

//var thisId = global.blueSpawnZoneId;
var thisId = id;
//show_message("thisId.zoneActive: " + string(thisId.zoneActive)) ;
if (thisId.zoneActive)
{
    var spawnLayoutX = 1;
    var spawnLayoutY = 1;
    
    //GRID: |spawn_point_grid|is_active|is_random_spawn_count|
    //global.blueSpawnZones = ds_grid_create(3,0);
    
    spawnWidth = thisId.bbox_right - thisId.bbox_left;
    spawnHeight = thisId.bbox_bottom - thisId.bbox_top;
    spawnWidthSize = round(spawnWidth / 64);
    spawnHeightSize = round(spawnHeight / 64);
    
    if (thisId.image_angle == 90)
    {
        var spawnLayoutY = -1;
    }
    else if (thisId.image_angle == 180)
    {
        var spawnLayoutX = -1;
    }
    spawnStartX = (thisId.x)-(((32*spawnWidthSize)-32)*spawnLayoutX);
    spawnStartY = (thisId.y)-(((32*spawnHeightSize)-32)*spawnLayoutY);
    spawnStartXOrig = spawnStartX;
    spawnStartYOrig = spawnStartY;
    
    //GRID: |spawn_point_id|x|y|
    blueSpawnPoints = ds_grid_create(3,0);
    
    var spawnPointNumber = 0;
    for (i=1; i <= spawnWidthSize; i+=1)
    {
        spawnStartX += (((64*i)-64)*spawnLayoutX);
        spawnStartY = spawnStartYOrig;
        for (j=1; j <= spawnHeightSize; j+=1)
        {
            spawn_direction = (thisId.image_angle)-180;
            spawnStartY += (((64*j)-64)*spawnLayoutY);
            
            ds_grid_resize(blueSpawnPoints,ds_grid_width(blueSpawnPoints),ds_grid_height(blueSpawnPoints)+1);
            ds_grid_set(blueSpawnPoints,0,spawnPointNumber,spawn_direction);
            ds_grid_set(blueSpawnPoints,1,spawnPointNumber,spawnStartX);
            ds_grid_set(blueSpawnPoints,2,spawnPointNumber,spawnStartY);
            spawnPointNumber += 1;
            //show_message("spawnStartX: " + string(spawnStartX) 
            //          +"#spawnStartY: " + string(spawnStartY)
            //);
        }
    }
    ////Add the new spawn point to the zone grid
    var current_height = ds_grid_height(global.blueSpawnZones);
    var current_width = ds_grid_width(global.blueSpawnZones);
    ds_grid_resize(global.blueSpawnZones,current_width,current_height+1);
    ds_grid_set(global.blueSpawnZones,0,current_height,blueSpawnPoints);
}
/*
else
{
    show_message("Nowhere to spawn Blue players");
}
*/
}
