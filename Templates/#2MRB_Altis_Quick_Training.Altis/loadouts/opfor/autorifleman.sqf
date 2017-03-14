comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;

comment "Add containers";
player forceAddUniform "rhs_uniform_emr_patchless";
player addVest "V_HarnessO_ghex_F";
player addItemToVest "ACE_EarPlugs";
for "_i" from 1 to 10 do {player addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_morphine";};
for "_i" from 1 to 4 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "rhs_100Rnd_762x54mmR_green";
player addBackpack "rhs_sidor";
for "_i" from 1 to 2 do {player addItemToBackpack "rhs_100Rnd_762x54mmR_green";};

comment "Add weapons";
player addWeapon "rhs_weap_pkp";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";