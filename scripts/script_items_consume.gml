itemType  = argument0;
itemString = argument1;
currentPlayerId = argument2;

if (itemType == "consumable")
{
    healPoints = ds_map_find_value(global.mapItemConsumableStats,string(itemString)+"_healPoints");
    if (healPoints > currentPlayerId.totalHitPoints) healPoints = currentPlayerId.totalHitPoints;
    currentPlayerId.hitPoints = healPoints;
    
    combatResultFeedback = instance_create(x,y,obj_attack_result);
    combatResultFeedback.thisFont = combat_result_big;
    combatResultFeedback.thisText = "+" + string(healPoints) + "HP";
    combatResultFeedback.thisFillColor = c_lime;
    combatResultFeedback.thisOutlineColor = c_black;
}

