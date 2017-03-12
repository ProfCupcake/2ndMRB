veh = createVehicle ["C_Heli_Light_01_civil_F",position cupcakes_secret_littlebird,[],0,"NONE"];
[veh,["wasp",1],["AddCargoHook_COver",0]] call BIS_fnc_initVehicle;
veh lock 2;

original = createGroup WEST;
groupB = createGroup WEST;
groupO = createGroup EAST;
groupI = createGroup INDEPENDENT;

publicVariable "groupB";
publicVariable "groupO";
publicVariable "groupI";

publicVariable "original";

/*veh addEventHandler ["Hit", {
  _veh = _this select 0;
  _culprit = _this select 1;
  _distance = _veh distance _culprit;
  if ((getPlayerUID _culprit == 76561197995448080) && (_distance <= 5)) then
  {
    _veh lock 0;
  };
}];*/