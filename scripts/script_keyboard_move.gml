/*
   When not moving, check to see if a direction key is held.
   If so, assign x/y speed and change status to moving.
*/
if (isMoving == false && amICurrentPlayer == true)
{   
    //DEBUG:  use numpad 5 to being up a debug dialog
    
    if ( keyboard_check_pressed( vk_numpad5 ) )
    {
        //DEBUG HERE
        show_message(id);
    }
    
    if ( keyboard_check_pressed( vk_enter ) )
    {
        global.endTurn = true;
    }
    
    
    
    
    if (currentPlayerId == self.id && ( (actionPoints + equippedWeaponActionPoints + equippedArmourActionPoints) > 0 || (numberOfAttacks  + equippedWeaponNumberOfAttacks + equippedArmourNumberOfAttacks) > 0) )
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
