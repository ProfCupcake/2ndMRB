/*
Modified BIS_fnc_exportInventory. 

Only difference is that comments have been removed, allowing the base string to be used with compile. 
*/

_center = _this param [0,player,[objnull]];
_type = _this param [1,"script",[""]];
_identity = _this param [2,true,[true]];

_br = tostring [13,10];
_export = "";
switch _type do {

	case "script";
	case "init": {
		_fnc_addMultiple = {
			_items = _this select 0;
			_expression = _this select 1;
			_itemsUsed = [];
			{
				_item = _x;
				_itemLower = tolower _x;
				if !(_itemLower in _itemsUsed) then {
					_itemsUsed set [count _itemsUsed,_itemLower];
					_itemCount = {_item == _x} count _items;
					_expressionLocal = _expression;
					if (_itemCount > 1) then {
						_expressionLocal = format ["for ""_i"" from 1 to %1 do {%2};",_itemCount,_expression];
					};
					_export = _export + format [_expressionLocal,_var,_x] + _br;
				};
			} foreach _items;
		};

		_var = if (_type == "script") then {
			_export = _export + "_unit = player;" + _br;
			"_unit";
		} else {
			"this"
		};
		_export = _export + format ["removeAllWeapons %1;",_var] + _br;
		_export = _export + format ["removeAllItems %1;",_var] + _br;
		_export = _export + format ["removeAllAssignedItems %1;",_var] + _br;
		_export = _export + format ["removeUniform %1;",_var] + _br;
		_export = _export + format ["removeVest %1;",_var] + _br;
		_export = _export + format ["removeBackpack %1;",_var] + _br;
		_export = _export + format ["removeHeadgear %1;",_var] + _br;
		_export = _export + format ["removeGoggles %1;",_var] + _br;

		if (uniform _center != "") then {
			_export = _export + format ["%1 forceAddUniform ""%2"";",_var,uniform _center] + _br;
			[uniformitems _center,"%1 addItemToUniform ""%2"";"] call _fnc_addMultiple;
		};

		if (vest _center != "") then {
			_export = _export + format ["%1 addVest ""%2"";",_var,vest _center] + _br;
			[vestitems _center,"%1 addItemToVest ""%2"";"] call _fnc_addMultiple;
		};

		if (!isnull unitbackpack _center) then {
			_export = _export + format ["%1 addBackpack ""%2"";",_var,typeof unitbackpack _center] + _br;
			[backpackitems _center,"%1 addItemToBackpack ""%2"";"] call _fnc_addMultiple;
		};

		if (headgear _center != "") then {_export = _export + format ["%1 addHeadgear ""%2"";",_var,headgear _center] + _br;};
		if (goggles _center != "") then {_export = _export + format ["%1 addGoggles ""%2"";",_var,goggles _center] + _br;};

		//--- Weapons
		{		
			_weapon = _x select 0;
			_weaponAccessories = _x select 1;
			_weaponCommand = _x select 2;
			if (_weapon != "") then {
				_export = _export + format ["%1 addWeapon ""%2"";",_var,_weapon] + _br;
				{
					if (_x != "") then {_export = _export + format ["%1 %3 ""%2"";",_var,_x,_weaponCommand] + _br;};
				} foreach _weaponAccessories;
			};
		} foreach [
			[primaryweapon _center,_center weaponaccessories primaryweapon _center,"addPrimaryWeaponItem"],
			[secondaryweapon _center,_center weaponaccessories secondaryweapon _center,"addSecondaryWeaponItem"],
			[handgunweapon _center,_center weaponaccessories handgunweapon _center,"addHandgunItem"],
			[binocular _center,[],""]
		];

		//--- Items
		[assigneditems _center - [binocular _center],"%1 linkItem ""%2"";"] call _fnc_addMultiple;

		if (_identity) then {
			_export = _export + format ["%1 setFace ""%2"";",_var,_center getvariable ["BIS_fnc_arsenal_face",face _center]] + _br;
			_export = _export + format ["%1 setSpeaker ""%2"";",_var,speaker _center] + _br;

			_insignia = _center call bis_fnc_getUnitInsignia;
			if (_insignia != "") then {_export = _export + format ["[%1,""%2""] call bis_fnc_setUnitInsignia;",_var,_insignia] + _br;};
		};
	};
	case "config": {
		_fnc_addArray = {
			_name = _this select 0;
			_array = _this select 1;

			_export = _export + format ["%1[] = {",_name];
			{
				if (_foreachindex > 0) then {_export = _export + ",";};
				_export = _export + format ["""%1""",_x];
			} foreach _array;
			_export = _export + "};" + _br;
		};

		_export = _export + format ["uniform = ""%1"";",uniform _center] + _br;
		_export = _export + format ["backpack = ""%1"";",backpack _center] + _br;

		["weapons",weapons _center + ["Throw","Put"]] call _fnc_addArray;
		["magazines",magazines _center] call _fnc_addArray;
		["items",items _center] call _fnc_addArray;
		["linkedItems",[vest _center,headgear _center,goggles _center] + assigneditems _center - weapons _center] call _fnc_addArray;

	};
};

//--- Export to clipboard
copytoclipboard _export;
_export