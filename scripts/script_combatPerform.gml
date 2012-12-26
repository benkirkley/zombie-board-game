// Stats for the object being attacked
var triggeredObjectId = argument0
var triggeredObjectDicePool = argument1;
var triggeredObjectDefense = argument2;
var triggeredObjectAttack = argument3;
var triggeredObjectHitPoints = argument4;
var triggeredObjectDamage = argument5;

// Stats for the object attacking
var mainObjectId = obj_master.allPlayers[global.currentPlayer,0] ;
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
*/

/*
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
var displayResults = "Combat Rolls";
var numberOfHits = 0;

for(i = 0; i < mainObjectDicePool; i += 1){
    randomize();
    var result = floor(random(attackDice)) + 1;
    if (result < 1) result = 1;
    if (result > (attackDice) ) result = attackDice;
    attackResults[i] = result;
    displayResults += "##Dice Number " + string(i+1);
    displayResults += "#    Enemy defense: " + string(triggeredObjectDefense) + "#    Your Roll: " + string(result);
    
    if ( result >= triggeredObjectDefense )
    {
        displayResults += "#---> HIT";
        numberOfHits += 1;
    }
    else
    {
        displayResults += "#---> MISS";
    }
}
displayResults += "##Number of Hits: " + string(numberOfHits);
var totalDamage = 0;
if ( numberOfHits > 0 )
{
    totalDamage = mainObjectDamage
}

displayResults += "#Total Damage: " + string(totalDamage);

triggeredObjectId.hitPoints -= totalDamage;
displayResults += "#HP Left: " + string(triggeredObjectId.hitPoints); 
show_message(displayResults);




