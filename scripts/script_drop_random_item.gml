var itemList;
itemList[0] = obj_item_health;

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
    show_message("Rolling D100 to see if item drops: " + string(dropItemCheck));
    

if ( dropItemCheckResult )
{
    randomize();
    var rollForItemToDrop = floor(random(100)) + 1;
    if ( rollForItemToDrop >= 1 && rollForItemToDrop <= 100 ) var itemToDrop = 0;
    //if ( rollForItemToDrop >= 67 && rollForItemToDrop <= 100 ) var itemToDrop = 1;
    //show_message("rollForItemToDrop: "+ string(rollForItemToDrop) );
    
    for (ic=0; ic < 1; ic += 1)
    {
        if (ic == itemToDrop)
        {
            itemId = instance_create(x,y,itemList[ic]);
            itemId.depth=10;
        }
        ;
    }

}
