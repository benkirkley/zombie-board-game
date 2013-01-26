var itemList;
itemList[0] = obj_item_consumable_medkit;

//These are the dice roll chances of an item dropping
var item_drop_chance_dice = 100;
var item_drop_chance_fail_start = 1;
var item_drop_chance_fail_end = 66;
var item_drop_chance_pass_start = 67;
var item_drop_chance_pass_end = 100;

//INI file -- read existing or create using defaults
ini_open("config.ini");
    item_drop_chance_dice = script_ini_read_key("Item_Drop","item_drop_chance_dice", item_drop_chance_dice,"real");
    item_drop_chance_fail_start = script_ini_read_key("Item_Drop","item_drop_chance_fail_start", item_drop_chance_fail_start,"real");
    item_drop_chance_fail_end = script_ini_read_key("Item_Drop","item_drop_chance_fail_end", item_drop_chance_fail_end,"real");
    item_drop_chance_pass_start = script_ini_read_key("Item_Drop","item_drop_chance_pass_start", item_drop_chance_pass_start,"real");
    item_drop_chance_pass_end = script_ini_read_key("Item_Drop","item_drop_chance_pass_end", item_drop_chance_pass_end,"real");
    
ini_close();

randomize();
var dropItemCheck = floor(random(item_drop_chance_dice)) + 1;
if ( dropItemCheck >= item_drop_chance_fail_start && dropItemCheck <= item_drop_chance_fail_end ) var dropItemCheckResult = 0;
if ( dropItemCheck >= item_drop_chance_pass_start && dropItemCheck <= item_drop_chance_pass_end ) var dropItemCheckResult = 1;
//dropItemCheckResult = 1;
if (global.debug_show_roll_for_chance_of_item_drop)
    show_message("Rolling d100 to see if item drops: " + string(dropItemCheck));
    

if ( dropItemCheckResult )
{
    //Roll to see what type of item will drop
    randomize();
    var rollForTypeOfItemToDrop = floor(random(100)) + 1;
    if ( rollForTypeOfItemToDrop >= 1 && rollForTypeOfItemToDrop <= 66 )
    {
        var itemToDrop = "consumable";
        var itemMapToUse = global.mapItemConsumableStats;
    }
    else if ( rollForTypeOfItemToDrop >= 67 && rollForTypeOfItemToDrop <= 83 )
    {
        var itemToDrop = "weapon";
        var itemMapToUse = global.mapItemArmourStats;
    }
    else if ( rollForTypeOfItemToDrop >= 84 && rollForTypeOfItemToDrop <= 100 ) 
    {
        var itemToDrop = "armour";
        var itemMapToUse = global.mapItemWeaponStats;
    }
    if (global.debug_show_roll_for_chance_of_item_drop)
        show_message( "Rolling d100 to see what type of item drops: " + string(rollForTypeOfItemToDrop) + " (" + string(itemToDrop) + ")" ) ;
    
    //Roll to see which item drops depending according to item type
    var rollForItemToDrop = floor(random(100)) + 1;
    if (itemToDrop == "consumable")
    {
        if ( rollForItemToDrop >= 1 && rollForItemToDrop <= 100 ) itemId = instance_create(x,y,obj_item_consumable_medkit);
    }
    else if (itemToDrop == "weapon")
    {
        if ( rollForItemToDrop >= 1 && rollForItemToDrop <= 25 ) itemId = instance_create(x,y,obj_item_weapon_axe);
        if ( rollForItemToDrop >= 26 && rollForItemToDrop <= 50 ) itemId = instance_create(x,y,obj_item_weapon_chainsaw);
        if ( rollForItemToDrop >= 51 && rollForItemToDrop <= 75 ) itemId = instance_create(x,y,obj_item_weapon_knife_kitchen);
        if ( rollForItemToDrop >= 76 && rollForItemToDrop <= 100 ) itemId = instance_create(x,y,obj_item_weapon_sword_rapier);
    }
    else if (itemToDrop == "armour")
    {
        if ( rollForItemToDrop >= 1 && rollForItemToDrop <= 33 ) itemId = instance_create(x,y,obj_item_armour_helmet_riot);
        if ( rollForItemToDrop >= 34 && rollForItemToDrop <= 66 ) itemId = instance_create(x,y,obj_item_armour_chest_riot);
        if ( rollForItemToDrop >= 67 && rollForItemToDrop <= 100 ) itemId = instance_create(x,y,obj_item_armour_shield_riot);
    }
    itemId.depth = -2;
}
