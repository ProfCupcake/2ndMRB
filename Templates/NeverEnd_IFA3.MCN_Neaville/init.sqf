if (isServer) then {
	//Initialize Spawning System
	spawnStatus = false;
	tacticStatus = false;
	townStatus = false;
	townSide = "NIL";
	
	_blueSide = 0;
	_redSide = 1;
	
	//Default Blufor and Opfor Tactic
	bluTactic = 0;
	opTactic = 0;
	
	//Initialize Initial Wave Strength
	_startingWave = ["starting_Wave",1] call BIS_fnc_getParamValue;
	
	//Initialize Initial Wave Strength
	_waveFrequency = ["wave_Frequency",1] call BIS_fnc_getParamValue;
	
	//Initialize AI Tactical Change Frequency
	_tacticalChange = ["tacticalChange_Frequency",1] call BIS_fnc_getParamValue;
	
	//Initialize Side Choices
	_blueSide = ["blufor_SideChoice",1] call BIS_fnc_getParamValue;
	_redSide = ["opfor_SideChoice",1] call BIS_fnc_getParamValue;
	
	//Initializing Units of Each Sides
	unitSets = [["LIB_US_Rangers_mgunner", "LIB_US_Rangers_rifleman","LIB_US_Rangers_rifleman","LIB_US_Rangers_rifleman","LIB_US_Rangers_smgunner"],["LIB_GER_scout_smgunner", "LIB_GER_scout_smgunner","LIB_GER_scout_ober_rifleman","LIB_GER_scout_ober_rifleman","LIB_GER_scout_mgunner"],["LIB_SOV_rifleman", "LIB_SOV_rifleman","LIB_SOV_sergeant","LIB_SOV_sergeant","LIB_SOV_mgunner"]];
	
	//Units Choice
	bluUnits = unitSets select _blueSide;
	opUnits = unitSets select _redSide;
	
	//Pushing Public Variables
	publicVariable "spawnStatus";
	publicVariable "tacticStatus";
	publicVariable "townStatus";
	publicVariable "townSide";
	publicVariable "bluTactic";
	publicVariable "opTactic";
	publicVariable "bluUnits";
	publicVariable "opUnits";
	
	//Adding Respawn Inventory according to selected Side Choice in Parameters
	if (!isClass(configFile >> "CfgPatches" >> "ace_main")) then {
			switch (_blueSide) do {
			case 0: {
				[WEST, "US1"] call BIS_fnc_addRespawnInventory;
				[WEST, "US2"] call BIS_fnc_addRespawnInventory;
				[WEST, "US3"] call BIS_fnc_addRespawnInventory;
			};
			case 1: {
				[WEST, "GERMAN1"] call BIS_fnc_addRespawnInventory;
				[WEST, "GERMAN2"] call BIS_fnc_addRespawnInventory;
				[WEST, "GERMAN3"] call BIS_fnc_addRespawnInventory;
			};
			case 2: {
				[WEST, "RUSSIA1"] call BIS_fnc_addRespawnInventory;
				[WEST, "RUSSIA2"] call BIS_fnc_addRespawnInventory;
				[WEST, "RUSSIA3"] call BIS_fnc_addRespawnInventory;
			};
		};
		
		switch (_redSide) do {
			case 0: {
				[EAST, "US1"] call BIS_fnc_addRespawnInventory;
				[EAST, "US2"] call BIS_fnc_addRespawnInventory;
				[EAST, "US3"] call BIS_fnc_addRespawnInventory;
			};
			case 1: {
				[EAST, "GERMAN1"] call BIS_fnc_addRespawnInventory;
				[EAST, "GERMAN2"] call BIS_fnc_addRespawnInventory;
				[EAST, "GERMAN3"] call BIS_fnc_addRespawnInventory;
			};
			case 2: {
				[EAST, "RUSSIA1"] call BIS_fnc_addRespawnInventory;
				[EAST, "RUSSIA2"] call BIS_fnc_addRespawnInventory;
				[EAST, "RUSSIA3"] call BIS_fnc_addRespawnInventory;
			};
		};
	} else { 
			switch (_blueSide) do {
			case 0: {
				[WEST, "US1"] call BIS_fnc_addRespawnInventory;
				[WEST, "US2"] call BIS_fnc_addRespawnInventory;
				[WEST, "US3"] call BIS_fnc_addRespawnInventory;
			};
			case 1: {
				[WEST, "GERMAN1"] call BIS_fnc_addRespawnInventory;
				[WEST, "GERMAN2"] call BIS_fnc_addRespawnInventory;
				[WEST, "GERMAN3"] call BIS_fnc_addRespawnInventory;
			};
			case 2: {
				[WEST, "RUSSIA1"] call BIS_fnc_addRespawnInventory;
				[WEST, "RUSSIA2"] call BIS_fnc_addRespawnInventory;
				[WEST, "RUSSIA3"] call BIS_fnc_addRespawnInventory;
			};
		};
		
		switch (_redSide) do {
			case 0: {
				[EAST, "US1ACE"] call BIS_fnc_addRespawnInventory;
				[EAST, "US2ACE"] call BIS_fnc_addRespawnInventory;
				[EAST, "US3ACE"] call BIS_fnc_addRespawnInventory;
			};
			case 1: {
				[EAST, "GERMAN1ACE"] call BIS_fnc_addRespawnInventory;
				[EAST, "GERMAN2ACE"] call BIS_fnc_addRespawnInventory;
				[EAST, "GERMAN3ACE"] call BIS_fnc_addRespawnInventory;
			};
			case 2: {
				[EAST, "RUSSIA1ACE"] call BIS_fnc_addRespawnInventory;
				[EAST, "RUSSIA2ACE"] call BIS_fnc_addRespawnInventory;
				[EAST, "RUSSIA3ACE"] call BIS_fnc_addRespawnInventory;
			};
		};
	};
	//Setting Spawn Trigger Timeout Setting
	spawnTrigger setTriggerTimeout [_waveFrequency - 10, _waveFrequency, _waveFrequency + 10, false];
	
	//Setting AI Change Trigger Timeout Setting
	tacticTrigger setTriggerTimeout [_tacticalChange - 30, _tacticalChange, _tacticalChange + 30, false];
	
	//Spawning 15 groups of units for the initial start
	//Initial Spawn of groups to attack Neavile based on Parameters
	for "_i" from 1 to _startingWave do {{true} call compile preprocessfilelinenumbers "scripts\spawnAIscript.sqf";};
};

//Creating Task Record for Viewing
player createDiaryRecord ["Diary", ["Take and Hold Neavile", "You are to capture Neavile and hold the area as long as you can."]];