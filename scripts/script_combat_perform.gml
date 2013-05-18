// Stats for the object being attacked
    //Player
var triggeredObjectId = argument0;
var triggeredObjectDicePool = argument1;
var triggeredObjectDefense = argument2;
var triggeredObjectNumberOfAttacks = argument3;
var triggeredObjectHitPoints = argument4;
var triggeredObjectDamage = argument5;
var triggeredObjectName = argument6;
var triggeredObjectTotalNumberOfAttacks = argument7;
    //Weapon
var triggeredObjectWeaponName = triggeredObjectId.equippedWeaponName;
var triggeredObjectWeaponAttack = triggeredObjectId.equippedWeaponAttack;
var triggeredObjectWeaponDicePool = triggeredObjectId.equippedWeaponDicePool;
var triggeredObjectWeaponDefense = triggeredObjectId.equippedWeaponDefense;
var triggeredObjectWeaponTotalHitPoints = triggeredObjectId.equippedWeaponTotalHitPoints;
var triggeredObjectWeaponTotalActionPoints = triggeredObjectId.equippedWeaponTotalActionPoints;
var triggeredObjectWeaponDamage = triggeredObjectId.equippedWeaponDamage;
var triggeredObjectWeaponTotalNumberOfAttacks = triggeredObjectId.equippedWeaponTotalNumberOfAttacks;
    //Armour
var triggeredObjectArmourName = triggeredObjectId.equippedArmourName;
var triggeredObjectArmourAttack = triggeredObjectId.equippedArmourAttack;
var triggeredObjectArmourDicePool = triggeredObjectId.equippedArmourDicePool;
var triggeredObjectArmourDefense = triggeredObjectId.equippedArmourDefense;
var triggeredObjectArmourTotalHitPoints = triggeredObjectId.equippedArmourTotalHitPoints;
var triggeredObjectArmourTotalActionPoints = triggeredObjectId.equippedArmourTotalActionPoints;
var triggeredObjectArmourDamage = triggeredObjectId.equippedArmourDamage;
var triggeredObjectArmourTotalNumberOfAttacks = triggeredObjectId.equippedArmourTotalNumberOfAttacks;


//show_message(triggeredObjectWeaponDamage);

// Stats for the object attacking
    //Player
playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
var mainObjectId = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".playerId");
var mainObjectName = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".name");

var mainObjectAttack = mainObjectId.attack;
var mainObjectDicePool = mainObjectId.dicePool;
var mainObjectDefense = mainObjectId.defense;
var mainObjectNumberOfAttacks = mainObjectId.numberOfAttacks;
var mainObjectTotalNumberOfAttacks = mainObjectId.totalNumberOfAttacks
var mainObjectHitPoints = mainObjectId.hitPoints;
var mainObjectDamage = mainObjectId.damage;
    //Weapon
var mainObjectWeaponName = mainObjectId.equippedWeaponName;
var mainObjectWeaponAttack = mainObjectId.equippedWeaponAttack;
var mainObjectWeaponDicePool = mainObjectId.equippedWeaponDicePool;
var mainObjectWeaponDefense = mainObjectId.equippedWeaponDefense;
var mainObjectWeaponTotalHitPoints = mainObjectId.equippedWeaponTotalHitPoints;
var mainObjectWeaponTotalActionPoints = mainObjectId.equippedWeaponTotalActionPoints;
var mainObjectWeaponDamage = mainObjectId.equippedWeaponDamage;
var mainObjectWeaponTotalNumberOfAttacks = mainObjectId.equippedWeaponTotalNumberOfAttacks;
    //Armour
var mainObjectArmourName = mainObjectId.equippedArmourName;
var mainObjectArmourAttack = mainObjectId.equippedArmourAttack;
var mainObjectArmourDicePool = mainObjectId.equippedArmourDicePool;
var mainObjectArmourDefense = mainObjectId.equippedArmourDefense;
var mainObjectArmourTotalHitPoints = mainObjectId.equippedArmourTotalHitPoints;
var mainObjectArmourTotalActionPoints = mainObjectId.equippedArmourTotalActionPoints;
var mainObjectArmourDamage = mainObjectId.equippedArmourDamage;
var mainObjectIdArmourTotalNumberOfAttacks = mainObjectId.equippedArmourTotalNumberOfAttacks;



// Do comabat rolls
var attackResults;


//Show a summary of the attack about to take place
var displayResultsPreamble = string(mainObjectName) + " attacks " + string(triggeredObjectName) +
                            "##" + string(mainObjectName) + " has " + string(mainObjectDicePool + mainObjectWeaponDicePool + mainObjectArmourDicePool) + " chance(s) to " +
                            "roll a " + string(triggeredObjectDefense + triggeredObjectWeaponDefense + triggeredObjectArmourDefense) + " on a d" + string(mainObjectAttack) + "+" + string(mainObjectWeaponAttack + mainObjectArmourAttack);

if (global.debug_show_combat_rolls )    
    show_message(displayResultsPreamble);

//Perform the attack
var displayResults = "RESULT"
var numberOfHits = 0;

////Main attack loop
for(i = 0; i < (mainObjectDicePool + mainObjectWeaponDicePool + mainObjectArmourDicePool); i += 1){
    randomize();
    var resultOriginal = floor(random(mainObjectAttack) + 1 );
    result = resultOriginal + (mainObjectWeaponAttack + mainObjectArmourAttack);
    if (result < 1) result = 1;
    if (result > (mainObjectAttack + mainObjectWeaponAttack + mainObjectArmourAttack) ) result = mainObjectAttack + mainObjectWeaponAttack + mainObjectArmourAttack;
    attackResults[i] = result;
    displayResults += "##Dice Roll " + string(i+1);
    displayResults += "#    " + string(triggeredObjectName) + " defense: " + string(triggeredObjectDefense + triggeredObjectWeaponDefense + triggeredObjectArmourDefense)
                    + "#    " + string(mainObjectName) + " Rolls: " + string(result) + " (" + string(resultOriginal) + "+" + string(mainObjectWeaponAttack + mainObjectArmourAttack) + ")";
    
    if ( result >= (triggeredObjectDefense + triggeredObjectWeaponDefense + triggeredObjectArmourDefense) )
    {
        displayResults += "#---> SUCCESS";
        numberOfHits += 1;
    }
    else
    {
        displayResults += "#---> FAIL";
    }
}
displayResults += "##Number of Successes: " + string(numberOfHits);
var totalDamage = 0;
if ( numberOfHits > 0 )
{
    totalDamage = mainObjectDamage + mainObjectWeaponDamage + mainObjectArmourDamage;
}

displayResults += "##" + string(mainObjectName) + "'s DAM stat: " + string(mainObjectDamage + mainObjectWeaponDamage + mainObjectArmourDamage);
displayResults += "#Damage Inflicted: " + string(totalDamage);


if (mainObjectId.equippedWeaponNumberOfAttacks > 0)
{
    //script_combat_trigger(objectToCheckWith);
    mainObjectId.equippedWeaponNumberOfAttacks -= 1
}
else if (mainObjectId.equippedArmourNumberOfAttacks > 0)
{
    //script_combat_trigger(objectToCheckWith);
    mainObjectId.equippedArmourNumberOfAttacks -= 1
}
else if (numberOfAttacks > 0)
{
    //script_combat_trigger(objectToCheckWith);
    mainObjectId.numberOfAttacks -= 1;
}

//Deduct Hit Points
if (triggeredObjectId.equippedWeaponHitPoints > 0)
{
    triggeredObjectId.equippedWeaponHitPoints -= totalDamage;
}
else if (triggeredObjectId.equippedArmourHitPoints > 0)
{
    triggeredObjectId.equippedArmourHitPoints -= totalDamage;
}
else
{
    triggeredObjectId.hitPoints -= totalDamage;
}

if ( ds_map_exists(global.specialPlayersMap, triggeredObjectId ))
{
     var thisPlayersDataMap = ds_map_find_value(global.specialPlayersMap, triggeredObjectId );
     ds_map_replace(thisPlayersDataMap, "x", triggeredObjectId.x);
     ds_map_replace(thisPlayersDataMap, "y", triggeredObjectId.y);
     ds_map_replace(thisPlayersDataMap, "hit_points", triggeredObjectId.hitPoints);
     ds_map_replace(global.specialPlayersMap, triggeredObjectId, thisPlayersDataMap);
}

displayResults += "##" + string(triggeredObjectName) + " HP: " + string(triggeredObjectId.hitPoints) + "/" + string(triggeredObjectId.totalHitPoints); 

if (global.debug_show_combat_rolls )
    show_message(displayResults);

    
//TEXT: Floating daamage results above target's head
////Show no damage as "MISS" instead of zero
if (totalDamage = 0)
{
    totalDamage = "MISS";
    thisFont = combat_result_small
    thisFillColor = c_white
}
else
{
    thisFont = combat_result_big
    thisFillColor = c_red
}


combatResultFeedback = instance_create(triggeredObjectId.x,triggeredObjectId.y,obj_attack_result);
combatResultFeedback.thisFont = thisFont;
combatResultFeedback.thisText = string(totalDamage);
combatResultFeedback.thisFillColor = thisFillColor;
combatResultFeedback.thisOutlineColor = c_black;

return true;

