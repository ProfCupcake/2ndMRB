_returnee = _this select 1;

_returnee setPos (getPos home_base_spawn_location);
removeAllActions _returnee;

deleteMarker '2mrb_blue_text';
deleteMarker '2mrb_red_text';
deleteMarker '2mrb_green_text';

[_returnee] join original;

_blue = { alive _x } count units groupB;
_red = { alive _x } count units groupO;
_green = { alive _x } count units groupI;

"Remaining:\nBlufor: " + str _blue + "\nOpfor: " + str _red + "\nIndfor: " + str _green call print_text;