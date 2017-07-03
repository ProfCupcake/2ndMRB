waitUntil {player == player};

saveRequest = player;
invRequest = player;
player addEventHandler ["Respawn", {saveRequest = player; invRequest = player;}];

waitUntil {serverReady};