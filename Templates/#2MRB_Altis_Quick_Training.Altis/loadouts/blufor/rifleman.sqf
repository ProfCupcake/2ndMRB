this = _this select 1;

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;

comment "Add containers";
this forceAddUniform "rhs_uniform_FROG01_wd";
for "_i" from 1 to 4 do {this addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
this addVest "V_HarnessO_brn";
this addItemToVest "ACE_EarPlugs";
for "_i" from 1 to 10 do {this addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 3 do {this addItemToVest "ACE_morphine";};
for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {this addItemToVest "SmokeShell";};
for "_i" from 1 to 4 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};

comment "Add weapons";
this addWeapon "rhs_weap_m16a4_carryhandle";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemGPS";