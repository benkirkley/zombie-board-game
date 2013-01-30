var objectToCheckWith = argument0;
var thisObject = argument1;
direction = angle;
image_angle = angle;

collisionObjectId = collision_point(finalX,finalY,objectToCheckWith,true,true)
if ( collisionObjectId && (objectToCheckWith != thisObject) ) 
{
    if ( script_collision_item(objectToCheckWith) )
    {
        //Find the item we've collided with
        script_which_item_is_this(objectToCheckWith,thisObject);
        return false;
    }
        
    if ( script_collision_wall(objectToCheckWith) )
    {
        //show_message("Blocked");
        return true; //blocking collision
    }
    else
    {
        //show_message("Attack");
        if (equippedWeaponNumberOfAttacks > 0)
        {
            script_combat_trigger(objectToCheckWith);
            //equippedWeaponNumberOfAttacks -= 1
        }
        else if (equippedArmourNumberOfAttacks > 0)
        {
            script_combat_trigger(objectToCheckWith);
            //equippedArmourNumberOfAttacks -= 1
        }
        else if (numberOfAttacks > 0)
        {
            script_combat_trigger(objectToCheckWith);
            //numberOfAttacks -= 1;
        }
    }
    
    return true; //blocking collision

}
else if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith == thisObject) )
{
    //show_message("Friendly, treat like a wall");
    script_collision_wall(objectToCheckWith)
    return true; //blocking collision
}

return false; //no blocking collision
