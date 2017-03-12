_spawnee = _this select 1;

_spawnee setPos iSpawn;
[_spawnee] join groupI;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_green_text", iSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorGreen";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Indfor Start";

playerReturn = _spawnee addAction ["RTB", "player call returnScript"];
_spawnee addEventHandler ["Killed", "player call returnScript"];

indforCount = indforCount + 1;

playerTeam = 3;

publicVariable "indforCount";