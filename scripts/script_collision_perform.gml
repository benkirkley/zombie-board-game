var objectToCheckWith = argument0;
var thisObject = argument1;


if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith != thisObject) ) 
{
    show_message("Trigger combat");
    //isMoving = false;
    //moveTimer=0;
    //script_combatTrigger(obj_red);
    return true;

}
else if ( (collision_point(finalX,finalY,objectToCheckWith,true,true)) && (objectToCheckWith == thisObject) )
{
    show_message("Friendly, treat like a wall");
    return true;
}

return false;
