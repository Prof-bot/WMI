/*===========================================================================
Move chopper to the requested location - called from transportMoveRequest.sqf
=============================================================================*/

//Set params
params ["_moveLocation"];
//----------------------------------------
//move to requested location
 _moveWaypoint = (group (driver transportVehicle)) addWaypoint [_moveLocation, 0];
 _moveWaypoint setWaypointType "MOVE";
 _moveWaypoint setWaypointStatements ["true", "transportVehicle land 'GET OUT'"];
 
//Wait until no more players are in the chopper before continuing with RTB
waituntil {{_x in transportVehicle} count allPlayers == 0}; //Wait until there's no players in the helo

/*
One of two things can now happen.
1. All players get out - Chopper returns to base
2. Some players get out, the remaining players can then give another location, retriggering the above code block.
*/

//Return the chopper to the designated vehicle home.
 _moveWaypoint = (group (driver transportVehicle)) addWaypoint [vehicleHome, 0];
 _moveWaypoint setWaypointType "MOVE";
 _moveWaypoint setWaypointStatements ["true", "transportVehicle land 'LAND'"];
//----------------------------------------