var itemObjects;
itemObjects[0] = obj_item_weapon_chainsaw;
itemObjects[1] = obj_item_weapon_axe;

//var itemObjects = ds_list_create();
//ds_list_add(itemObjects, obj_item_weapon_chainsaw);
//ds_list_add(itemObjects, obj_item_weapon_axe);


//for (ia=0; ia < ds_list_size(itemObjects) - 1; ia +=1)
for (ia=0; ia < 2; ia +=1)
{
    if (argument0 == itemObjects[ia])
    {
        return true;
    }
}

return false;
