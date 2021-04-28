//Vehicle Logic --------------------------
//Set params
params ["_moveLocation"];
//----------------------------------------
//Delete any outstanding waypoints to make most recent request priority
if((count waypoints (group (driver transportVehicle))) > 0) then
{
	for "_i" from count waypoints (group (driver transportVehicle)) -1 to 0 step -1 do
	{
		deleteWaypoint [(group (driver transportVehicle)), _i];
	};
};
//move to requested pickup location
 _moveWaypoint = (group (driver transportVehicle)) addWaypoint [_moveLocation, 0];
 _moveWaypoint setWaypointType "MOVE";
 _moveWaypoint setWaypointStatements ["true", "transportVehicle land 'GET IN'"];
//----------------------------------------