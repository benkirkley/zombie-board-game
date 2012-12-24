/*
   When not moving, check to see if a direction key is held.
   If so, assign x/y speed and change status to moving.
*/
if (isMoving == false)
{
    if (actionPoints > 0 && obj_master.allPlayers[global.currentPlayer,0] == self.id)
    {
        if (keyboard_check(vk_right))
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = moveSpeed;
            speedY = 0;
        }
    
        if (keyboard_check(vk_up))
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = -moveSpeed;
        }
    
        if (keyboard_check(vk_left))
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = -moveSpeed;
            speedY = 0;
        }
    
        if (keyboard_check(vk_down))
        {
            destroyStatsWindow = true;
            actionPoints -=1 ;
            isMoving = true;
            moveTimer = gridSize;
            speedX = 0;
            speedY = moveSpeed;
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
   x += speedX;
   y += speedY

   moveTimer -= moveSpeed;
   if (moveTimer == 0) isMoving = false;
}
