typeOfWindow = argument0;
instanceId = argument1;
text="";

if (instance_exists(instanceId))
{
if (typeOfWindow == "player")
{
    text =  string(instanceId.name)
    +"#--------"
    +"#Attack Dice: d"+string(instanceId.attack
        + instanceId.equippedWeaponAttack
        + instanceId.equippedArmourAttack)
    +"#Dice: "+string(instanceId.dicePool 
        + instanceId.equippedWeaponDicePool
        + instanceId.equippedArmourDicePool)
    +"#DEF: "+ string(instanceId.defense
        + instanceId.equippedWeaponDefense
        + instanceId.equippedArmourDefense)
    +"#DAM: "+string(instanceId.damage
        + instanceId.equippedWeaponDamage
        + instanceId.equippedArmourDamage)
    +"#HP : "+string(instanceId.hitPoints
        + instanceId.equippedWeaponHitPoints
        + instanceId.equippedArmourHitPoints)
    +"/"+string(instanceId.totalHitPoints
        + instanceId.equippedWeaponTotalHitPoints
        + instanceId.equippedArmourTotalHitPoints)
    +"#Moves : "+string(instanceId.actionPoints
        + instanceId.equippedWeaponActionPoints
        + instanceId.equippedArmourActionPoints)
    +"/"+string(instanceId.totalActionPoints
        + instanceId.equippedWeaponTotalActionPoints
        + instanceId.equippedArmourTotalActionPoints)
    +"#Attacks : "+string(instanceId.numberOfAttacks
        + instanceId.equippedWeaponNumberOfAttacks
        + instanceId.equippedArmourNumberOfAttacks)
    +"/"+string(instanceId.totalNumberOfAttacks
        + instanceId.equippedWeaponTotalNumberOfAttacks
        + instanceId.equippedArmourTotalNumberOfAttacks)
    ;
}
else if (typeOfWindow == "item")
{
    switch(instanceId.itemType)
    {
        case "weapon":
            mapItemsStats = global.mapItemWeaponStats;
            //mapItemsStatsEnglish = global.mapAllItemStats;
        break;
        
        case "armour":
            mapItemsStats = global.mapItemArmourStats;
            //mapItemsStatsEnglish = global.mapAllItemStats;
        break;
        
        case "consumable":
            mapItemsStats = global.mapItemConsumableStats;
            //mapItemsStatsEnglish = global.mapAllItemStats;
        break;
        
        default:
    }
    
    thisItemObject = instanceId.object_index;
    itemString = ds_map_find_value(mapItemsStats, thisItemObject);
    itemName = ds_map_find_value(mapItemsStats, string(itemString)+"_name");
        text += string(itemName)
                +"#--------";
    
    var key = ds_map_find_first(global.mapAllItemStats);
    for (i=0; i < ds_map_size(global.mapAllItemStats); i+=1)
    {
        value = ds_map_find_value(global.mapAllItemStats, key);
        if (key != "name") script_stats_window_text_items(key, value);
        key = ds_map_find_next(global.mapAllItemStats, key);
    }
    
}

draw_set_font(font1);

text_width = string_width(text);
text_height =  string_height(text);

draw_set_color(c_navy);
draw_set_alpha(0.8);
draw_rectangle(x-6,y-6,x+text_width+6,y+text_height+6,false);
draw_set_alpha(1);

draw_set_color(c_lime);
draw_text(x,y,text);
}


