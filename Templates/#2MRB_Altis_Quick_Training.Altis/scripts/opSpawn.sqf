_spawnee = _this select 1;

_spawnee setPos oSpawn;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_red_text", oSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorRed";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Opfor Start";

_returnIndex = _spawnee addAction[format ["<t color='%1'>RTB</t>", actionColour], "player call returnScript"];

playerActions pushBack _returnIndex;

_spawnee addEventHandler ["Killed", "player call returnScript"];

_sideSwitchGroup = createGroup east;
[player] joinSilent _sideSwitchGroup;