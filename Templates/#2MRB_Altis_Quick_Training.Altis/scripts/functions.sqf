training_init = 
{
	removeAllActions teleportSign;
};

print_text = {
	_this remoteExec ["hint", 0];
};

cqcOut = {

	call training_init;
	
	if (isServer) then {

		_cqcArea = ["cqcO1","cqcO2","cqcO3","cqcO4","cqcO5"];
		_selectArea = selectRandom _cqcArea;\
		_spawnPoint = [1,2,3];

		_bPosition = selectRandom _spawnPoint;
		_index = _spawnPoint find _bPosition;

		_spawnPoint deleteAt _index;

		_oPosition = selectRandom _spawnPoint;
		_index = _spawnPoint find _oPosition;

		_spawnPoint deleteAt _index;

		_iPosition = selectRandom _spawnPoint;

		bSpawn = getMarkerPos (_selectArea + "_" + str _bPosition);
		oSpawn = getMarkerPos (_selectArea + "_" + str _oPosition);
		iSpawn = getMarkerPos (_selectArea + "_" + str _iPosition);

		publicVariable "bSpawn";
		publicVariable "oSpawn";
		publicVariable "iSpawn";
	};

	blu_Spawn remoteExec ["call",0];
	op_Spawn remoteExec ["call",0];
	ind_Spawn remoteExec ["call",0];

	//("B:" + str _bPosition + " O:" + str _oPosition + " I:" + str _iPosition) remoteExec ["hint", 0];

	"Outdoor CQC Processing Complete. Please proceed to Signboard to teleport yourself to your respective starting points" call print_text;
};

cqcIn = {

	call training_init;
	
	if (isServer) then {

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

		publicVariable "bSpawn";
		publicVariable "oSpawn";
		publicVariable "iSpawn";

	};
	
	blu_Spawn remoteExec ["call",0];
	op_Spawn remoteExec ["call",0];
	ind_Spawn remoteExec ["call",0];

	//("B:" + str bSpawn + "\nO:" + str oSpawn + "\nI:" + str iSpawn) remoteExec ["hint", 0];
	"Indoor CQC Processing Complete. Please proceed to Signboard to teleport yourself to your respective starting points" call print_text;

};

movement = {

	call training_init;
	
	if (isServer) then {		

		_moveArea = ["move01","move02"];
		_selectArea = selectRandom _moveArea;

		_spawnPoint = [1,2,3,4,5,6,7,8];

		_bPosition = selectRandom _spawnPoint;
		_index = _spawnPoint find _bPosition;

		_spawnPoint deleteAt _index;

		_oPosition = selectRandom _spawnPoint;
		_index = _spawnPoint find _oPosition;

		_spawnPoint deleteAt _index;

		_iPosition = selectRandom _spawnPoint;

		bSpawn = getMarkerPos (_selectArea + "_" + str _bPosition);
		oSpawn = getMarkerPos (_selectArea + "_" + str _oPosition);
		iSpawn = getMarkerPos (_selectArea + "_" + str _iPosition);

		publicVariable "bSpawn";
		publicVariable "oSpawn";
		publicVariable "iSpawn";

	};
	
	blu_Spawn remoteExec ["call",0];
	op_Spawn remoteExec ["call",0];
	ind_Spawn remoteExec ["call",0];

	//("B:" + str _bPosition + " O:" + str _oPosition + " I:" + str _iPosition) remoteExec ["hint", 0];

	"Movement Practice Processing Complete. Please proceed to Signboard to teleport yourself to your respective starting points. \nMission is to travel to the opposite side of the square you are indicated on the map." call print_text;
};

blu_Spawn = {
	teleportSign addAction[format ["<t color='%1'>Blufor Spawn</t>", actionColour],'scripts\bluSpawn.sqf'];
};

op_Spawn = {
	teleportSign addAction[format ["<t color='%1'>Opfor Spawn</t>", actionColour],'scripts\opSpawn.sqf'];
};

ind_Spawn = {
	teleportSign addAction[format ["<t color='%1'>Indfor Spawn</t>", actionColour],'scripts\indSpawn.sqf'];
};

returnScript = {
	_returnee = _this;

	_returnee setPos (getPos home_base_spawn_location);

	{
		_returnee removeAction _x;
	} forEach playerActions;
	
	playerActions = []; // For new possible actions to be added.

	deleteMarker '2mrb_blue_text';
	deleteMarker '2mrb_red_text';
	deleteMarker '2mrb_green_text';

	_sideSwitchGroup = createGroup civilian;
	[player] joinSilent _sideSwitchGroup;
	
	format ["Active:-\n\nBLUFOR: %1\nOPFOR: %2\nINDFOR: %1", {side _x == west} count allPlayers, {side _x == east} count allPlayers, {side _x == independent} count allPlayers] call print_text;
};

loadoutBoxesSetup = 
{
	BLUbox addAction ["<t color='#0080ff'>Rifleman</t>", "loadouts\blufor\rifleman.sqf"];
	OPbox addAction ["<t color='#ff0000'>Rifleman</t>", "loadouts\opfor\rifleman.sqf"];
	INDbox addAction ["<t color='#00ff00'>Rifleman</t>", "loadouts\indfor\rifleman.sqf"];
	
	FnfBox addAction[format ["<t color='#0080ff'>FnF MARPAT WD</t>", actionColour], "loadouts\fnf\MARPATWD.sqf"];
	FnfBox addAction[format ["<t color='#0080ff'>FnF OCP</t>", actionColour], "loadouts\fnf\OCP.sqf"];
	FnfBox addAction[format ["<t color='#0080ff'>FnF MARPAT D</t>", actionColour], "loadouts\fnf\MARPATD.sqf"];
	
	FnfBox addAction[format ["<t color='#ff0000'>FnF TTsKO Forest</t>", actionColour], "loadouts\fnf\TTsKOForest.sqf"];
	FnfBox addAction[format ["<t color='#ff0000'>FnF VDV Flora</t>", actionColour], "loadouts\fnf\VDVFlora.sqf"];
	FnfBox addAction[format ["<t color='#ff0000'>FnF TTsKO Mountain</t>", actionColour], "loadouts\fnf\TTsKOMountain.sqf"];
	
	FnfBox addAction[format ["<t color='#00ff00'>FnF Specter S Flora</t>", actionColour], "loadouts\fnf\SpecterSFlora.sqf"];
	FnfBox addAction[format ["<t color='#00ff00'>FnF MSV EMR</t>", actionColour], "loadouts\fnf\MSVEMR.sqf"];
};
