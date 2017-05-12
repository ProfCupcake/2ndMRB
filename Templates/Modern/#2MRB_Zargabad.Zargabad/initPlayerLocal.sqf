//title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition
CUP_arsenalActionParams = ["Virtual Arsenal", {["Open",true] spawn BIS_fnc_arsenal},nil,1.5,true,true,"","player distance thebox <= 20"];
CUP_arsenalAction = player addAction CUP_arsenalActionParams;
player addEventHandler ["Killed", {player removeAction CUP_arsenalAction;}];
player addEventHandler ["Respawn", {player addAction CUP_arsenalActionParams;}];

if (isNil{CUP_homeBaseSpawn}) then
{
  waitUntil {player == player};
	home_base_spawn_location setPos getPos player; 
	home_base_spawn_location setDir getDir player;
  CUP_homeBaseSpawn = [player, home_base_spawn_location, "Start Position"] call BIS_fnc_addRespawnPosition;
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

call compile preprocessfilelinenumbers "inventory\playerInit.sqf";

CUP_invSaveAction = thebox addAction ["<t color='#ff0000'>Save loadout</t>", {publicVariableServer "saveRequest";}, nil, 3, true, true, "", "true"];
CUP_invLoadAction = thebox addAction ["<t color='#ff0000'>Load saved loadout</t>", {publicVariableServer "invRequest";}, nil, 2, false, true, "", "true"];