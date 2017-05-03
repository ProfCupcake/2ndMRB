invDB = ["new", "krakatoa_invDB"] call OO_INIDBI;

invExport = compile preprocessfilelinenumbers "inventory\invExport.sqf";

invRequestHandler = 
{
	_player = _this select 1;
	_invSend = ["read", [getPlayerUID _player, "inv", ""]] call invDB;
	if (_invSend == "") exitWith {"Inventory load failed." remoteExec ["hint", owner _player];};
	_invSend = ["decodeBase64", _invSend] call invDB;
	_invSend = compile _invSend;
	_invSend remoteExec ["call", owner _player];
	"Inventory loaded." remoteExec ["hint", owner _player];
};
"invRequest" addPublicVariableEventHandler invRequestHandler;

saveRequestHandler = 
{
	_player = _this select 1;
	_invSave = [_player, "script", false] call invExport;
	_invSave = ["encodeBase64", _invSave] call invDB;
	_saveSuccess = ["write", [getPlayerUID _player, "inv", _invSave]] call invDB;
	if (_saveSuccess) then {"Inventory saved." remoteExec ["hint", owner _player];}
	else {"Inventory save failed." remoteExec ["hint", owner _player];};
};
"saveRequest" addPublicVariableEventHandler saveRequestHandler;

forceSaveHandler = 
{
	{
		[nil, _x] call saveRequestHandler;
	} foreach allPlayers;
};
"forceSave" addPublicVariableEventHandler forceSaveHandler;

disconnectHandler = 
{
	_player = _this select 0;
	_invSave = [_player, "script", false] call invExport;
	_invSave = ["encodeBase64", _invSave] call invDB;
	_saveSuccess = ["write", [_this select 2, "inv", _invSave]] call invDB;
	if (_saveSuccess) then {diag_log format ["Successful save on disconnect (UID %1)", _this select 2];}
	else {diag_log format ["Unsuccessful save on disconnect (UID %1)", _this select 2];};
};
addMissionEventHandler ["HandleDisconnect", disconnectHandler];

serverReady = true;
publicVariable "serverReady";