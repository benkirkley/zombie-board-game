var blockableObjects;
blockableObjects[0] = obj_wall_hidden;
blockableObjects[1] = self.object_index;
//blockableObjects[2] = obj_wall;

isMoving = false;
moveTimer=0;
actionPoints +=1 ;

for (i=0; i < 2; i+= 1)
{
    if (argument0 == blockableObjects[i])
    {
        return true;
    }

}

return false;
