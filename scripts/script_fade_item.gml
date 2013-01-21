//Fade if this item shares the same square as a player

listPlayerObjects = ds_list_create();
ds_list_add(listPlayerObjects, obj_player_blue);
ds_list_add(listPlayerObjects, obj_player_red);

for (i=0; i < ds_list_size(listPlayerObjects); i += 1)
{
    tempObject = ds_list_find_value(listPlayerObjects, i);
    checkCollision = collision_point(x,y,tempObject,false,true);
    if ( checkCollision != noone )
    {
        image_alpha = 0.5;
        i=ds_list_size(listPlayerObjects); //break loop
        itemFade = tempObject;
    }
    else
    {
       if ( itemFade == tempObject && image_alpha != 1 ) 
        {
            image_alpha = 1;
            i=ds_list_size(listPlayerObjects); //break loop
            itemFade = 0;
        }
    }
}

