/*
   Initialize local variables
*/
gridSize = 64;     // Should be power of 2 (...8,16,32...)
isMoving = false;  // Keeps track of when player is moving
destroyStatsWindow = false;
moveTimer = 0;  // Counts down from grid size each step
moveSpeed = 8;     // Do not set higher than grid size!
speedX = 0;
speedY = 0;

resolveCombat = false;
thisPlayerId = 0;
thisTeamId = 0;
amICurrentPlayer = false;
name = 0;
statsWindowsId = 0;
