[thebox, 20] call compile preprocessfilelinenumbers "scripts\addArsenalArea.sqf";

[home_base_spawn_location, holding_area_spawn_location] call compile preprocessfilelinenumbers "scripts\singleSpawnHandler.sqf";

{true} call compile preprocessfilelinenumbers "cupspec\cupspec_init.sqf";

[spectatorcam, 5] call CUPSPEC_addSpectateObject;

// TODO: pull these out into a generic add action function within CUPINV
CUP_invSaveAction = thebox addAction ["<t color='#ff0000'>Save loadout</t>", {publicVariableServer "saveRequest";}, nil, 3, true, true, "", "true"];
CUP_invLoadAction = thebox addAction ["<t color='#ff0000'>Load saved loadout</t>", {publicVariableServer "invRequest";}, nil, 2, false, true, "", "true"];