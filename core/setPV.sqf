if (isNil "spawnVehicle") then //check if the variable has already been set and broadcast
{
	spawnVehicle = missionNamespace getVariable ["_respawnVehicle", objNull]; //The variable name of the respawn vehicle
	publicVariable "spawnVehicle"; //Set the variable to public on the server
	
};

if (isNil "vehicleHome") then
{
	vehicleHome = (getPos spawnVehicle); //The home location for the spawn vehicle
	publicVariable "vehicleHome"; //Set the variable to public on the server
	
};