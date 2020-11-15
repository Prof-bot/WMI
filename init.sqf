//-------------------------------------------------------------
// init.sqf
//
// Run globally on mission start
//-------------------------------------------------------------

//Wait till all players are loaded before initial execution
if ((!isServer) && (player != player)) then {waitUntil {player == player};};

//Define the root file for our mission - just in case calling files gets weird
_root = call {
private ["_arr"];
_arr = toArray str missionConfigFile;
_arr resize (count _arr - 15);
toString _arr;
};

//Define Respawn Vehicle
spawnVehicle = missionNamespace getVariable ["_respawnVehicle", objNull]; //The variable name of the respawn vehicle


//-------------------------------------------------------------
// Start Mission Calls
//-------------------------------------------------------------

//Set up Respawn Vehicle so it won't run out of fuel
while {true} do
	{
		if ((fuel (spawnVehicle select 0)) < 0.8) then
		{
			(spawnVehicle select 0) setFuel 1;
		};
		sleep 300;
	};