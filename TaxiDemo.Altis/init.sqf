//-------------------------------------------------------------
// init.sqf
//
// Run globally on mission start
//-------------------------------------------------------------

//Wait till all players are loaded before initial execution
if ((!isServer) && (player != player)) then {waitUntil {player == player};};


//-------------------------------------------------------------
// Start Mission Calls
//-------------------------------------------------------------
nul = [] execVM "core\setPV.sqf";
nul = [] execVM "intro.sqf";


//-------------------------------------------------------------
// Initialise Script Calls
//-------------------------------------------------------------
