_spawnee = _this select 1;

_spawnee setPos oSpawn;
[_spawnee] join groupO;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_red_text", oSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorRed";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Opfor Start";

playerReturn = _spawnee addAction ["RTB", "player call returnScript"];
_spawnee addEventHandler ["Killed", "player call returnScript"];