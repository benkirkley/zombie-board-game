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
    if (moveTimer == gridSize) {
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
        
        var colobject;
        if (collision_point(finalX,finalY,obj_red,true,true)) 
        {
            isMoving = false;
            moveTimer=0;
            script_combatTrigger(obj_red);
            return false;
        
        }
        if (collision_point(finalX,finalY,obj_blue,true,true)) 
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
         
    }

    x += speedX;
    y += speedY
    moveTimer -= moveSpeed;
    if (moveTimer == 0) isMoving = false;
   
    
}
