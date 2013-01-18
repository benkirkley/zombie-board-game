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
        show_message(global.currentPlayer);
    }
    if (currentPlayerId == self.id && ( actionPoints > 0 || numberOfAttacks > 0) )
    {
        //Arrow Keys and Numpad Keys
        if ( keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_numpad6) )
        {
            angle = 270;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = 0;
        }
    
        if ( keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_numpad8) )
        {
            angle = 0;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = -moveSpeed;
        }
    
        if ((keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_numpad4)) )
        {
            angle = 90;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = 0;
        }
    
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_numpad2) )
        {
            angle = 180;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = moveSpeed;
        }
        
        //Diagonal Numpad Keys
        if ( keyboard_check_pressed(vk_numpad1) )
        {
            angle = 135;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad3) )
        {
            angle = 225;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad7) )
        {
            angle = 45;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = -moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad9) )
        {
            angle = 315;
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
//if ( isMoving == true || (isMoving == false && moveTimer >= 0 && moveTimer < gridSize ) )
if ( isMoving == true )
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
        collidableObjects[3]=obj_item_consumable_medkit;
        collidableObjects[4]=obj_item_weapon_chainsaw;
        
        for (i=0; i < 5; i += 1)
        {          
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
        
        direction = angle;
        image_angle = angle;
        x += speedX;
        y += speedY;
        moveTimer -= moveSpeed;
        image_speed=1;
        script_stats_window_destroy();
                
        if (moveTimer == 0)
        {
            image_speed=0;
            image_index += 1;
            isMoving = false;
            actionPoints -=1 ;
            collide = 1;
        }
    }
    
}
