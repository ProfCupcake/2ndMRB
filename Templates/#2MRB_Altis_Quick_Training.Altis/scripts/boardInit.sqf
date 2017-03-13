
call compile preprocessfilelinenumbers "scripts\functions.sqf";

missionBoard addAction[format ["<t color='%1'>Movement Practice</t>", actionColour], "scripts\movementServer.sqf"];
missionBoard addAction[format ["<t color='%1'>Outdoor CQC</t>", actionColour], "scripts\cqcOutServer.sqf"];
missionBoard addAction[format ["<t color='%1'>Indoor CQC</t>", actionColour], "scripts\cqcInServer.sqf"];

playerReturn = 0;

playerTeam = 0;

bluforCount = 0;
opforCount = 0;
indforCount = 0;

publicVariable "bluforCount";
publicVariable "opforCount";
publicVariable "indforCount";