=============================

WMI Respawn Framework - v2.0
- by Prof

==============================

----- HOW TO SET UP ----- 
-------------------------
(Do this properly otherwise it won't work, and I take no responsibility)

-TRANSPORT CHOPPER-

To set up the transport chopper...

* Place down your desired helicopter
* If the crew consists of just a pilot and co-pilot, change their group to be careless (this stops them flying away when getting shot at)
* If the crew consists of a Pilot/Co-Pilot and gunners, take all the AI out of the chopper, and put them into 2 groups - one for the pilot/co-pilot and one for the gunners
* Make the pilot/co-pilot group careless, and leave the gunners as is - put them back into the chopper in the regular seats, and now the gunners will attack as the chopper flies in.
* Paste the below code into the vehicle init:

	missionNamespace setVariable ["__transport", this];

You're all good to go!


----- CUSTOMISING THE SCRIPT -----
----------------------------------

I've removed some of the customisation options for now, but will re-add them in a future release.
If there's any specific customisation you'd like to see, let me know.


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
	- This just involves investigating the vehicle object to determine if there's an attached vehicle type
or if I can compile a list of vehicle template names and determine if there's a leading identifier for choppers, and when this is detected, bypassing the "LAND" orders
- Utilising the side detection, we could probably mesh this to work with multiple sides, allowing usage of automated reinsert vehicles for PVP, or multi-side operations
This mainly looks like it's going to be something like "create a function for detecting spawnVehicle that's called after player side-specification. Once side is stored,
perform a getVariable and store all results in an array. Check array for side-matching vehicle, perform movement logic on this sides vehicle"
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

If you don't, I'll likely forget and it won't get fixed.
