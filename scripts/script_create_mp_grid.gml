global.AI_grid=mp_grid_create(0,0,room_width/32,room_height/32,64,64); //Creates the mp_grid
mp_grid_add_instances(global.AI_grid,obj_wall_hidden,false);
mp_grid_add_instances(global.AI_grid,obj_player_red,false);
