_spawnee = _this select 1;

_spawnee setPos iSpawn;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_green_text", iSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorGreen";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Indfor Start";

_returnIndex = _spawnee addAction[format ["<t color='%1'>RTB</t>", actionColour], "player call returnScript"];

playerActions pushBack _returnIndex;

_spawnee addEventHandler ["Killed", "player call returnScript"];

_sideSwitchGroup = createGroup independent;
[player] joinSilent _sideSwitchGroup;