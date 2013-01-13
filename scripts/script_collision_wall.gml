var blockableObjects;
blockableObjects[0] = obj_wall_hidden;
blockableObjects[1] = self.object_index;

isMoving = false;
moveTimer=0;

for (ib=0; ib < 2; ib+= 1)
{
    if (argument0 == blockableObjects[ib])
    {
        return true;
    }

}

return false;

