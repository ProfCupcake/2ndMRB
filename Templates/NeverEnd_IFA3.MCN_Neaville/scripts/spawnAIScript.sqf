	
	_bluCount = 0;
	_opCount = 0;
	
	_bluCount = {(side _x == WEST) && (count units _x != 0)} count allGroups;
	_opCount = {(side _x == EAST) && (count units _x != 0)} count allGroups;
	
	_strMsg = str bluTactic + " : " + str opTactic;
	hint _strMsg;
	
	if (_bluCount <= 50) then {
		routes = [];
		switch (bluTactic) do {
			case 0: {
				//Push
				routes = ["blu_Move1_","blu_Move2_","blu_Move3_"];
			};
			case 1: {
				//Push Top 
				routes = ["blu_Move2_","blu_Move2_","blu_Move2_"];
			};
			case 2: {
				//Push Bottom
				routes = ["blu_Move3_","blu_Move3_","blu_Move3_"];
			};
			case 3: {
				//Push Slight Top
				routes = ["blu_Move1_","blu_Move2_","blu_Move2_"];
			};
			case 4: {
				//Push Slight Bot
				routes = ["blu_Move1_","blu_Move3_","blu_Move3_"];
			};
			case 5: {
				//Push Slight Middle
				routes = ["blu_Move1_","blu_Move1_","blu_Move2_"];
			};
			case 6: {
				//Push Slight Middle
				routes = ["blu_Move1_","blu_Move1_","blu_Move1_"];
			};
		};
		
		{
		
			["blu_Start", WEST, bluUnits, _x] call compile preprocessfilelinenumbers "scripts\spawnAI.sqf"; 
		
		} foreach routes;
	};
	
	if (_opCount <= 50) then {
		routes = [];
		switch (opTactic) do {
			case 0: {
				//Push
				routes = ["op_Move1_","op_Move2_","op_Move3_"];
			};
			case 1: {
				//Push Top 
				routes = ["op_Move2_","op_Move2_","op_Move2_"];
			};
			case 2: {
				//Push Bottom
				routes = ["op_Move3_","op_Move3_","op_Move3_"];
			};
			case 3: {
				//Push Slight Top
				routes = ["op_Move1_","op_Move2_","op_Move2_"];
			};
			case 4: {
				//Push Slight Bot
				routes = ["op_Move1_","op_Move3_","op_Move3_"];
			};
			case 5: {
				//Push Slight Middle
				routes = ["op_Move1_","op_Move1_","op_Move2_"];
			};
			case 6: {
				//Push Slight Middle
				routes = ["op_Move1_","op_Move1_","op_Move1_"];
			};
		};
		{
		
			["op_Start", EAST, opUnits, _x] call compile preprocessfilelinenumbers "scripts\spawnAI.sqf"; 
		
		} foreach routes;
	};