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


//-------------------------------------------------------------
// Start Mission Calls
//-------------------------------------------------------------
nul = [] execVM "core\setPV.sqf";
nul = [] execVM "intro.sqf";


//-------------------------------------------------------------
// Initialise Script Calls
//-------------------------------------------------------------
