comment "TTsKO Mountain";

comment "Exported from Arsenal by Sgt Poh";

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "rhsgref_uniform_ttsko_mountain";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 4 do {player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addVest "rhsgref_6b23_ttsko_mountain_rifleman";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_30Rnd_545x39_AK_green";};
player addBackpack "rhs_assault_umbts";
for "_i" from 1 to 8 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
player addHeadgear "rhsgref_ssh68_ttsko_mountain";

comment "Add weapons";
player addWeapon "rhs_weap_ak74m";
player addPrimaryWeaponItem "rhs_acc_dtk";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "tf_microdagr";
player linkItem "tf_anprc148jem_1";
player linkItem "ItemGPS";
