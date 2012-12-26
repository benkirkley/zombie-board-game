// Stats for the object being attacked
var triggeredObjectStrength = argument0;
var triggeredObjectDefense = argument1;
var triggeredObjectAttack = argument2;
var triggeredObjectHitPoints = argument3;

show_message("Triggered Object" + 
            "#Str: " + string(triggeredObjectStrength) + 
            "#Def: " + string(triggeredObjectDefense) +
            "#Att: " + string(triggeredObjectAttack) +
            "#Hit: " + string(triggeredObjectHitPoints)
);

// Stats for the object attacking
var mainObjectStrength = obj_master.allPlayers[global.currentPlayer,0].strength;
var mainObjectDefense = obj_master.allPlayers[global.currentPlayer,0].defense;
var mainObjectAttack = obj_master.allPlayers[global.currentPlayer,0].attack;
var mainObjectHitPoints = obj_master.allPlayers[global.currentPlayer,0].hitPoints;

show_message("Main Object" + 
            "#Str: " + string(mainObjectStrength) + 
            "#Def: " + string(mainObjectDefense) +
            "#Att: " + string(mainObjectAttack) +
            "#Hit: " + string(mainObjectHitPoints)
);

