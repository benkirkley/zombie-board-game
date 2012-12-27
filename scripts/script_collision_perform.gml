var objectToCheckWith = argument0;
var thisObject = argument1;


if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith != thisObject) ) 
{
    if ( script_collision_wall(objectToCheckWith) )
    {
        //show_message("Blocked");
    }
    else
    {
        //show_message("Attack");
        script_combatTrigger(objectToCheckWith);
    }
    
    return true;

}
else if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith == thisObject) )
{
    show_message("Friendly, treat like a wall");
    script_collision_wall(objectToCheckWith)
    //actionPoints +=1 ;
    return true;
}

return false;
