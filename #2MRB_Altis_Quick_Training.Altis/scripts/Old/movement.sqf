[groupB, groupO, groupI] call training_init;

_moveArea = ["move01","move02"];
_selectArea = selectRandom _moveArea;

groupB = createGroup WEST;
groupO = createGroup EAST;
groupI = createGroup INDEPENDENT;

_spawnPoint = [1,2,3,4,5,6,7,8];

_bPosition = selectRandom _spawnPoint;
_index = _spawnPoint find _bPosition;

_spawnPoint deleteAt _index;

_oPosition = selectRandom _spawnPoint;
_index = _spawnPoint find _oPosition;

_spawnPoint deleteAt _index;

_iPosition = _spawnPoint select 0;

bSpawn = getMarkerPos (_selectArea + "_" + str _bPosition);
oSpawn = getMarkerPos (_selectArea + "_" + str _oPosition);
iSpawn = getMarkerPos (_selectArea + "_" + str _iPosition);

publicVariable "groupB";
publicVariable "groupO";
publicVariable "groupI";
publicVariable "bSpawn";
publicVariable "oSpawn";
publicVariable "iSpawn";

remoteExec ["teleportSign addAction ['Blufor Spawn','scripts\bluSpawn.sqf']",0];
remoteExec ["teleportSign addAction ['Opfor Spawn','scripts\opSpawn.sqf']",0];
remoteExec ["teleportSign addAction ['Indfor Spawn','scripts\indSpawn.sqf']",0];

//("B:" + str _bPosition + " O:" + str _oPosition + " I:" + str _iPosition) remoteExec ["hint", 0];

"Movement Practice Processing Complete. Please proceed to Signboard to teleport yourself to your respective starting points. \nMission is to travel to the opposite side of the square you are indicated on the map." call print_text;