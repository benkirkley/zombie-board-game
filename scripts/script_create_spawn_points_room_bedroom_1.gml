/* This script sets up the spawn zones and spawn points within a zone for Red and Blue */
numberOfRedPlayers = 5;
//INI file -- read existing or create using defaults
ini_open("config.ini");
    numberOfRedPlayers = script_ini_read_key("Rooms","bedroom_1_enemy_count", numberOfRedPlayers,"real");
ini_close();

/*
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
*/

script_create_blue_spawn_points();

//GRID: |spawn_point_grid|is_active|is_random_spawn_count|
redSpawnZones = ds_grid_create(3,0);

//GRID: |spawn_point_id|x|y|
////Spawn 0
spawn_direction = 90;
redSpawnPoints = ds_grid_create(3,2)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,544);
ds_grid_set(redSpawnPoints,2,0,352);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,544);
ds_grid_set(redSpawnPoints,2,1,416);
////Add the new spawn point to the zone grid
var current_height = ds_grid_height(redSpawnZones);
var current_width = ds_grid_width(redSpawnZones);
ds_grid_resize(redSpawnZones,current_width,current_height+1);
ds_grid_set(redSpawnZones,0,current_height,redSpawnPoints);
