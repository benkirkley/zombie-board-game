forceDropToPass = argument0;
skipConsumableDrop  = argument1;

if (forceDropToPass && global.debug_show_roll_for_chance_of_item_drop) show_message("Forcing an item to drop on the map...");

//These are the dice roll chances of an item dropping
var item_drop_chance_dice = 100;
var item_drop_chance_fail_start = 1;
var item_drop_chance_fail_end = 66;
var item_drop_chance_pass_start = 67;
var item_drop_chance_pass_end = 100;

////What type of item should we drop?
var item_type_drop_chance_dice = 100;
var item_type_drop_chance_consumable_dice_start = 1;
var item_type_drop_chance_consumable_dice_end = 65;
var item_type_drop_chance_weapon_dice_start = 66;
var item_type_drop_chance_weapon_dice_end = 83;
var item_type_drop_chance_armour_dice_start = 84;
var item_type_drop_chance_armour_dice_end = 100;

////What is the actual item to drop?
var which_item_to_drop_dice = 100;
//////Consumables
var comsumable_to_drop_medkit_start = 1;
var comsumable_to_drop_medkit_end = 100;
//////Weapons
var weapon_to_drop_axe_start = 1;
var weapon_to_drop_axe_end = 25;
var weapon_to_drop_chainsaw_start = 26;
var weapon_to_drop_chainsaw_end = 50;
var weapon_to_drop_knife_kitchen_start = 51;
var weapon_to_drop_knife_kitchen_end = 75;
var weapon_to_drop_sword_rapier_start = 76;
var weapon_to_drop_sword_rapier_end = 100;
//////Armour
var armour_to_drop_helmet_riot_start = 1;
var armour_to_drop_helmet_riot_end = 33;
var armour_to_drop_chest_riot_start = 34;
var armour_to_drop_chest_riot_end = 66;
var armour_to_drop_shield_riot_start = 67;
var armour_to_drop_shield_riot_end = 100;


//INI file -- read existing or create using defaults
ini_open("config.ini");
    item_drop_chance_dice = script_ini_read_key("Item_Drop","item_drop_chance_dice", item_drop_chance_dice,"real");
    item_drop_chance_fail_start = script_ini_read_key("Item_Drop","item_drop_chance_fail_start", item_drop_chance_fail_start,"real");
    item_drop_chance_fail_end = script_ini_read_key("Item_Drop","item_drop_chance_fail_end", item_drop_chance_fail_end,"real");
    item_drop_chance_pass_start = script_ini_read_key("Item_Drop","item_drop_chance_pass_start", item_drop_chance_pass_start,"real");
    item_drop_chance_pass_end = script_ini_read_key("Item_Drop","item_drop_chance_pass_end", item_drop_chance_pass_end,"real");
    
    item_type_drop_chance_dice = script_ini_read_key("Item_Drop","item_type_drop_chance_dice", item_type_drop_chance_dice,"real");
    item_type_drop_chance_consumable_dice_start = script_ini_read_key("Item_Drop","item_type_drop_chance_consumable_dice_start", item_type_drop_chance_consumable_dice_start,"real");
    item_type_drop_chance_consumable_dice_end = script_ini_read_key("Item_Drop","item_type_drop_chance_consumable_dice_end", item_type_drop_chance_consumable_dice_end,"real");
    item_type_drop_chance_weapon_dice_start = script_ini_read_key("Item_Drop","item_type_drop_chance_weapon_dice_start", item_type_drop_chance_weapon_dice_start,"real");
    item_type_drop_chance_weapon_dice_end = script_ini_read_key("Item_Drop","item_type_drop_chance_weapon_dice_end", item_type_drop_chance_weapon_dice_end,"real");
    item_type_drop_chance_armour_dice_start = script_ini_read_key("Item_Drop","item_type_drop_chance_armour_dice_start", item_type_drop_chance_armour_dice_start,"real");
    item_type_drop_chance_armour_dice_end = script_ini_read_key("Item_Drop","item_type_drop_chance_armour_dice_end", item_type_drop_chance_armour_dice_end,"real");
    
    which_item_to_drop_dice = script_ini_read_key("Item_Drop","which_item_to_drop_dice", which_item_to_drop_dice,"real");
    comsumable_to_drop_medkit_start = script_ini_read_key("Item_Drop","comsumable_to_drop_medkit_start", comsumable_to_drop_medkit_start,"real");
    comsumable_to_drop_medkit_end = script_ini_read_key("Item_Drop","comsumable_to_drop_medkit_end", comsumable_to_drop_medkit_end,"real");
    weapon_to_drop_axe_start = script_ini_read_key("Item_Drop","weapon_to_drop_axe_start", weapon_to_drop_axe_start,"real");
    weapon_to_drop_axe_end = script_ini_read_key("Item_Drop","weapon_to_drop_axe_end", weapon_to_drop_axe_end,"real");
    weapon_to_drop_chainsaw_start = script_ini_read_key("Item_Drop","weapon_to_drop_chainsaw_start", weapon_to_drop_chainsaw_start,"real");
    weapon_to_drop_chainsaw_end = script_ini_read_key("Item_Drop","weapon_to_drop_chainsaw_end", weapon_to_drop_chainsaw_end,"real");
    weapon_to_drop_knife_kitchen_start = script_ini_read_key("Item_Drop","weapon_to_drop_knife_kitchen_start", weapon_to_drop_knife_kitchen_start,"real");
    weapon_to_drop_knife_kitchen_end = script_ini_read_key("Item_Drop","weapon_to_drop_knife_kitchen_end", weapon_to_drop_knife_kitchen_end,"real");
    weapon_to_drop_sword_rapier_start = script_ini_read_key("Item_Drop","weapon_to_drop_sword_rapier_start", weapon_to_drop_sword_rapier_start,"real");
    weapon_to_drop_sword_rapier_end = script_ini_read_key("Item_Drop","weapon_to_drop_sword_rapier_end", weapon_to_drop_sword_rapier_end,"real");
    armour_to_drop_helmet_riot_start = script_ini_read_key("Item_Drop","armour_to_drop_helmet_riot_start", armour_to_drop_helmet_riot_start,"real");
    armour_to_drop_helmet_riot_end = script_ini_read_key("Item_Drop","armour_to_drop_helmet_riot_end", armour_to_drop_helmet_riot_end,"real");
    armour_to_drop_chest_riot_start = script_ini_read_key("Item_Drop","armour_to_drop_chest_riot_start", armour_to_drop_chest_riot_start,"real");
    armour_to_drop_chest_riot_end = script_ini_read_key("Item_Drop","armour_to_drop_chest_riot_end", armour_to_drop_chest_riot_end,"real");
    armour_to_drop_shield_riot_start = script_ini_read_key("Item_Drop","armour_to_drop_shield_riot_start", armour_to_drop_shield_riot_start,"real");
    armour_to_drop_shield_riot_end = script_ini_read_key("Item_Drop","armour_to_drop_shield_riot_end", armour_to_drop_shield_riot_end,"real");
    
    
ini_close();

randomize();
var dropItemCheck = floor(random(item_drop_chance_dice)) + 1;
if ( dropItemCheck >= item_drop_chance_fail_start && dropItemCheck <= item_drop_chance_fail_end ) var dropItemCheckResult = 0;
if ( dropItemCheck >= item_drop_chance_pass_start && dropItemCheck <= item_drop_chance_pass_end ) var dropItemCheckResult = 1;
if (forceDropToPass) dropItemCheckResult = 1; //force this check to pass and let an item drop
if (global.debug_show_roll_for_chance_of_item_drop)
    show_message("Rolling d100 to see if item drops: " + string(dropItemCheck) + " #(" + string(dropItemCheckResult) + ")" );

if ( dropItemCheckResult )
{
    //Roll to see what type of item will drop
    randomize();
    var rollForTypeOfItemToDrop = floor(random(item_type_drop_chance_dice)) + 1;
    if (skipConsumableDrop == true && ( rollForTypeOfItemToDrop >= item_type_drop_chance_consumable_dice_start && rollForTypeOfItemToDrop <= item_type_drop_chance_consumable_dice_end ) )
        rollForTypeOfItemToDrop += item_type_drop_chance_consumable_dice_end //skip consumable items
    
    if ( rollForTypeOfItemToDrop >= item_type_drop_chance_consumable_dice_start && rollForTypeOfItemToDrop <= item_type_drop_chance_consumable_dice_end )
    {
        var itemToDrop = "consumable";
        var itemMapToUse = global.mapItemConsumableStats;
    }
    else if ( rollForTypeOfItemToDrop >= item_type_drop_chance_weapon_dice_start && rollForTypeOfItemToDrop <= item_type_drop_chance_weapon_dice_end )
    {
        var itemToDrop = "weapon";
        var itemMapToUse = global.mapItemArmourStats;
    }
    else if ( rollForTypeOfItemToDrop >= item_type_drop_chance_armour_dice_start && rollForTypeOfItemToDrop <= item_type_drop_chance_armour_dice_end ) 
    {
        var itemToDrop = "armour";
        var itemMapToUse = global.mapItemWeaponStats;
    }
    if (global.debug_show_roll_for_chance_of_item_drop)
        show_message( "Rolling d100 to see what type of item drops: " + string(rollForTypeOfItemToDrop) + " #(" + string(itemToDrop) + ")" ) ;
    
    //Roll to see which item drops depending according to item type
    var rollForItemToDrop = floor(random(which_item_to_drop_dice)) + 1;
    if (itemToDrop == "consumable")
    {
        if ( rollForItemToDrop >= comsumable_to_drop_medkit_start && rollForItemToDrop <= comsumable_to_drop_medkit_end ) itemId = instance_create(x,y,obj_item_consumable_medkit);
    }
    else if (itemToDrop == "weapon")
    {
        if ( rollForItemToDrop >= weapon_to_drop_axe_start && rollForItemToDrop <= weapon_to_drop_axe_end ) itemId = instance_create(x,y,obj_item_weapon_axe);
        if ( rollForItemToDrop >= weapon_to_drop_chainsaw_start && rollForItemToDrop <= weapon_to_drop_chainsaw_end ) itemId = instance_create(x,y,obj_item_weapon_chainsaw);
        if ( rollForItemToDrop >= weapon_to_drop_knife_kitchen_start && rollForItemToDrop <= weapon_to_drop_knife_kitchen_end ) itemId = instance_create(x,y,obj_item_weapon_knife_kitchen);
        if ( rollForItemToDrop >= weapon_to_drop_sword_rapier_start && rollForItemToDrop <= weapon_to_drop_sword_rapier_end ) itemId = instance_create(x,y,obj_item_weapon_sword_rapier);
    }
    else if (itemToDrop == "armour")
    {
        if ( rollForItemToDrop >= armour_to_drop_helmet_riot_start && rollForItemToDrop <= armour_to_drop_helmet_riot_end ) itemId = instance_create(x,y,obj_item_armour_helmet_riot);
        if ( rollForItemToDrop >= armour_to_drop_chest_riot_start && rollForItemToDrop <= armour_to_drop_chest_riot_end ) itemId = instance_create(x,y,obj_item_armour_chest_riot);
        if ( rollForItemToDrop >= armour_to_drop_shield_riot_start && rollForItemToDrop <= armour_to_drop_shield_riot_end ) itemId = instance_create(x,y,obj_item_armour_shield_riot);
    }
    show_message( "Finally, rolling d100 to see which item is dropped: " + string(rollForItemToDrop) + " #(" + string(object_get_name(itemId.object_index)) + ")" ) ;
    itemId.depth = -2;
}
