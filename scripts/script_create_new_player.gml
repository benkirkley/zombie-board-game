/* This script is called to create a new player based on the given parameters */

var teamId = argument0;
var startingPositionX = argument1;
var startingPositionY = argument2;
var thisObject = argument3;
var teamName = argument4;
var thisTeamsGrid = argument5;
var counter = argument6;

/*
show_message("startingPositonX: " + string(startingPositionX)
            +"#startingPositonY: " + string(startingPositionY)
            +"#thisObject: " + string(thisObject)
            +"#teamName: " + string(teamName)
            +"#thisTeamsGrid: " + string(thisTeamsGrid)
            +"#teamId: " + string(teamId)
            +"#counter: " + string(counter)
            );
*/

global.totalPlayers += 1;
startingPositionY += (128 * counter);

//CREATE the instance and assign some initial variables
var playerId = instance_create(startingPositionX,startingPositionY,thisObject);

playerId.thisTeamId = teamId;
playerId.thisPlayerId = counter;
//playerId.name = chr(34) + string(teamName) + " Player " + chr(34) + string(i+1);
playerId.name = string(teamName) + " Player " + string(counter+1);

//UPDATE GRID: |instance_id|player_name|alive|
ds_grid_set(thisTeamsGrid, 0, counter, playerId);
ds_grid_set(thisTeamsGrid, 1, counter, playerId.name);
ds_grid_set(thisTeamsGrid, 2, counter, true);


