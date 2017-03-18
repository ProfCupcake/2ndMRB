
call compile preprocessfilelinenumbers "scripts\functions.sqf";

missionBoard addAction[format ["<t color='%1'>Movement Practice</t>", actionColour], "scripts\movementServer.sqf"];
missionBoard addAction[format ["<t color='%1'>Outdoor CQC</t>", actionColour], "scripts\cqcOutServer.sqf"];
missionBoard addAction[format ["<t color='%1'>Indoor CQC</t>", actionColour], "scripts\cqcInServer.sqf"];

//title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition
teleportSign addAction[format ["<t color='%1'>BLUFOR Spawn</t>", actionColour],'scripts\bluSpawn.sqf', nil, 1.5, true, true, "", "missionRunning"];
teleportSign addAction[format ["<t color='%1'>OPFOR Spawn</t>", actionColour],'scripts\opSpawn.sqf', nil, 1.5, true, true, "", "missionRunning"];
teleportSign addAction[format ["<t color='%1'>INDFOR Spawn</t>", actionColour],'scripts\indSpawn.sqf', nil, 1.5, true, true, "", "missionRunning"];

playerActions = [];