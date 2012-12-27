/*
   When not moving, check to see if a direction key is held.
   If so, assign x/y speed and change status to moving.
*/
if (isMoving == false)
{
    gridCurrentTeam = ds_grid_get(obj_master.teamGrids, 1, global.currentTeam);
    currentPlayerId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
    
    if (actionPoints > 0 && currentPlayerId == self.id)
    {
        //Arrow Keys and Numpad Keys
        if ( keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_numpad6) )
        {
            destroyStatsWindow = true;
            isMoving = true;
            actionPoints -=1 ;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = 0;
        }
    
        if ( keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_numpad8) )
        {
            destroyStatsWindow = true;
            isMoving = true;
            actionPoints -=1 ;
            moveTimer = gridSize;
            speedX = 0;
            speedY = -moveSpeed;
        }
    
        if ((keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_numpad4)) )
        {
            destroyStatsWindow = true;
            isMoving = true;
            actionPoints -=1 ;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = 0;
        }
    
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_numpad2) )
        {
            destroyStatsWindow = true;
            isMoving = true;
            actionPoints -=1 ;
            moveTimer = gridSize;
            speedX = 0;
            speedY = moveSpeed;
        }
        
        //Diagonal Numpad Keys
        if ( keyboard_check_pressed(vk_numpad1) )
        {
            destroyStatsWindow = true;
            isMoving = true;
            actionPoints -=1 ;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad3) )
        {
            destroyStatsWindow = true;
            isMoving = true;
            actionPoints -=1 ;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad7) )
        {
            destroyStatsWindow = true;
            isMoving = true;
            actionPoints -=1 ;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = -moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad9) )
        {
            destroyStatsWindow = true;
            isMoving = true;
            actionPoints -=1 ;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = -moveSpeed;
        }
    }
}

/*
   When moving, subtract from moveTimer our moveSpeed value
   and update location relevant to set speeds.
   Stop moving when moveTimer reaches zero.
*/
if (isMoving == true)
{
    if (moveTimer == gridSize)
    {
        if (speedX != 0 ){
            finalX = x + ( (gridSize/moveSpeed) * speedX );
        } else {
            finalX = x;
        }
        
        if (speedY != 0 ){
            finalY = y + ( (gridSize/moveSpeed) * speedY );
        } else {
            finalY = y;
        }
        
        var thisObject = object_get_name(self.object_index); 
        var collidableObjects;
        collidableObjects[0]=obj_blue;
        collidableObjects[1]=obj_red;
        collidableObjects[2]=obj_wall;
        collidableObjects[3]=obj_wall_hidden;
        
        for (i=0; i < 4; i += 1) {
            collide = script_collision_perform(collidableObjects[i],self.object_index);
            if ( collide )
            {
                //show_message("collision");
                if ( script_collision_wall(collidableObjects[i]) )
                {
                    show_message("Blocked");   
                }
                return false;
            }
        }
       
        
        /*
        if ( (collision_point(finalX,finalY,obj_red,true,true)) && (thisObject != "obj_red") ) 
        {
            show_message("Trigger combat");
            //isMoving = false;
            //moveTimer=0;
            //script_combatTrigger(obj_red);
            return false;
        
        }
        else if ( (collision_point(finalX,finalY,obj_red,true,true)) && (thisObject == "obj_red") )
        {
            show_message("Friendly, treat like a wall");
            isMoving = false;
            moveTimer=0;
            actionPoints +=1 ;
            return false;
        }
        */
        
        
        /*
        if ( (collision_point(finalX,finalY,obj_red,true,true)) && thisObject != "obj_red" ) 
        {
            isMoving = false;
            moveTimer=0;
            script_combatTrigger(obj_red);
            return false;
        
        }
        else if (collision_point(finalX,finalY,obj_blue,true,true) && thisObject != "obj_blue") 
        {
            isMoving = false;
            moveTimer=0;
            script_combatTrigger(obj_blue);
            return false;
        
        }
        else if (collision_point(finalX,finalY,obj_wall,true,true))
        {
            isMoving = false;
            moveTimer=0;
            actionPoints +=1 ;
            return false;
        }
        else if (collision_point(finalX,finalY,obj_wall_hidden,true,true))
        {
            isMoving = false;
            moveTimer=0;
            actionPoints +=1 ;
            return false;
        }
        */
    }
    
    if (!collide) {
        x += speedX;
        y += speedY
        obj_master.playerYellowBorderId.x = x;
        obj_master.playerYellowBorderId.y = y;
        moveTimer -= moveSpeed;
        if (moveTimer == 0) isMoving = false;
    }
    
}
