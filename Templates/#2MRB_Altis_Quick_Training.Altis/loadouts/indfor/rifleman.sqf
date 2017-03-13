comment "Exported from Arsenal by SSgt Cupcake";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;

comment "Add containers";
this forceAddUniform "rhsgref_uniform_reed";
for "_i" from 1 to 4 do {this addItemToUniform "rhs_30Rnd_545x39_AK";};
this addVest "V_HarnessO_gry";
for "_i" from 1 to 10 do {this addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 3 do {this addItemToVest "ACE_morphine";};
this addItemToVest "ACE_EarPlugs";
for "_i" from 1 to 4 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {this addItemToVest "SmokeShell";};

comment "Add weapons";
this addWeapon "rhs_weap_ak74";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemGPS";
