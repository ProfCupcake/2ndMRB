	_startMark = _this select 0;
	_sideSelect = _this select 1;
	_unitsArray = _this select 2;
	_routeChoice = _this select 3;

	_spawnedGrp = [getMarkerPos _startMark, _sideSelect, _unitsArray,[],[],[],[],[],30] call BIS_fnc_spawnGroup;
		
	_wayPt = "";
	_wpEND = "";

	//Loop through move waypoints
	for "_i" from 1 to 2 do {
		_wayPt = _routeChoice + str _i;
		
		_wayPt = _spawnedGrp addWaypoint [GetMarkerPos _wayPt, 150]; 
		_wayPt setWaypointType "MOVE"; 
		_wayPt setWaypointFormation "STAG COLUMN";
	};
	 
	 //Random Select Station or End Point for Spawn
	 _endNum = selectRandom [1,2,3,4,5,6,7,8,9];
	  
	 _endMark = "endMark_" + str _endNum;
	  
	 _wpEND = _spawnedGrp addWaypoint [GetMarkerPos _endMark, 100];
	 _wpEND setWaypointType "HOLD"; 
	 _wpEND setWaypointFormation "LINE"; 