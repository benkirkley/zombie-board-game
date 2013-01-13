var itemList;
itemList[0] = obj_item_health;

randomize();
var dropItemCheck = floor(random(100));
if ( dropItemCheck >= 0 && dropItemCheck <= 75 ) var dropItemCheckResult = 0;
if ( dropItemCheck >= 67 && dropItemCheck <= 99 ) var dropItemCheckResult = 1;
show_message("dropItemCheckResult: "+ string(dropItemCheckResult) );

if ( dropItemCheckResult )
{
    randomize();
    var rollForItemToDrop = floor(random(100));
    if ( rollForItemToDrop >= 0 && rollForItemToDrop <= 99 ) var itemToDrop = 0;
    //if ( rollForItemToDrop >= 67 && rollForItemToDrop <= 99 ) var itemToDrop = 1;
    //show_message("numberOfPlayersToSpawn: "+ string(numberOfPlayersToSpawn) );
    
    for (ic=0; ic < 1; ic += 1)
    {
        if (ic == itemToDrop) instance_create(x,y,itemList[ic]);
    }

}
