/* This script sets up the spawn zones and spawn points within a zone for Red and Blue */
numberOfRedPlayers = 12;
//INI file -- read existing or create using defaults
ini_open("config.ini");
    numberOfRedPlayers = script_ini_read_key("Rooms","dining_enemy_count", numberOfRedPlayers,"real");
ini_close();

//GRID: |spawn_point_grid|is_active|is_random_spawn_count|
redSpawnZones = ds_grid_create(3,0);

//GRID: |spawn_point_id|x|y|
////Spawn 0
spawn_direction = 270;
redSpawnPoints = ds_grid_create(3,3)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,96);
ds_grid_set(redSpawnPoints,2,0,160);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,96);
ds_grid_set(redSpawnPoints,2,1,224);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,96);
ds_grid_set(redSpawnPoints,2,2,288);

////Add the new spawn point to the zone grid
var current_height = ds_grid_height(redSpawnZones);
var current_width = ds_grid_width(redSpawnZones);
ds_grid_resize(redSpawnZones,current_width,current_height+1);
ds_grid_set(redSpawnZones,0,current_height,redSpawnPoints);

////Spawn 1
spawn_direction = 270;
redSpawnPoints = ds_grid_create(3,3)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,96);
ds_grid_set(redSpawnPoints,2,0,480);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,96);
ds_grid_set(redSpawnPoints,2,1,544);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,96);
ds_grid_set(redSpawnPoints,2,2,608);

////Add the new spawn point to the zone grid
var current_height = ds_grid_height(redSpawnZones);
var current_width = ds_grid_width(redSpawnZones);
ds_grid_resize(redSpawnZones,current_width,current_height+1);
ds_grid_set(redSpawnZones,0,current_height,redSpawnPoints);
