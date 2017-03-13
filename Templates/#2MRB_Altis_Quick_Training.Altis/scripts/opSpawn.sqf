_spawnee = _this select 1;

_spawnee setPos oSpawn;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_red_text", oSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorRed";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Opfor Start";

_returnIndex = _spawnee addAction[format ["<t color='%1'>RTB</t>", actionColour], "player call returnScript"];
_outfit1Index = _spawnee addAction[format ["<t color='%1'>TTsKO Forest</t>", actionColour], "1 call setOutfitO"];
_outfit2Index = _spawnee addAction[format ["<t color='%1'>VDV Flora</t>", actionColour], "2 call setOutfitO"];
_outfit3Index = _spawnee addAction[format ["<t color='%1'>TTsKO Mountain</t>", actionColour], "3 call setOutfitI"];

playerActions pushBack _returnIndex;
playerActions pushBack _outfit1Index;
playerActions pushBack _outfit2Index;
playerActions pushBack _outfit3Index;

_spawnee addEventHandler ["Killed", "player call returnScript"];

_sideSwitchGroup = createGroup east;
[player] joinSilent _sideSwitchGroup;