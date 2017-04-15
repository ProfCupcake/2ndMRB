	_startMark = _this select 0;
	_sideSelect = _this select 1;
	_unitsArray = _this select 2;
	_routeChoice = _this select 3;

	_spawnedGrp = [getMarkerPos _startMark, _sideSelect, _unitsArray,[],[],[],[],[],30] call BIS_fnc_spawnGroup;
		
    [_spawnedGrp, _routeChoice] call compile preprocessfilelinenumbers "scripts\wayPoint.sqf";