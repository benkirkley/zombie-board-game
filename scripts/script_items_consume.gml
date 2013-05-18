itemType  = argument0;
itemString = argument1;
currentPlayerId = argument2;
collisionObjectId = argument3

if (itemType == "consumable")
{
    healPoints = ds_map_find_value(global.mapItemConsumableStats,string(itemString)+"_healPoints");
    //if (healPoints > currentPlayerId.totalHitPoints) healPoints = currentPlayerId.totalHitPoints;
    currentPlayerId.hitPoints = currentPlayerId.hitPoints + healPoints;
    if ( currentPlayerId.hitPoints > (currentPlayerId.totalHitPoints + equippedWeaponTotalHitPoints + equippedArmourTotalHitPoints) )
        currentPlayerId.hitPoints = (currentPlayerId.totalHitPoints + equippedWeaponTotalHitPoints + equippedArmourTotalHitPoints);
    
    combatResultFeedback = instance_create(x,y,obj_attack_result);
    combatResultFeedback.thisFont = combat_result_big;
    combatResultFeedback.thisText = "+" + string(healPoints) + "HP";
    combatResultFeedback.thisFillColor = c_lime;
    combatResultFeedback.thisOutlineColor = c_black;
   
    if (collisionObjectId.isUnique)
    {
        //show_message("TEST");
        ds_map_add(global.specialItemsMap, collisionObjectId, true);
    }
}

