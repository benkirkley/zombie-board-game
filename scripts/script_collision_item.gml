for (ia=0; i < ds_list_size(global.dslist_AllItemObjects); ia += 1)
{   
    collidableObjects = ds_list_find_value(global.dslist_AllItemObjects,ia);
    if (argument0 == collidableObjects)
    {
        return true;
    }
}
return false;
