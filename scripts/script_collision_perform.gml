var objectToCheckWith = argument0;
var thisObject = argument1;
direction = angle;
image_angle = angle;

if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith != thisObject) ) 
{
    if ( script_collision_wall(objectToCheckWith) )
    {
        //show_message("Blocked");
    }
    else
    {
        //show_message("Attack");
        var thisInstance = self.id
        if (thisInstance.numberOfAttacks) > 0 {
            thisInstance.numberOfAttacks -= 1;
            script_combat_trigger(objectToCheckWith);
        }
    }
    
    return true;

}
else if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith == thisObject) )
{
    //show_message("Friendly, treat like a wall");
    script_collision_wall(objectToCheckWith)
    return true;
}

return false;
