waitUntil {player == player};

saveRequest = player;
invRequest = player;
player addEventHandler ["Respawn", {saveRequest = player; invRequest = player;}];

if (isNil {serverReady}) then {serverReady = false};
waitUntil {serverReady};