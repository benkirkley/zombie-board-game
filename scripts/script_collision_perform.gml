var objectToCheckWith = argument0;
var thisObject = argument1;
direction = angle;
image_angle = angle;

collisionObjectId = collision_point(finalX,finalY,objectToCheckWith,true,true)
if ( collisionObjectId && (objectToCheckWith != thisObject) ) 
{
    if ( script_collision_item(objectToCheckWith) )
    {
        //Only allow team0 (blue) to pick up items
        if (id.thisTeamId == 0)
        {
            with (collisionObjectId) { instance_destroy(); }
            id.hitPoints = id.totalHitPoints;
        }
        return false; //no blocking collision
    }
    
    if ( script_collision_wall(objectToCheckWith) )
    {
        //show_message("Blocked");
        return true; //blocking collision
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
    return true; //blocking collision

}
else if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith == thisObject) )
{
    //show_message("Friendly, treat like a wall");
    script_collision_wall(objectToCheckWith)
    return true; //blocking collision
}

return false; //no blocking collision
