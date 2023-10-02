/*===========================================================================
Move chopper to the requested location and loiter - called from transportMoveRequest.sqf
=============================================================================*/

//Set params
params ["_moveLocation"];
//----------------------------------------
//move to requested location and loiter
 _moveWaypoint = (group (driver transportVehicle)) addWaypoint [_moveLocation, 0];
 _moveWaypoint setWaypointType "LOITER";
 _moveWaypoint setWaypointLoiterType "CIRCLE";
 _moveWaypoint setWaypointLoiterRadius 100;
 
//----------------------------------------