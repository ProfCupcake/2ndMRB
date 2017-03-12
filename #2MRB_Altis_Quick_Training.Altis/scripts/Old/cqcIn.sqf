[groupB, groupO, groupI] call training_init;

groupB = createGroup WEST;
groupO = createGroup EAST;
groupI = createGroup INDEPENDENT;

_ghosthotel = [[21959.9,21013.4,0.00143623], [21988.4,21044.3,0.00143814], [21997.7,20999.7,0.00143814], [21948.9,21053.1,4], [22001.2,21005.9,9]];

_construction01 = [[3783.85,13424.2,0.00139427], [3804.71,13403.8,0.00142765], [3818.39,13430.7,4], [3782.39,13408,4], [3792.78,13419.5,8.5], [3793.7,13418.2,12]];

_Areas = [];
_Areas pushBack _ghosthotel;
_Areas pushBack _construction01;

_spawnPoint = selectRandom _Areas;

bSpawn = selectRandom _spawnPoint;
_index = _spawnPoint find bSpawn;

_spawnPoint deleteAt _index;

oSpawn = selectRandom _spawnPoint;
_index = _spawnPoint find oSpawn;

_spawnPoint deleteAt _index;

iSpawn = selectRandom _spawnPoint; 

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

//("B:" + str bSpawn + "\nO:" + str oSpawn + "\nI:" + str iSpawn) remoteExec ["hint", 0];
"Indoor CQC Processing Complete. Please proceed to Signboard to teleport yourself to your respective starting points" call print_text;