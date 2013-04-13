if (nextRoom == global.previousRoom)
{
    global.previousRoom = room;
    global.blueSpawnZoneId = id;
    zoneActive = true;
}
else
{
    zoneActive = false;
}
