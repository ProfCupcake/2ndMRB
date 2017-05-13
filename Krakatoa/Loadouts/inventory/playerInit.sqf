waitUntil {player == player};

// title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition
player addAction ["<t color='#FF0000'>[ADMIN] Force save all loadouts</t>", {publicVariableServer "forceSave";}, nil, -1, false, true, "", "serverCommandAvailable '#kick'"];

saveRequest = player;
invRequest = player;
player addEventHandler ["Respawn", {saveRequest = player; invRequest = player;}];

waitUntil {serverReady};

publicVariableServer "invRequest";