# Loadout System for Krakatoa

Requires "iniDBI2" mod. 

Initialise via initServer and initPlayerLocal, as in the files provided. 

Script will automatically load a player's loadout when they join the game, both at mission start and JIP. Saves will be performed either when the client disconnects or when the "save all" action is selected by a logged-in admin. 

To save a client's loadout via an external script:-

Run `publicVariableServer "saveRequest";` from the client whose loadout you are saving. 

Loading is identical, but with "invRequest" instead of "saveRequest". 