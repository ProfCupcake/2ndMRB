_spawnedGrp = _this select 0;
_routeChoice = _this select 1;

	_wayPt = "";
	_wpEND = "";

	//Loop through Transitting waypoints.
	for "_i" from 1 to 2 do {
		_wayPt = _routeChoice + str _i;
		
		_wayPt = _spawnedGrp addWaypoint [GetMarkerPos _wayPt, 100]; 
		_wayPt setWaypointType "MOVE"; 
		_wayPt setWaypointFormation "STAG COLUMN";
	};
	 
	 //Random Waypoint through Town
	 _townNum = selectRandom [1,2,3,4,5,6,7,8,9];
	 _townMark = "townMark_" + str _townNum;
	 
	 _wpTOWN = _spawnedGrp addWaypoint [GetMarkerPos _townMark, 100];
	 _wpTOWN setWaypointType "MOVE"; 
	 _wpTOWN setWaypointFormation "LINE"; 
	 
	 //Random Select Station or End Point for Spawn
	 _endNum = selectRandom [1,2,3,4,5,6,7];
	 _endMark = "";
	  switch(side _spawnedGrp) do {
			case WEST: {
				_endMark = "bluEnd_" + str _endNum;
			};
			case EAST:{
				_endMark = "opEnd_" + str _endNum;
			};
	  };
	  
	 _wpEND = _spawnedGrp addWaypoint [GetMarkerPos _endMark, 50];
	 _wpEND setWaypointType "HOLD"; 