_spawnee = _this select 1;

_spawnee setPos oSpawn;
[_spawnee] join groupO;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_red_text", oSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorRed";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Opfor Start";

playerReturn = _spawnee addAction [parseText format ["<t color='%1'>RTB</t>", actionColour], "player call returnScript"];
_spawnee addEventHandler ["Killed", "player call returnScript"];

opforCount = opforCount + 1;

playerTeam = 2;

publicVariable "opforCount";