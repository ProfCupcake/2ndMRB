
	_mySide = _this;
	_sideCount = 0;
	
	//Just to keep track exisiting group for each side (Calculations are to remove non-playing units for spawning purposes.)
	_sideCount = {(side _x == _mySide) && (count units _x != 0)} count allGroups;
	_playerSideCount = {(side _x == _mySide) && (count units _x != 0)} count allPlayers;
	_sideCount = _sideCount - (15 - _playerSideCount);
	
	if (_sideCount <= maxGroupSize) then {
		routes = [];
		_sideTactic = 0;
		_startPos = "";
		_unitSet = bluUnits;
		_routeStart = "";
		switch (_mySide) do {
			case WEST: { 
				_sideTactic = bluTactic; 
				_startPos = "blu_Start";
				_routeStart =  "blu_";
			};
			
			case EAST: { 
				_sideTactic = opTactic; 
				_startPos = "op_Start";
				_unitSet = opUnits;
				_routeStart =  "op_";
			};
			
		};
		
		switch (_sideTactic) do {
			case 0: {
				//Push
				routes = ["Move1_","Move2_","Move3_"];
			};
			case 1: {
				//Push Top 
				routes = ["Move2_","Move2_","Move2_"];
			};
			case 2: {
				//Push Bottom
				routes = ["Move3_","Move3_","Move3_"];
			};
			case 3: {
				//Push Slight Top
				routes = ["Move1_","Move2_","Move2_"];
			};
			case 4: {
				//Push Slight Bot
				routes = ["Move1_","Move3_","Move3_"];
			};
			case 5: {
				//Push Slight Middle
				routes = ["Move1_","Move1_","Move2_"];
			};
			case 6: {
				//Push Slight Middle
				routes = ["Move1_","Move1_","Move1_"];
			};
		};
		
		{
			_actualRoute = _routeStart + _x;
			[_startPos, _mySide, _unitSet, _actualRoute] call compile preprocessfilelinenumbers "scripts\spawnAI.sqf"; 
		} foreach routes;
	};
	
	_bluTotal = {(side _x == WEST) && (count units _x != 0)} count allGroups;
	_bluPlayers = {(side _x == WEST) && (count units _x != 0)} count allPlayers;
	_bluMsg = str (_bluTotal - (15 - _bluPlayers));
	"bluMark" SetMarkerText _bluMsg; 
	
	_opTotal = {(side _x == EAST) && (count units _x != 0)} count allGroups;
	_opPlayers = {(side _x == EAST) && (count units _x != 0)} count allPlayers;
	_opMsg = str (_opTotal - (15 - _opPlayers));	
	"opMark" SetMarkerText _opMsg; 