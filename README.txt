===================================================
WMI Respawn Framework - v1
- by Prof
===================================================

----- HOW TO SET UP -----
-------------------------

* Place down your respawn vehicle
* Paste the below code into the vehicle init:

	missionNamespace setVariable ["_respawnVehicle", this];

* Make sure the vehicle is crewed. Give the mission a quick try with the framework attached (Your units need to be "Playable", not "Players"!!!)
* You'll get a message pop-up if the respawn hasn't been correctly set up.
* If no error messages appear, you should be good.


----- CUSTOMISING THE SCRIPT -----
----------------------------------

* Look inside the \core\ file to find the scripts.
* respawn.sqf has an init section at the top that you can use to customise a few variables.
	* These are things like "which object you throw to initiate respawn" and debug etc.


----- INIT DESCRIPTIONS -----
-----------------------------

* All viable inits have been set up with this, so additional code can be easily included.
* Inside each init it'll have a small description of when and why that init gets called, so any additional code can be added fairly easily.
* The full init order can be found here -> https://community.bistudio.com/wiki/Initialization_Order
	* You're looking for things associated with Event Scripting, so ignore the rest.


----------------------------------------------------------------------------------------------------------------------------------------------------------

Future developments:
--------------------
- Planning on getting this working with land vehicles - this just involves investigating the vehicle object to determine if there's an attached vehicle type
or if I can compile a list of vehicle template names and determine if there's a leading identifier for choppers, and when this is detected, bypassing the "LAND" orders
- Utilising the side detection, we could probably mesh this to work with multiple sides, allowing usage of automated reinsert vehicles for PVP, or multi-side operations
This mainly looks like it's going to be something like "create a function for detecting spawnVehicle that's called after player side-specification. Once side is stored,
perform a getVariable and store all results in an array. Check array for side-matching vehicle, perform movement logic on this sides vehicle"
- Some tweaking may be needed on the timing for pickup/dropoff. A check for "All players out" could also be performed to confirm all players have successfully exited the vehicle.
- A combat landing can be initiated by altering the crews combat behaviour to ignore potential incoming fire during the land order, which will allow inserts under-fire.
- A combat-inclusive landing can be achieved by altering pre-set landing behaviours upon detection of incoming fire. This could mean we can get reinsert vehicles doing
strafing manuvours to clear landing sites, rocket strikes on potential danger targets if they are called in etc. This could actually be utilised to create a in-depth fire-support script.
But honestly that sounds like work. And we probably don't need that functionality anyway.
- Could utilise an array of getVariables to create a whole fleet of respawn vehicles. Each vehicle object can have a 'inTransit' variable, that shows when they are assigned to a reinsert.
Any thrown objects can then give orders to a non-transit vehicle, meaning mutliple squads can get respawns at the same time.
===========================================================================================================================================================