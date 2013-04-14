/* Initalise stats */
characterName = argument0

/*
//DEFAULT VALUES
name = "Joe Smith";
attack = 10;
dicePool=2;
defense=5;
totalHitPoints=5;
totalActionPoints=5;
damage = 2;
totalNumberOfAttacks = 1;
moveSpeed = 8;
*/

//INI file -- read existing or create using defaults
ini_open("config.ini");
    attack = script_ini_read_key("Blue Player Stats",string(characterName)+"_attack", attack,"real");
    dicePool = script_ini_read_key("Blue Player Stats",string(characterName)+"_dice_pool", dicePool,"real");
    defense = script_ini_read_key("Blue Player Stats",string(characterName)+"_defense", defense,"real");
    totalHitPoints = script_ini_read_key("Blue Player Stats",string(characterName)+"_max_hit_points", totalHitPoints,"real");
    totalActionPoints = script_ini_read_key("Blue Player Stats",string(characterName)+"_move_points", totalActionPoints,"real");
    damage = script_ini_read_key("Blue Player Stats",string(characterName)+"_damage", damage,"real");
    totalNumberOfAttacks = script_ini_read_key("Blue Player Stats",string(characterName)+"_number_of_attacks", totalNumberOfAttacks,"real");
ini_close();

hitPoints=totalHitPoints;
actionPoints=totalActionPoints;
numberOfAttacks = totalNumberOfAttacks;
attackDice = 10;


equippedWeaponName = "";
equippedWeaponAttack = 0;
equippedWeaponDicePool = 0;
equippedWeaponDefense = 0;
equippedWeaponDamage = 0;
equippedWeaponTotalHitPoints = 0;
equippedWeaponHitPoints = 0;
equippedWeaponTotalActionPoints = 0;
equippedWeaponActionPoints = 0;
equippedWeaponTotalNumberOfAttacks = 0;
equippedWeaponNumberOfAttacks = 0;
equippedWeaponString = "";

equippedArmourName = "";
equippedArmourAttack = 0;
equippedArmourDicePool = 0;
equippedArmourDefense = 0;
equippedArmourDamage = 0;
equippedArmourTotalHitPoints = 0;
equippedArmourHitPoints = 0;
equippedArmourTotalActionPoints = 0;
equippedArmourActionPoints = 0;
equippedArmourTotalNumberOfAttacks = 0;
equippedArmourNumberOfAttacks = 0;

equippedArmourString = "";

//equippedArmour = "item_armour_chest_riot";
//inventorySlotWeapon =string(equippedWeaponString) + "_inventory";
//inventorySlotArmour = string(equippedWeaponString) + "_inventory";

inventorySlotWeapon = 0;
inventorySlotArmour = 0;
equippedWeapon = 0;
equippedArmour = 0;

alarm[0]=1;
