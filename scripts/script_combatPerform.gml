// Stats for the object being attacked
var triggeredObjectId = argument0;
var triggeredObjectDicePool = argument1;
var triggeredObjectDefense = argument2;
var triggeredObjectAttack = argument3;
var triggeredObjectHitPoints = argument4;
var triggeredObjectDamage = argument5;
var triggeredObjectName = argument6;

// Stats for the object attacking
//var mainObjectId = obj_master.allPlayers[global.currentPlayer,0] ;
gridCurrentTeam = ds_grid_get(obj_master.teamGrids, 1, global.currentTeam);
var mainObjectId = ds_grid_get(gridCurrentTeam, 0, global.currentPlayer);
var mainObjectName = ds_grid_get(gridCurrentTeam, 1, global.currentPlayer);
var mainObjectDicePool = mainObjectId.dicePool;
var mainObjectDefense = mainObjectId.defense;
var mainObjectAttack = mainObjectId.attack;
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

var displayResultsPreamble = string(mainObjectName) + " attacks " + string(triggeredObjectName) +
                            "##" + string(mainObjectName) + " has " + string(mainObjectDicePool) + " chance(s) to " +
                            "roll a " + string(triggeredObjectDefense) + " on a D" + string(attackDice);     
show_message(displayResultsPreamble);

var displayResults = "RESULT"
var numberOfHits = 0;

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
show_message(displayResults);




