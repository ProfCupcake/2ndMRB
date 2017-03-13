_spawnee = _this select 1;

_spawnee setPos iSpawn;
[_spawnee] join groupI;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_green_text", iSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorGreen";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Indfor Start";

playerReturn = _spawnee addAction[format ["<t color='%1'>RTB</t>", actionColour], "player call returnScript"];
_spawnee addEventHandler ["Killed", "player call returnScript"];

_sideSwitchGroup = createGroup independent;
[player] joinSilent _sideSwitchGroup;