if (amICurrentPlayer)
{
    if (createNewPath)
    {
        //show_message("Create Path");
        instance_deactivate_object(id);
        mp_grid_clear_all(AI_grid);
        mp_grid_add_instances(AI_grid,obj_player_red,true);
        mp_grid_add_instances(AI_grid,obj_wall_hidden,false);
        mp_grid_add_instances(AI_grid,obj_wall_hidden_red,false);
        instance_activate_object(id);
        
        
        mypath=path_add(); //creates an empty path...
        nearestTarget = instance_nearest(x,y,obj_player_blue);
        pathExists = mp_grid_path(AI_grid,mypath,x,y,nearestTarget.x,nearestTarget.y,true);
        
        if (pathExists)
        {
            path_set_kind(mypath,0); //Sets the path to allow diagonals
            path_set_precision(mypath,1); //Sets the precision to make it curvy. Can be 1-8. 1 is straight, 8 curvy...
        }
        else
        {
            instance_deactivate_object(id);
            mp_grid_clear_all(AI_grid);
            mp_grid_add_instances(AI_grid,obj_wall_hidden,false);
            //mp_grid_add_instances(AI_grid,obj_wall_hidden_red,false);
            instance_activate_object(id);
            mypath=path_add(); //creates an empty path...
            nearestTarget = instance_nearest(x,y,obj_player_blue);
            pathExists = mp_grid_path(AI_grid,mypath,x,y,nearestTarget.x,nearestTarget.y,true);
                 
        }
        createNewPath = false;
    }
}
