/*
   When not moving, check to see if a direction key is held.
   If so, assign x/y speed and change status to moving.
*/
if (isMoving == false && amICurrentPlayer == true)
{   
    //DEBUG:  use numpad 5 to being up a debug dialog
    if ( keyboard_check_pressed(vk_numpad5) )
    {
        //show_message("Enter debug here");
    }
    if (currentPlayerId == self.id && numberOfAttacks > 0 )
    {
        //Arrow Keys and Numpad Keys
        if ( keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_numpad6) )
        {
            direction = 270;
            image_angle = 270;
            destroyStatsWindow = true;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = 0;
        }
    
        if ( keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_numpad8) )
        {
            direction = 0;
            image_angle = 0;
            destroyStatsWindow = true;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = -moveSpeed;
        }
    
        if ((keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_numpad4)) )
        {
            direction = 90;
            image_angle = 90;
            destroyStatsWindow = true;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = 0;
        }
    
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_numpad2) )
        {
            direction = 180;
            image_angle = 180;
            destroyStatsWindow = true;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = moveSpeed;
        }
        
        //Diagonal Numpad Keys
        if ( keyboard_check_pressed(vk_numpad1) )
        {
            direction = 135;
            image_angle = 135;
            destroyStatsWindow = true;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad3) )
        {
            direction = 225;
            image_angle = 225;
            destroyStatsWindow = true;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad7) )
        {
            direction = 45;
            image_angle = 45;
            destroyStatsWindow = true;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = -moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad9) )
        {
            direction = 315;
            image_angle = 315;
            destroyStatsWindow = true;
            isMoving = true;
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
    //Check if final resting position is occupied
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
        collidableObjects[0]=obj_player_blue;
        collidableObjects[1]=obj_player_red;
        collidableObjects[2]=obj_wall_hidden;
        
        for (i=0; i < 3; i += 1) {
            collide = script_collision_perform(collidableObjects[i],self.object_index);
            if ( collide )
            {
                //show_message("Collision");
                return false;
            }
        }
    }
    
    //Move if no collision and player has moves
    if ( !collide && actionPoints > 0 ) {
        x += speedX;
        y += speedY
        moveTimer -= moveSpeed;
        if (moveTimer == 0)
        {
            isMoving = false;
            actionPoints -=1 ;
            collide = 1;
        }
    }
    
}
