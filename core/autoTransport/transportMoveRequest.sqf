/*=============================================================================================
Add EventHandler when player is inside the TransportChopper and presses the appropriate button.
---
EventHandler passes clicked location to moveChopper.sqf
===============================================================================================*/

while {true} do {

waituntil {(objectParent player) == transportVehicle}; //Wait until the player is in the transportVehicle

		waituntil {visibleMap}; //Wait until player is viewing the map
		MapClicked = false;
		sleep 0.2;

			callChopper = (findDisplay 46) displayAddEventHandler ["KeyDown", //Get gamedisplay 46 for WorldView
				{
					if ((_this select 1) == 86) then //If backslash is pressed
					{	
						
						onMapSingleClick  //When map is clicked
						{
						//We double check the unit is in the chopper here to avoid being able to control it on the ground
							if(((objectParent player) == transportVehicle) && (!isNull objectParent player)) then
							{	
							
								//Remove current waypoints if available
								if((count waypoints (group (driver transportVehicle))) > 0) then
								{
									for "_i" from count waypoints (group (driver transportVehicle)) -1 to 0 step -1 do
									{
										deleteWaypoint [(group (driver transportVehicle)), _i];
									};
								};
								
								//Move chopper call
								nul = [_pos] execVM "core\autoTransport\moveChopper.sqf";
								MapClicked = true;
							}
						}
					}
				}
			];

		waituntil {MapClicked}; //Wait until the above commands have all been run - this avoids order desync
		sleep 1;
		MapClicked = false;   //reset the variable for if you want to issue a new location mid-flight
};