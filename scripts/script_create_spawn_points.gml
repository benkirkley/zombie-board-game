
//blueSpawnPoint1x = 384;
//blueSpawnPoint1y = 64;
//GRID: |spawn_point_id|x|y|
blueSpawnPoints = ds_grid_create(3,2);
////Spawn 0
ds_grid_set(blueSpawnPoints,0,0,0);
ds_grid_set(blueSpawnPoints,1,0,384);
ds_grid_set(blueSpawnPoints,2,0,64);
ds_grid_set(blueSpawnPoints,0,1,0);
ds_grid_set(blueSpawnPoints,1,1,448);
ds_grid_set(blueSpawnPoints,2,1,64);

//redSpawnPoint1x = 128;
//redSpawnPoint1y = 128;
//GRID: |spawn_point_id|x|y|
redSpawnPoints = ds_grid_create(3,6);
////Spawn 0
ds_grid_set(redSpawnPoints,0,0,0);
ds_grid_set(redSpawnPoints,1,0,64);
ds_grid_set(redSpawnPoints,2,0,128);
ds_grid_set(redSpawnPoints,0,1,0);
ds_grid_set(redSpawnPoints,1,1,64);
ds_grid_set(redSpawnPoints,2,1,192);
ds_grid_set(redSpawnPoints,0,2,0);
ds_grid_set(redSpawnPoints,1,2,64);
ds_grid_set(redSpawnPoints,2,2,256);
////Spawn 1
ds_grid_set(redSpawnPoints,0,3,1);
ds_grid_set(redSpawnPoints,1,3,64);
ds_grid_set(redSpawnPoints,2,3,448);
ds_grid_set(redSpawnPoints,0,4,1);
ds_grid_set(redSpawnPoints,1,4,64);
ds_grid_set(redSpawnPoints,2,4,512);
ds_grid_set(redSpawnPoints,0,5,1);
ds_grid_set(redSpawnPoints,1,5,64);
ds_grid_set(redSpawnPoints,2,5,576);
