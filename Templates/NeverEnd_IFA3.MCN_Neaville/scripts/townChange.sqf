
 _triList = _this;
 _oldSide = townSide;
 
 _bluCount = {side _x == WEST} count _triList;
 _redCount = {side _x == EAST} count _triList;

 if (_bluCount == _redCount) then { 
	townSide = "NIL";
	"townMark" setMarkerColor "ColorBLACK";
 } else {
	if (_bluCount >= _redCount) then {
		townSide = "BLUFOR";
		"townMark" setMarkerColor "ColorBLUE";
	} else {
		townSide = "OPFOR";
		"townMark" setMarkerColor "ColorRED";
	};
 };
 
 if ((_oldSide != townSide) && (townSide != "NIL")) then { 
	_strMsg = "Town has been captured by " + str townSide;
	_strMsg remoteExec ["hint"];
 };
 
 if ((_oldSide != townSide) && (townSide == "NIL")) then {
	_strMsg = "Town is now either contested or empty";
	_strMsg remoteExec ["hint"];
 };
 
publicVariable "townSide";

 
 