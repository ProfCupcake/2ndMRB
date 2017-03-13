_spawnee = _this select 1;

_spawnee setPos iSpawn;

//Text marker for starting location
_startMarkTwo = createMarkerLocal ["2mrb_green_text", iSpawn];
_startMarkTwo setMarkerShapeLocal "ICON";
_startMarkTwo setMarkerColorLocal "ColorGreen";
_startMarkTwo setMarkerTypeLocal "hd_dot";
_startMarkTwo setMarkerTextLocal "Indfor Start";

_returnIndex = _spawnee addAction[format ["<t color='%1'>RTB</t>", actionColour], "player call returnScript"];
_outfit1Index = _spawnee addAction[format ["<t color='%1'>Specter S Flora</t>", actionColour], "1 call setOutfitI"];
_outfit2Index = _spawnee addAction[format ["<t color='%1'>MSV EMR</t>", actionColour], "2 call setOutfitI"];

playerActions pushBack _returnIndex;
playerActions pushBack _outfit1Index;
playerActions pushBack _outfit2Index;

_spawnee addEventHandler ["Killed", "player call returnScript"];

_sideSwitchGroup = createGroup independent;
[player] joinSilent _sideSwitchGroup;