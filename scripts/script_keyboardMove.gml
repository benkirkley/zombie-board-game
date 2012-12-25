/*
   When not moving, check to see if a direction key is held.
   If so, assign x/y speed and change status to moving.
*/
if (isMoving == false)
{
    if (actionPoints > 0 && obj_master.allPlayers[global.currentPlayer,0] == self.id)
    {
        //Arrow Keys and Numpad Keys
        if ( keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_numpad6) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = 0;
        }
    
        if ( keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_numpad8) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = -moveSpeed;
        }
    
        if ((keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_numpad4)) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = 0;
        }
    
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_numpad2) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = moveSpeed;
        }
        
        //Diagonal Numpad Keys
        if ( keyboard_check_pressed(vk_numpad1) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad3) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad7) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = -moveSpeed;
        }
        
        if ( keyboard_check_pressed(vk_numpad9) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
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
   //show_message("x: " + string(x) + "#y: " + string(y) + "#speedX: "+string(speedX) + "#speedY" + string(speedY) );
   x += speedX;
   y += speedY
    //show_message("x: " + string(x) + "#y: " + string(y));
   
   
    var colobject;
    //colobject = collision_point(x,y,obj_red2,1,1)
    colobject = collision_rectangle(x,y,x+sprite_width-1,y+sprite_height-1,obj_red2,true,true)
    if (colobject) 
    {

        show_message("x: " + string(x) + "#y: " + string(y));
        isMoving = false;
        x -= speedX;
        y -= speedY
        // show_message("x: " + string(x) + "#y: " + string(y));
    
    }   
   
   moveTimer -= moveSpeed;
   if (moveTimer == 0) isMoving = false;
   
    
}
