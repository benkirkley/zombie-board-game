
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
       
        for (i=0; i < ds_list_size(global.collidableObjects); i+=1)
        {   
            collide = script_collision_perform( ds_list_find_value(global.collidableObjects,i), self.object_index);
            if ( collide )
            {
                //show_message("Collision");
                return false;
            }
        }
    }
    //Move if no collision and player has moves
    if ( !collide && (actionPoints + equippedWeaponActionPoints + equippedArmourActionPoints) > 0 )
    {
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
            if (equippedWeaponActionPoints > 0)
            {
                equippedWeaponActionPoints -= 1;
            }
            else if (equippedArmourActionPoints > 0)
            {
                equippedArmourActionPoints -= 1;
            }
            else
            {
                actionPoints -=1 ;
            }
            collide = 1;
        }
    }
    else
    {
        isMoving = false;
    }
}
