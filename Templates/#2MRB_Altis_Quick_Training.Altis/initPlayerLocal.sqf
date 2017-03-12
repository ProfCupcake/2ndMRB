if (isDedicated) exitWith {};

//title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition
CUP_arsenalAction = player addAction ["Virtual Arsenal", {["Open",true] spawn BIS_fnc_arsenal},nil,1.5,true,true,"","player distance thebox <= 20"];
player addEventHandler ["Killed", {player removeAction CUP_arsenalAction;}];
player addEventHandler ["Respawn", {player addAction ["Virtual Arsenal", {["Open",true] spawn BIS_fnc_arsenal},nil,1.5,true,true,"","player distance thebox <= 20"];}];

returnSign addAction ["RTB", "player call returnScript"];
{true} call compile preprocessfilelinenumbers "scripts\boardInit.sqf";

if (isNil{CUP_homeBaseSpawn}) then
{
  waitUntil {player == player};
  CUP_homeBaseSpawn = [player, home_base_spawn_location, "Home Base"] call BIS_fnc_addRespawnPosition;
  CUP_homeBaseSingleSpawnEH = player addEventHandler ["Respawn", 
  {
    0 spawn
    {
      sleep 1;
      [player, 0] call BIS_fnc_removeRespawnPosition;
      CUP_seaPlatformSpawn = [player, holding_area_spawn_location, "Holding Area"] call BIS_fnc_addRespawnPosition;
      player removeEventHandler ["Respawn", CUP_homeBaseSingleSpawnEH];
    };
  }];
};

{true} call compile preprocessfilelinenumbers "cupspec\cupspec_init.sqf";

[spectatorcam, 5] call CUPSPEC_addSpectateObject;
[spectatorcam_1, 5] call CUPSPEC_addSpectateObject;

player createDiaryRecord ["Diary", ["Training", "Use the Map object to select training type <br />1. Outdoor CQC  <br />2. Indoor CQC<br />3. Movement Practice<br /><br />Features(I guess)<br />- Auto-create Spawn Points for different groups and assign players to specific groups depending on which point you spawn to.<br />- Use the Signboard to teleport to the respective spawn sites.<br />- Pressing the option on the map object would result in resetting the whole signboard of spawn points.<br />- Right now, for winning sides, please use RTB on action menu to return to base.<br />- Unit dying would result in respawning back in base, while showing remaining count on every side.<br />RTB or Dying would return player to 'waiting' group.<br />- Movement Practice is inspired by our recent failures on checking our 6. It works by making random starting points for different teams and each team is to travel to the opposite side of the square, indicated on the map, from their starting point. Due to how opponents might end up coming from behind or even right in front of you, I believe this can be used to train our ability to react and also take note of our surroundings better.<br /><br />Note: As of now, attires have to be set on your own using Arsenal. This is supposed to just simplify spawning and randomizing spawn points for slightly better variation. To reinforce IDing targets, IND has been introduced into the spawn as well for 3 sided fights, where allies and enemies are to be decided before starting."]];