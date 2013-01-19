/***************************************************
  This script reads config.ini for default item
  stats. It then adds the item to a global data 
  store.
 ***************************************************/

dataMapToUse = argument0;

itemName = script_ini_read_key("Items",string(itemString)+"_name", itemName,"string");
itemAttack = script_ini_read_key("Items",string(itemString)+"_attack", itemAttack,"real");
itemDamage = script_ini_read_key("Items",string(itemString)+"_damage", itemDamage,"real");
itemDefense = script_ini_read_key("Items",string(itemString)+"_defense", itemDefense,"real");
itemDicePool = script_ini_read_key("Items",string(itemString)+"_dicePool", itemDicePool,"real");
itemTotalHitPoints = script_ini_read_key("Items",string(itemString)+"_totalHitPoints", itemTotalHitPoints,"real");
itemTotalActionPoints = script_ini_read_key("Items",string(itemString)+"_totalActionPoints", itemTotalActionPoints,"real");
itemTotalNumberOfAttacks = script_ini_read_key("Items",string(itemString)+"_totalNumberOfAttacks", itemTotalNumberOfAttacks,"real");

ds_map_add(dataMapToUse,string(itemString)+"_name",itemName);
ds_map_add(dataMapToUse,string(itemString)+"_attack",itemAttack);
ds_map_add(dataMapToUse,string(itemString)+"_damage",itemDamage);
ds_map_add(dataMapToUse,string(itemString)+"_defense",itemDefense);
ds_map_add(dataMapToUse,string(itemString)+"_dicePool",itemDicePool);
ds_map_add(dataMapToUse,string(itemString)+"_totalHitPoints",itemTotalHitPoints);
ds_map_add(dataMapToUse,string(itemString)+"_totalActionPoints",itemTotalActionPoints);
ds_map_add(dataMapToUse,string(itemString)+"_totalNumberOfAttacks",itemTotalNumberOfAttacks);
