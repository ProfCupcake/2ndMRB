if (isDedicated) exitWith {};

//title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition
CUP_arsenalAction = player addAction ["Virtual Arsenal", {["Open",true] spawn BIS_fnc_arsenal},nil,1.5,true,true,"","player distance thebox <= 20"];
player addEventHandler ["Killed", {player removeAction CUP_arsenalAction;}];
player addEventHandler ["Respawn", {player addAction ["Virtual Arsenal", {["Open",true] spawn BIS_fnc_arsenal},nil,1.5,true,true,"","player distance thebox <= 20"];}];

if (isNil{CUP_homeBaseSpawn}) then
{
  waitUntil {player == player};
	home_base_spawn_location setPos getPos player; 
	home_base_spawn_location setDir getDir player;
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