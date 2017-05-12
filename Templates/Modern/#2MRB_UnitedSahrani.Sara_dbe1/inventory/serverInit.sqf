invDB = ["new", "template_ww2_invDB"] call OO_INIDBI;

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

serverReady = true;
publicVariable "serverReady";