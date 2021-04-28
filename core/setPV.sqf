/*==================================================
Set the public variables required by various scripts
====================================================*/



//------- Transport Vehicle -------

if (isNil "transportVehicle") then //check if the variable has already been set and broadcast
{
	transportVehicle = missionNamespace getVariable ["_transport", objNull]; //The variable name of the respawn vehicle
	publicVariable "transportVehicle"; //Set the variable to public on the server
	
};

if (isNil "vehicleHome") then
{
	vehicleHome = (getPos transportVehicle); //The home location for the transport vehicle
	publicVariable "vehicleHome"; //Set the variable to public on the server
	
};

nul = [transportVehicle] execvm "core\autoTransport\transportMoveRequest.sqf";

// --------------------------------