_spawnee = _this select 1;

_spawnee setPos bSpawn;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_blue_text", bSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorBlue";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Blufor Start";

_returnIndex = _spawnee addAction[format ["<t color='%1'>RTB</t>", actionColour], "player call returnScript"];
_outfit1Index = _spawnee addAction[format ["<t color='%1'>MARPAT WD</t>", actionColour], "1 call setOutfitB"];
_outfit2Index = _spawnee addAction[format ["<t color='%1'>OCP</t>", actionColour], "2 call setOutfitB"];
_outfit3Index = _spawnee addAction[format ["<t color='%1'>MARPAT D</t>", actionColour], "3 call setOutfitB"];

playerActions pushBack _returnIndex;
playerActions pushBack _outfit1Index;
playerActions pushBack _outfit2Index;
playerActions pushBack _outfit3Index;

_spawnee addEventHandler ["Killed", "player call returnScript"];

_sideSwitchGroup = createGroup west;
[player] joinSilent _sideSwitchGroup;