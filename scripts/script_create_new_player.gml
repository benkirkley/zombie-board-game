/* This script is called to create a new player based on the given parameters */

var teamId = argument0;
var counter = argument1;
var is_alive = 1;
var nameSaved = "";
var characterNameSaved = ""
var totalHitPointsSaved = 0;
var attackSaved = 0;
var dicePoolSaved = 0;
var defenseSaved = 0;
var hitPointsSaved = 0;
var totalHitPointsSaved = 0;
var totalActionPointsSaved = 0;
var damageSaved = 0;
var totalNumberOfAttacksSaved = 0;
var moveSpeedSaved = 0;
var inventorySlotWeaponSaved=false;
var inventorySlotArmourSaved=false;
              
playerDataMap = ds_grid_get(global.teamGrids, 6, teamId);
nameOfTeam = ds_grid_get(global.teamGrids, 2, teamId);
numberOfPlayersOnThisTeam = ds_grid_get(global.teamGrids, 3, teamId);
objectForThisInstance = ds_grid_get(global.teamGrids, 4, teamId);
thisTeamsSpawnGrid =  ds_grid_get(global.teamGrids, 5, teamId);

global.totalPlayers += 1;

//Check if player was saved from previous room
if (teamId == 0)
{
    doesPlayerExistInSave = ds_map_find_value(global.savedPlayerData,string(counter)+".playerId");
    if (doesPlayerExistInSave)
    {
        nameSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".name");
        characterNameSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".characterName");
        is_alive = ds_map_find_value(global.savedPlayerData, string(counter) + ".is_alive");
        attackSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".attack");
        dicePoolSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".dicePool");
        defenseSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".defense");
        hitPointsSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".hitPoints");
        totalHitPointsSaved =  ds_map_find_value(global.savedPlayerData, string(counter) + ".totalHitPoints");
        totalActionPointsSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".totalActionPoints");
        damageSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".damage");
        totalNumberOfAttacksSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".totalNumberOfAttacks");
        moveSpeedSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".moveSpeed");
        inventorySlotWeaponSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".inventorySlotWeapon");
        inventorySlotArmourSaved = ds_map_find_value(global.savedPlayerData, string(counter) + ".inventorySlotArmour");
    }
}     
if (is_alive)
{
    //CREATE the instance and assign some initial variables
    var playerId = instance_create(spawnPointX,spawnPointY,objectForThisInstance);
    
    playerId.thisTeamId = teamId;
    playerId.thisPlayerId = counter;
    playerId.name = nameSaved;
    playerId.characterName = characterNameSaved;
    if (attackSaved) playerId.attack = attackSaved;
    if (dicePoolSaved) playerId.dicePool = dicePoolSaved;
    if (defenseSaved) playerId.defense = defenseSaved;
    if (hitPointsSaved) playerId.hitPoints = hitPointsSaved;
    if (totalHitPointsSaved) playerId.totalHitPoints = totalHitPointsSaved;
    if (totalActionPointsSaved)
    {
        playerId.totalActionPoints = totalActionPointsSaved;
        playerId.actionPoints = playerId.totalActionPoints;
    }
    if (damageSaved) playerId.damage = damageSaved;
    if (totalNumberOfAttacksSaved) playerId.totalNumberOfAttacks = totalNumberOfAttacksSaved;
    if (moveSpeedSaved) playerId.moveSpeed = moveSpeedSaved;
    playerId.inventorySlotWeapon = inventorySlotWeaponSaved;
    playerId.inventorySlotArmour = inventorySlotArmourSaved;
    
    if (playerId.name=="") playerId.name = string(nameOfTeam) + " Player " + string(counter+1);
    playerId.is_alive = true;
    playerId.direction = spawnDirection;
    playerId.image_angle = spawnDirection;
    playerId.image_speed=0;
    
    numberOfPlayersOnTeam = ds_map_find_value(playerDataMap,".numberOfPlayersOnTeam");
    ds_map_replace(playerDataMap,".numberOfPlayersOnTeam",numberOfPlayersOnTeam+1);
    ds_map_add(playerDataMap,string(counter)+".playerId",playerId);
    ds_map_add(playerDataMap,string(counter)+".name",playerId.name);
    ds_map_add(playerDataMap,string(counter)+".characterName",playerId.characterName); 
    ds_map_add(playerDataMap,string(counter)+".is_alive",true);
    ds_map_add(playerDataMap,string(counter)+".has_spawned",true);
    ds_map_add(playerDataMap,string(counter)+".inventory_weapon_1",playerId.inventorySlotWeapon);
    ds_map_add(playerDataMap,string(counter)+".inventory_armour_1",playerId.inventorySlotArmour);
    
}
