

if (amICurrentPlayer)
{
    if (global.debug_show_ai_path) draw_path(mypath,x,y,true);
    //show_message("moveTimer: "+string(moveTimer) );
    obj_master.playerHighlightId.x = x;
    obj_master.playerHighlightId.y = y;
    

    if (moveTimer == gridSize) //Is it the first turn?
    {
        if (path_get_number(mypath) > 2) //Is the enemy more than one square away?
        {
            if (actionPoints > 0) //Do I have any action points left?
            {
                actionPoints -= 1;
                path_start(mypath,moveSpeed,0,false);
                image_speed=1;
                
                finalX = path_get_point_x(mypath, 1);
                finalY = path_get_point_y(mypath, 1);
                checkCollisionRed = collision_point(finalX,finalY,obj_player_red,false,true);
                if (checkCollisionRed) //Friendly collision
                {
                    path_start(mypath,0,0,false); //Stops the path
                    
                    ds_list_add(listFriendlyBlock, checkCollisionRed);
                    instance_deactivate_object(id);
                    mp_grid_clear_all(AI_grid);
                    for (i=0; i < ds_list_size(listFriendlyBlock); i++)
                    {
                        friendlyToAdd = ds_list_find_value(listFriendlyBlock, i);
                        mp_grid_add_instances(AI_grid,friendlyToAdd,true);
                    }
                    mp_grid_add_instances(AI_grid,obj_wall_hidden,false);
                    mp_grid_add_instances(AI_grid,obj_wall_hidden_red,false);
                    instance_activate_object(id);
                    mypath=path_add(); //creates an empty path...
                    nearestTarget = instance_nearest(x,y,obj_player_blue);
                    pathExists = mp_grid_path(AI_grid,mypath,x,y,nearestTarget.x,nearestTarget.y,true);
                    if (pathExists)
                    {
                        if (global.debug_show_ai_path) draw_path(mypath,x,y,true);       
                        actionPoints += 1;
                        moveTimer += moveSpeed;
                    }
                    else
                    {
                        image_speed=0;
                        image_index = 0;
                    }
                }
            }
            else
            {
                global.endTurn = true;
            }
        }
        else if (path_get_number(mypath) == 2) //Is the enemy right next to me?
        {
            if (numberOfAttacks > 0) //Do I have any attacks left?
            {
                finalX = path_get_point_x(mypath, 1);
                finalY = path_get_point_y(mypath, 1);
                
                collisionObjectId = collision_point(finalX,finalY,obj_player_blue,false,false);
                if (collisionObjectId)
                {
                    script_combat_trigger(collisionObjectId); //ATTACK
                }
            }
            else
            {
                global.endTurn = true;
            }
        }
    }
    else if (moveTimer <= 0)
    {
        move_snap( moveSpeed, moveSpeed );
        if (((y+32)%64 == 0)) //Check if we are on a grid point
        {
            path_start(mypath,0,0,false); //Stop the path
            moveTimer = gridSize + moveSpeed;
            createNewPath = true;
            ds_list_empty(listFriendlyBlock);
            image_speed=0;
            image_index = 0;
        }
    }
    else
    {   
        move_snap( moveSpeed, moveSpeed );
    }
    moveTimer -= moveSpeed;
    move_snap( moveSpeed, moveSpeed );
    if (path_position > 0) image_angle = direction+270;
}

draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,-1,1);
//if (amICurrentPlayer) show_message("Tick");
