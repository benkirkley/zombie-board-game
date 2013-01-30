/***************************************************
  This script will destroy an item instance on the 
  floor in preparation for it going into the player's
  inventory.
 ***************************************************/
if (global.equippedWeapon) 
    with (global.equippedWeaponId) instance_destroy();
if (global.equippedArmour)
    with (global.equippedArmourId) instance_destroy();
