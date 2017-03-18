
call compile preprocessfilelinenumbers "scripts\functions.sqf";

missionBoard addAction[format ["<t color='%1'>Movement Practice</t>", actionColour], "scripts\movementServer.sqf"];
missionBoard addAction[format ["<t color='%1'>Outdoor CQC</t>", actionColour], "scripts\cqcOutServer.sqf"];
missionBoard addAction[format ["<t color='%1'>Indoor CQC</t>", actionColour], "scripts\cqcInServer.sqf"];

teleportSign addAction[format ["<t color='%1'>Blufor Spawn</t>", actionColour],'scripts\bluSpawn.sqf'];
teleportSign addAction[format ["<t color='%1'>Opfor Spawn</t>", actionColour],'scripts\opSpawn.sqf'];
teleportSign addAction[format ["<t color='%1'>Indfor Spawn</t>", actionColour],'scripts\indSpawn.sqf'];

playerActions = [];