/*
 * WMIRespawnScript V 0.0.9
 * By Prof
 * Allows users call a respawn vehicle to a thrown objects position
 *	
 * Summary:
 * This will grab every player, then stick an event handler on firing - if the fired object is the one specified, it'll grab the bound vehicle
 * that functions as the respawn vehicle. That vehicle will then head to the marked location, wait for a time, then return.
 * NOTE - Only tested with choppers to-date. The goal is to make this vehicle agnostic, so it can be attached to anything.
 */

//========================== Init ===============================
respawnObject = "chemlight_yellow"; //What object is being watched for
sideOfPlayer = WEST; //Player Side
spawnVehicle = missionNamespace getVariable ["_respawnVehicle", objNull]; //The variable name of the respawn vehicle
showMapMarker = true; //True will show a marker for respawn. False will show no marker.
debug = true; //true outputs debug info. false gives no debug hints.
//========================== CodeStuff ===============================

if (isNull spawnVehicle) exitWith{
["You haven't set the respawn vehicle!"] call BIS_fnc_error;
};

//On actor Spawn
[] spawn {
//If the unit has an assigned UI e.g. it's a player, attach Respawn Logic
	if (hasInterface) then {

		//If player is specified side
		  if (side player isEqualTo sideOfPlayer) then
		  {
		  //Add "Fired" Event handler
			 player addEventHandler ["Fired",
			{
			//If they throw specified object
				if ((_this select 4) == respawnObject) then
				{
				//Wait till object is spawned
					(_this select 6) spawn
					{
					//Wait till object is removed from physics engine
						sleep 0.1;
						waitUntil {(speed _this <= 0) || (!alive _this)};
						//========================================
						//Respawn Logic
						//========================================
						
						//We need to initialise the marker, even if we don't use it so it's accessible to the below logic
						_respawnMarker = createMarker ["RespawnMarker", (position _this)];

						
						//Create Marker Logic --------------------
						if (showMapMarker) then
						{
							"RespawnMarker" setMarkerType "hd_pickup";
							"RespawnMarker" setMarkerColor "colorBLUFOR";
							"RespawnMarker" setMarkerText "Reinsert";
							if(debug) then
							{
								hint ("Respawn created at " + (str getPos _this));
							}
						};
						//----------------------------------------
						
						//Vehicle Logic --------------------------
						//Store the current vehicle position
						vehicleHome = (getPos spawnVehicle);
						//move to thrown object location
						spawnVehicle move (getPos _this);
						//allow command to be processed
						sleep 3;
						//while the spawn vehicle is still alive, and completed it's move command, we wait
						while { ( (alive spawnVehicle) && !(unitReady spawnVehicle) ) } do
						{
							   sleep 1;
						};
						//if the vehicle is still alive and ready, land
						if (alive spawnVehicle) then
						{
							   spawnVehicle land "LAND";
						};
						//now wait a bit so everyone gets out
						sleep 20;
						//follow same procedure as above to return to previous location
						spawnVehicle move vehicleHome;
						sleep 3;
						while { ( (alive spawnVehicle) && !(unitReady spawnVehicle) ) } do
						{
							   sleep 1;
						};
						if (alive spawnVehicle) then
						{
							   spawnVehicle land "LAND";
						};
						//----------------------------------------
						
						//Delete Marker Logic --------------------
						if (showMapMarker) then
						{
						//sleep to allow the reinsert to do it's thing, then delete the marker.
							sleep 30.0; 
							deleteMarker _respawnMarker;
							if(debug) then
							{
								hint ("Respawn removed");
							}
						};
						//----------------------------------------
						
					};
				};
			}];
		  };
	  }
  }
  
  
/*
USEFUL DATA:

Sides:
WEST
EAST

Throwables:
GrenadeHand - Grenade
chemlight_blue - chemlight_"colour" gives you a specific chemlight

*/
