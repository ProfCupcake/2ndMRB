
call compile preprocessfilelinenumbers "scripts\functions.sqf";

missionBoard addAction ["Movement Practice", "scripts\movementServer.sqf"];
missionBoard addAction ["OutDoor CQC", "scripts\cqcOutServer.sqf"];
missionBoard addAction ["InDoor CQC", "scripts\cqcInServer.sqf"];

playerReturn = 0;