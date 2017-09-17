invDB = ["new", _this] call OO_INIDBI;

if (isNil {invDB}) exitWith
{
	"invDB initialisation failed" remoteExec ["hint"];
};

invExport = compile preprocessfilelinenumbers "inventory\invExport.sqf";

invRequestHandler = 
{
	_player = _this select 1;
	_invSend = ["read", [getPlayerUID _player, "inv", ""]] call invDB;
	if (_invSend == "") exitWith {"Inventory load failed." remoteExec ["hint", owner _player];};
	if (count _invSend > 2732) then
	{
		_invSendArray = [_invSend, 2732] call compile preprocessfilelinenumbers "inventory\splitLongString.sqf";
		_invSend = "";
		{
			_newPart = ["decodeBase64", _x] call invDB;
			_invSend = _invSend + _newPart;
		} foreach _invSendArray;
	} else
	{
		_invSend = ["decodeBase64", _invSend] call invDB;
	};
	_invSend = compile _invSend;
	_invSend remoteExec ["call", owner _player];
	"Inventory loaded." remoteExec ["hint", owner _player];
};
"invRequest" addPublicVariableEventHandler invRequestHandler;

saveRequestHandler = 
{
	_player = _this select 1; //Get player from publicVariable call
	_invSave = [_player, "script", false] call invExport;
	if (count _invSave > 2048) then //Handle oversized loadout string
	{
		_invSaveArray = [_invSave, 2048] call compile preprocessfilelinenumbers "inventory\splitLongString.sqf";
		_invSave = "";
		{
			_newPart = ["encodeBase64", _x] call invDB;
			_invSave = _invSave + _newPart;
		} foreach _invSaveArray;
	} else
	{
		_invSave = ["encodeBase64", _invSave] call invDB;
	};
	_saveSuccess = ["write", [getPlayerUID _player, "inv", _invSave]] call invDB;
	if (_saveSuccess) then {"Inventory saved." remoteExec ["hint", owner _player];}
	else {"Inventory save failed." remoteExec ["hint", owner _player];};
};
"saveRequest" addPublicVariableEventHandler saveRequestHandler;

serverReady = true;
publicVariable "serverReady";