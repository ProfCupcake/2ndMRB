_spawnee = _this select 1;

_spawnee setPos bSpawn;
[_spawnee] join groupB;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_blue_text", bSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorBlue";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Blufor Start";

playerReturn = _spawnee addAction[format ["<t color='%1'>RTB</t>", actionColour], "player call returnScript"];
_spawnee addEventHandler ["Killed", "player call returnScript"];

_sideSwitchGroup = createGroup west;
[player] joinSilent _sideSwitchGroup;
