/* This script sets up the spawn zones and spawn points within a zone for Red and Blue */
numberOfRedPlayers = 15;
//INI file -- read existing or create using defaults
ini_open("config.ini");
    numberOfRedPlayers = script_ini_read_key("Rooms","driveway_enemy_count", numberOfRedPlayers,"real");
ini_close();

//GRID: |spawn_point_grid|is_active|is_random_spawn_count|
blueSpawnZones = ds_grid_create(3,0);

//GRID: |spawn_point_id|x|y|
////Spawn 0
spawn_direction = 90;
blueSpawnPoints = ds_grid_create(3,3);
ds_grid_set(blueSpawnPoints,0,0,spawn_direction);
ds_grid_set(blueSpawnPoints,1,0,672);
ds_grid_set(blueSpawnPoints,2,0,416);
ds_grid_set(blueSpawnPoints,0,1,spawn_direction);
ds_grid_set(blueSpawnPoints,1,1,672);
ds_grid_set(blueSpawnPoints,2,1,480);
ds_grid_set(blueSpawnPoints,0,2,spawn_direction);
ds_grid_set(blueSpawnPoints,1,2,672);
ds_grid_set(blueSpawnPoints,2,2,544);
ds_grid_set(blueSpawnPoints,0,3,spawn_direction);
ds_grid_set(blueSpawnPoints,1,3,672);
ds_grid_set(blueSpawnPoints,2,3,608);

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
redSpawnPoints = ds_grid_create(3,6)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,96);
ds_grid_set(redSpawnPoints,2,0,352);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,96);
ds_grid_set(redSpawnPoints,2,1,416);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,96);
ds_grid_set(redSpawnPoints,2,2,480);
ds_grid_set(redSpawnPoints,0,3,spawn_direction);
ds_grid_set(redSpawnPoints,1,3,96);
ds_grid_set(redSpawnPoints,2,3,544);
ds_grid_set(redSpawnPoints,0,4,spawn_direction);
ds_grid_set(redSpawnPoints,1,4,96);
ds_grid_set(redSpawnPoints,2,4,608);
ds_grid_set(redSpawnPoints,0,5,spawn_direction);
ds_grid_set(redSpawnPoints,1,5,96);
ds_grid_set(redSpawnPoints,2,5,672);

////Add the new spawn point to the zone grid
var current_height = ds_grid_height(redSpawnZones);
var current_width = ds_grid_width(redSpawnZones);
ds_grid_resize(redSpawnZones,current_width,current_height+1);
ds_grid_set(redSpawnZones,0,current_height,redSpawnPoints);

////Spawn 1
spawn_direction = 270;
redSpawnPoints = ds_grid_create(3,8)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,160);
ds_grid_set(redSpawnPoints,2,0,672);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,224);
ds_grid_set(redSpawnPoints,2,1,672);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,288);
ds_grid_set(redSpawnPoints,2,2,672);
ds_grid_set(redSpawnPoints,0,3,spawn_direction);
ds_grid_set(redSpawnPoints,1,3,352);
ds_grid_set(redSpawnPoints,2,3,672);
ds_grid_set(redSpawnPoints,0,4,spawn_direction);
ds_grid_set(redSpawnPoints,1,4,416);
ds_grid_set(redSpawnPoints,2,4,672);
ds_grid_set(redSpawnPoints,0,5,spawn_direction);
ds_grid_set(redSpawnPoints,1,5,480);
ds_grid_set(redSpawnPoints,2,5,672);
ds_grid_set(redSpawnPoints,0,6,spawn_direction);
ds_grid_set(redSpawnPoints,1,6,544);
ds_grid_set(redSpawnPoints,2,6,672);
ds_grid_set(redSpawnPoints,0,7,spawn_direction);
ds_grid_set(redSpawnPoints,1,7,608);
ds_grid_set(redSpawnPoints,2,7,672);

////Add the new spawn point to the zone grid
var current_height = ds_grid_height(redSpawnZones);
var current_width = ds_grid_width(redSpawnZones);
ds_grid_resize(redSpawnZones,current_width,current_height+1);
ds_grid_set(redSpawnZones,0,current_height,redSpawnPoints);

////Spawn 2
spawn_direction = 90;
redSpawnPoints = ds_grid_create(3,4)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,672);
ds_grid_set(redSpawnPoints,2,0,96);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,672);
ds_grid_set(redSpawnPoints,2,1,160);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,672);
ds_grid_set(redSpawnPoints,2,2,224);
ds_grid_set(redSpawnPoints,0,3,spawn_direction);
ds_grid_set(redSpawnPoints,1,3,672);
ds_grid_set(redSpawnPoints,2,3,288);

////Add the new spawn point to the zone grid
var current_height = ds_grid_height(redSpawnZones);
var current_width = ds_grid_width(redSpawnZones);
ds_grid_resize(redSpawnZones,current_width,current_height+1);
ds_grid_set(redSpawnZones,0,current_height,redSpawnPoints);

////Spawn 3
spawn_direction = 0;
redSpawnPoints = ds_grid_create(3,8)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,160);
ds_grid_set(redSpawnPoints,2,0,96);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,224);
ds_grid_set(redSpawnPoints,2,1,96);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,288);
ds_grid_set(redSpawnPoints,2,2,96);
ds_grid_set(redSpawnPoints,0,3,spawn_direction);
ds_grid_set(redSpawnPoints,1,3,352);
ds_grid_set(redSpawnPoints,2,3,96);
ds_grid_set(redSpawnPoints,0,4,spawn_direction);
ds_grid_set(redSpawnPoints,1,4,416);
ds_grid_set(redSpawnPoints,2,4,96);
ds_grid_set(redSpawnPoints,0,5,spawn_direction);
ds_grid_set(redSpawnPoints,1,5,480);
ds_grid_set(redSpawnPoints,2,5,96);
ds_grid_set(redSpawnPoints,0,6,spawn_direction);
ds_grid_set(redSpawnPoints,1,6,544);
ds_grid_set(redSpawnPoints,2,6,96);
ds_grid_set(redSpawnPoints,0,7,spawn_direction);
ds_grid_set(redSpawnPoints,1,7,608);
ds_grid_set(redSpawnPoints,2,7,96);

////Add the new spawn point to the zone grid
var current_height = ds_grid_height(redSpawnZones);
var current_width = ds_grid_width(redSpawnZones);
ds_grid_resize(redSpawnZones,current_width,current_height+1);
ds_grid_set(redSpawnZones,0,current_height,redSpawnPoints);
