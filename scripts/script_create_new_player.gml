teamId = argument0;
startingPositionX = argument1;
startingPositionY = argument2;
thisObject = argument3;
teamName = argument4;
teamGrid = argument5;
counter = argument6;

/*
show_message("startingPositonX: " + string(startingPositionX)
            +"#startingPositonY: " + string(startingPositionY)
            +"#thisObject: " + string(thisObject)
            +"#teamName: " + string(teamName)
            +"#teamGrid: " + string(teamGrid)
            +"#teamId: " + string(teamId)
            +"#counter: " + string(counter)
            );
*/

global.totalPlayers += 1;
startingPositionY += (128 * counter);

//CREATE the instance and assign some initial variables
var playerId = instance_create(startingPositionX,startingPositionY,thisObject);

playerId.thisTeamId = teamId;
//playerId.name = chr(34) + string(teamName) + " Player " + chr(34) + string(i+1);
playerId.name = string(teamName) + " Player " + string(i+1);

//NEW GRID: |instance_id|player_name|alive|
ds_grid_set(teamGrid, 0, i, playerId);
ds_grid_set(teamGrid, 1, i, playerId.name);
ds_grid_set(teamGrid, 2, i, true);


