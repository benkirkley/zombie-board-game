/* This script sets up the spawn zones and spawn points within a zone for Red and Blue */
numberOfRedPlayers = 16;
//INI file -- read existing or create using defaults
ini_open("config.ini");
    numberOfRedPlayers = script_ini_read_key("Rooms","garage_enemy_count", numberOfRedPlayers,"real");
ini_close();

//GRID: |spawn_point_grid|is_active|is_random_spawn_count|
blueSpawnZones = ds_grid_create(3,0);

//GRID: |spawn_point_id|x|y|
////Spawn 0
spawn_direction = 180;
blueSpawnPoints = ds_grid_create(3,2);
ds_grid_set(blueSpawnPoints,0,0,spawn_direction);
ds_grid_set(blueSpawnPoints,1,0,480);
ds_grid_set(blueSpawnPoints,2,0,288);
ds_grid_set(blueSpawnPoints,0,1,spawn_direction);
ds_grid_set(blueSpawnPoints,1,1,544);
ds_grid_set(blueSpawnPoints,2,1,288);

////Add the new spawn point to the zone grid
var current_height = ds_grid_height(blueSpawnZones);
var current_width = ds_grid_width(blueSpawnZones);
ds_grid_resize(blueSpawnZones,current_width,current_height+1);
ds_grid_set(blueSpawnZones,0,current_height,blueSpawnPoints);

//GRID: |spawn_point_grid|is_active|is_random_spawn_count|
redSpawnZones = ds_grid_create(3,0);

//GRID: |spawn_point_id|x|y|
////Spawn 0
spawn_direction = 270;
redSpawnPoints = ds_grid_create(3,3)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,160);
ds_grid_set(redSpawnPoints,2,0,352);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,160);
ds_grid_set(redSpawnPoints,2,1,416);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,160);
ds_grid_set(redSpawnPoints,2,2,480);

////Add the new spawn point to the zone grid
var current_height = ds_grid_height(redSpawnZones);
var current_width = ds_grid_width(redSpawnZones);
ds_grid_resize(redSpawnZones,current_width,current_height+1);
ds_grid_set(redSpawnZones,0,current_height,redSpawnPoints);
