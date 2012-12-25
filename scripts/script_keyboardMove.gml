/*
   When not moving, check to see if a direction key is held.
   If so, assign x/y speed and change status to moving.
*/
if (isMoving == false)
{
    if (actionPoints > 0 && obj_master.allPlayers[global.currentPlayer,0] == self.id)
    {
        //Arrow Keys and Numpad Keys
        if ( keyboard_check(vk_right) || keyboard_check(vk_numpad6) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = 0;
        }
    
        if ( keyboard_check(vk_up) || keyboard_check(vk_numpad8) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = -moveSpeed;
        }
    
        if ((keyboard_check(vk_left) || keyboard_check(vk_numpad4)) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = 0;
        }
    
        if (keyboard_check(vk_down) || keyboard_check(vk_numpad2) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = moveSpeed;
        }
        
        //Diagonal Numpad Keys
        if ( keyboard_check(vk_numpad1) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check(vk_numpad3) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = moveSpeed;
        }
        
        if ( keyboard_check(vk_numpad7) )
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = -moveSpeed;
        }
        
        if ( keyboard_check(vk_numpad9) )
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
    //show_message("x: " + string(x) + "#y: " + string(y));
   x += speedX;
   y += speedY
    //show_message("x: " + string(x) + "#y: " + string(y));
   
   
    var colobject;
    colobject = collision_point(x,y,obj_red2,1,1)
    if (colobject) 
    {
    /*
        //show_message(colobject);
        isMoving = false;
        a = point_direction(colobject.x,colobject.y, x,y); //get the angle from the other object to this one
        
        x += lengthdir_x(1,a); //along the x axis
        y += lengthdir_y(1,a); //and the y axis
        show_message(x);
    */
       // show_message( "moveSpeed: "+ string(moveSpeed));
       // show_message("x: " + string(x) + "#y: " + string(y));
        isMoving = false;
        x -= speedX;
        y -= speedY
       // show_message("x: " + string(x) + "#y: " + string(y));
    
    }   
   
   moveTimer -= moveSpeed;
   if (moveTimer == 0) isMoving = false;
   
    
}
