comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;

comment "Add containers";
player forceAddUniform "rhsgref_uniform_reed";
for "_i" from 1 to 4 do {player addItemToUniform "rhs_30Rnd_545x39_AK";};
player addVest "V_HarnessO_gry";
for "_i" from 1 to 10 do {player addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_morphine";};
player addItemToVest "ACE_EarPlugs";
for "_i" from 1 to 4 do {player addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {player addItemToVest "SmokeShell";};

comment "Add weapons";
player addWeapon "rhs_weap_ak74";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";
