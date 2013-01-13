// Stats for the object being attacked
var triggeredObjectId = argument0;
var triggeredObjectDicePool = argument1;
var triggeredObjectDefense = argument2;
var triggeredObjectNumberOfAttacks = argument3;
var triggeredObjectHitPoints = argument4;
var triggeredObjectDamage = argument5;
var triggeredObjectName = argument6;
var triggeredObjectTotalNumberOfAttacks = argument7;

// Stats for the object attacking
playerDataMap = ds_grid_get(global.teamGrids, 6, global.currentTeam);
var mainObjectId = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".playerId");
var mainObjectName = ds_map_find_value(playerDataMap,string(global.currentPlayer)+".name");

var mainObjectDicePool = mainObjectId.dicePool;
var mainObjectDefense = mainObjectId.defense;
var mainObjectNumberOfAttacks = mainObjectId.numberOfAttacks;
var mainObjectTotalNumberOfAttacks = mainObjectId.totalNumberOfAttacks
var mainObjectHitPoints = mainObjectId.hitPoints;
var mainObjectDamage = mainObjectId.damage;

//Debug output for variables declared above
/*
show_message("Triggered Object" + 
            "#Dice: " + string(triggeredObjectDicePool) + 
            "#Def: " + string(triggeredObjectDefense) +
            "#Att: " + string(triggeredObjectAttack) +
            "#Hit: " + string(triggeredObjectHitPoints)
);



show_message("Main Object" + 
            "#Dice: " + string(mainObjectDicePool) + 
            "#Def: " + string(mainObjectDefense) +
            "#Att: " + string(mainObjectAttack) +
            "#Hit: " + string(mainObjectHitPoints)
);
*/

// Do comabat rolls
var attackDice = 10;
var attackResults;


//Show a summary of the attack about to take place
var displayResultsPreamble = string(mainObjectName) + " attacks " + string(triggeredObjectName) +
                            "##" + string(mainObjectName) + " has " + string(mainObjectDicePool) + " chance(s) to " +
                            "roll a " + string(triggeredObjectDefense) + " on a D" + string(attackDice);

if (global.debug_show_combat_rolls )    
    show_message(displayResultsPreamble);

//Perform the attack
var displayResults = "RESULT"
var numberOfHits = 0;

////Main attack loop
for(i = 0; i < mainObjectDicePool; i += 1){
    randomize();
    var result = floor(random(attackDice)) + 1;
    if (result < 1) result = 1;
    if (result > (attackDice) ) result = attackDice;
    attackResults[i] = result;
    displayResults += "##Dice Roll " + string(i+1);
    displayResults += "#    " + string(triggeredObjectName) + " defense: " + string(triggeredObjectDefense) + "#    " + string(mainObjectName) + " Rolls: " + string(result);
    
    if ( result >= triggeredObjectDefense )
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
    totalDamage = mainObjectDamage
}

displayResults += "##" + string(mainObjectName) + "'s DAM stat: " + string(mainObjectDamage);
displayResults += "#Damage Inflicted: " + string(totalDamage);

triggeredObjectId.hitPoints -= totalDamage;
displayResults += "##" + string(triggeredObjectName) + " HP: " + string(triggeredObjectId.hitPoints) + "/" + string(triggeredObjectId.totalHitPoints); 

if (global.debug_show_combat_rolls )
    show_message(displayResults);

    
//TEXT: Floating daamage results above target's head
////Show no damage as text instead of zero
if (totalDamage = 0)
{
    totalDamage = "MISS";
    thisFont = combat_result_small
}
else
{
    thisFont = combat_result_big
}

combatResultFeedback = instance_create(triggeredObjectId.x,triggeredObjectId.y,obj_attack_result);
combatResultFeedback.thisText = string(totalDamage);
combatResultFeedback.thisFillColor = c_red;
combatResultFeedback.thisOutlineColor = c_black;


