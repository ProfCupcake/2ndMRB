[groupB, groupO, groupI] call training_init;

_cqcArea = ["cqcO1","cqcO2","cqcO3","cqcO4","cqcO5"];
_selectArea = selectRandom _cqcArea;

groupB = createGroup WEST;
groupO = createGroup EAST;
groupI = createGroup INDEPENDENT;

_spawnPoint = [1,2,3];

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

"test" call print_text;

remoteExec ["teleportSign addAction ['Blufor Spawn','scripts\bluSpawn.sqf']",0];
remoteExec ["teleportSign addAction ['Opfor Spawn','scripts\opSpawn.sqf']",0];
remoteExec ["teleportSign addAction ['Indfor Spawn','scripts\indSpawn.sqf']",0];

//("B:" + str _bPosition + " O:" + str _oPosition + " I:" + str _iPosition) remoteExec ["hint", 0];

"Outdoor CQC Processing Complete. Please proceed to Signboard to teleport yourself to your respective starting points" call print_text;