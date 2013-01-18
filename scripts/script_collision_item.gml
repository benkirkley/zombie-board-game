var itemObjects;
//itemObjects[0] = obj_item_consumable_medkit;
itemObjects[0] = obj_item_weapon_chainsaw;

for (ia=0; ia < 1; ia +=1)
{
    if (argument0 == itemObjects[ia])
    {
        return true;
    }
}

return false;
