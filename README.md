===================================================

WMI Respawn Framework - v1.2
- by Prof

===================================================

----- HOW TO SET UP ----- 
-------------------------
(Do this properly otherwise it won't work, and I take no responsibility)

* Place down your respawn vehicle
* Paste the below code into the vehicle init:

	missionNamespace setVariable ["_respawnVehicle", this];

* Make sure the vehicle is crewed. Give the mission a quick try with the framework attached, you'll get a message pop-up if the respawn hasn't been correctly set up.
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

----- What's LYSFWC.paa? -----
------------------------------

It's a custom unit patch I made that I've left in for "future stuff". If you want to see it, put on the 111th Infantry patch.
If you're comfortable generating .paa files and want to make one of you're own, just look at the documentation for the image sizing,
make the image, convert it to a .paa with the ARMATOOLS program, and pop it in here. Copy the description.ext code I've used and select the same or a different patch.
Then you're all good to go.


Future developments:
--------------------
- Planning on making this a little more compatible with land vehicles and allowing them to use the same smart routing system I'm using with the aerial vehicles (I.E, using appropriate waypoints)
  - this just involves investigating the vehicle object to determine if there's an attached vehicle type
or if I can compile a list of vehicle template names and determine if there's a leading identifier for choppers, and when this is detected, bypassing the "LAND" orders
- Utilising the side detection, we could probably mesh this to work with multiple sides, allowing usage of automated reinsert vehicles for PVP, or multi-side operations
This mainly looks like it's going to be something like "create a function for detecting spawnVehicle that's called after player side-specification. Once side is stored,
perform a getVariable and store all results in an array. Check array for side-matching vehicle, perform movement logic on this sides vehicle"
- Some tweaking may be needed on the timing for pickup/dropoff. A check for "All players out" could also be performed to confirm all players have successfully exited the vehicle.
- A combat landing can be initiated by altering the crews combat behaviour to ignore potential incoming fire during the land order, which will allow inserts under-fire.
- A combat-inclusive landing can be achieved by altering pre-set landing behaviours upon detection of incoming fire. This could mean we can get reinsert vehicles doing
strafing manuvours to clear landing sites, rocket strikes on potential danger targets if they are called in etc. This could actually be utilised to create a in-depth fire-support script.
But honestly that sounds like work. And we probably don't need that functionality anyway.
===========================================================================================================================================================

----- I found a bug, what do I do? -----
----------------------------------------

Go to https://github.com/Prof-bot/WMI and leave a proper bug report.

Please include:
  - What happened
  - How you got it to happen
  - Can you replicate the issue?
  - How do you replicate the issue?
  - Server type (singleplayer, local, dedicated etc.)

If you don't, I'll pretend like I've never seen it before.
