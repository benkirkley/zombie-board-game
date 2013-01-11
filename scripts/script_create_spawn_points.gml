/*
//GRID: |spawn_point_id|x|y|
blueSpawnPoints = ds_grid_create(3,2);
////Spawn 0
spawn_direction = 180;
ds_grid_set(blueSpawnPoints,0,0,spawn_direction);
ds_grid_set(blueSpawnPoints,1,0,416);
ds_grid_set(blueSpawnPoints,2,0,96);
ds_grid_set(blueSpawnPoints,0,1,spawn_direction);
ds_grid_set(blueSpawnPoints,1,1,480);
ds_grid_set(blueSpawnPoints,2,1,96);

//GRID: |spawn_point_grid|is_active|is_random_spawn_count|
redSpawnZones = ds_grid_create(3,2);

//GRID: |spawn_point_id|x|y|
redSpawnPoints = ds_grid_create(3,6);
////Spawn 0
spawn_direction = 270;
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,96);
ds_grid_set(redSpawnPoints,2,0,160);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,96);
ds_grid_set(redSpawnPoints,2,1,224);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,96);
ds_grid_set(redSpawnPoints,2,2,288);
////Spawn 1
spawn_direction = 270;
ds_grid_set(redSpawnPoints,0,3,spawn_direction);
ds_grid_set(redSpawnPoints,1,3,96);
ds_grid_set(redSpawnPoints,2,3,480);
ds_grid_set(redSpawnPoints,0,4,spawn_direction);
ds_grid_set(redSpawnPoints,1,4,96);
ds_grid_set(redSpawnPoints,2,4,544);
ds_grid_set(redSpawnPoints,0,5,spawn_direction);
ds_grid_set(redSpawnPoints,1,5,96);
ds_grid_set(redSpawnPoints,2,5,608);
*/

//GRID: |spawn_point_grid|is_active|is_random_spawn_count|
blueSpawnZones = ds_grid_create(3,1);

//GRID: |spawn_point_id|x|y|
////Spawn 0
spawn_direction = 180;
blueSpawnPoints = ds_grid_create(3,2);
ds_grid_set(blueSpawnPoints,0,0,spawn_direction);
ds_grid_set(blueSpawnPoints,1,0,416);
ds_grid_set(blueSpawnPoints,2,0,96);
ds_grid_set(blueSpawnPoints,0,1,spawn_direction);
ds_grid_set(blueSpawnPoints,1,1,480);
ds_grid_set(blueSpawnPoints,2,1,96);

ds_grid_set(blueSpawnZones,0,0,blueSpawnPoints);

//GRID: |spawn_point_grid|is_active|is_random_spawn_count|
redSpawnZones = ds_grid_create(3,2);

//GRID: |spawn_point_id|x|y|
////Spawn 0
spawn_direction = 270;
redSpawnPoints = ds_grid_create(3,6)
ds_grid_set(redSpawnPoints,0,0,spawn_direction);
ds_grid_set(redSpawnPoints,1,0,96);
ds_grid_set(redSpawnPoints,2,0,160);
ds_grid_set(redSpawnPoints,0,1,spawn_direction);
ds_grid_set(redSpawnPoints,1,1,96);
ds_grid_set(redSpawnPoints,2,1,224);
ds_grid_set(redSpawnPoints,0,2,spawn_direction);
ds_grid_set(redSpawnPoints,1,2,96);
ds_grid_set(redSpawnPoints,2,2,288);

ds_grid_set(redSpawnZones,0,0,redSpawnPoints);

////Spawn 1
spawn_direction = 270;
redSpawnPoints = ds_grid_create(3,6)
ds_grid_set(redSpawnPoints,0,3,spawn_direction);
ds_grid_set(redSpawnPoints,1,3,96);
ds_grid_set(redSpawnPoints,2,3,480);
ds_grid_set(redSpawnPoints,0,4,spawn_direction);
ds_grid_set(redSpawnPoints,1,4,96);
ds_grid_set(redSpawnPoints,2,4,544);
ds_grid_set(redSpawnPoints,0,5,spawn_direction);
ds_grid_set(redSpawnPoints,1,5,96);
ds_grid_set(redSpawnPoints,2,5,608);

ds_grid_set(redSpawnZones,0,1,redSpawnPoints);

test = ds_grid_get(blueSpawnZones,0,0);
test2 = ds_grid_get(test,2,0);
show_message(test2);
