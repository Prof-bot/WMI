/*=============================================================================================
Add EventHandler when player is inside the TransportChopper and presses the appropriate button.
---
EventHandler passes clicked location to to landRequest.sqf or loiterRequest.sqf

_requestType Enum:
0 - Land Request
1 - Circle Request
===============================================================================================*/
	/*
	--------------------
	Tip to me (And anyone digging through the code)
	--------------------
	The localNamespace stashing is pretty helpful when circumventing variable locality (Particularly when they aren't going to be broadcast)

	Since the pos will be broadcast to the missionNamespace later, and the handlerID is only managed locally in the uiNamespace,
	we can throw them into the localNamespace in order to allow the eventHandlers bound to the control displays to access and set the variables
	independent of one another.

	So we're basically using them as a stateBag for passing variables throughout the different dataflows arma's got going on in it's engine.
	--------------------
================================================================================================*/

while {true} do {
	//hint "running transportMoveRequest";

	waitUntil {(objectParent player) == transportVehicle}; //Wait until the player is in the transportVehicle

	if((objectParent player) == transportVehicle) then {
		//hint "player in vehicle";

		localNamespace setVariable ["_mapClicked", false];
		localNamespace setVariable ["_requestType", 0];

		callChopper = (findDisplay 46) displayAddEventHandler ["KeyDown", //Get gamedisplay 46 for WorldView
			{
				params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
				//hint format ["pressed %1", _this select 1]; //Enable this to find the DIK Code for the button you're pressing
				if (_key == 44) then //If 'Z' is pressed
				{ 
					createDialog "RscHeliTaxi";
					_display = findDisplay 1234;

					//Update RequestType text to match what request type is currently active (Saves you having to re-press the button all the time)
					_ctrl = _display displayCtrl 1030;
					private _currentRequestType = localNamespace getVariable "_requestType";

						switch(_currentRequestType) do {
							case 0: 
							{
								//Land Request active
								_ctrl ctrlSetStructuredText parseText "Land";
							};
							case 1:
							{
								//Loiter request active
								_ctrl ctrlSetStructuredText parseText "Loiter";

							};
						};

					//Bind the HandlerID to a variable so we can clean it later
					_mapHandler = addMissionEventHandler ["MapSingleClick", {
						params ["_units", "_pos", "_alt", "_shift"];

						//Clear marker if it exists
						deleteMarkerLocal "taxiMark";
						deleteMarkerLocal "circleMark";
						deleteMarkerLocal "circleArea";

						//Place the appropriate marker type depending on what command we're issuing
						private _rType = localNamespace getVariable "_requestType";

						switch(_rType) do {
							case 0: 
							{
								//Land Request
								//Gen marker
								taxiMark = createMarkerLocal ["taxiMark", _pos];
								"taxiMark" setMarkerTypeLocal "hd_pickup";
								"taxiMark" setMarkerColorLocal "colorBLUFOR";
							};
							case 1:
							{
								//Loiter Request
								circleMark = createMarkerLocal 		["circleMark", _pos];
								"circleMark" setMarkerTypeLocal 	"selector_selectedMission";
								"circleMark" setMarkerColorLocal 	"colorBLUFOR";
								circleArea = createMarkerLocal 		["circleArea", _pos];
								"circleArea" setMarkerShapeLocal 	"ELLIPSE";
								"circleArea" setMarkerSizeLocal 	[100,100];
								"circleArea" setMarkerColorLocal 	"colorBLUFOR";
								"circleArea" setMarkerAlphaLocal 	0.5;

							};
						};

						
						//Chuck _pos into in-scope var so we can use it elsewhere
						localNamespace setVariable ["_position", _pos];
						
					}];	

					//Bind 'Change Order Type' button controls
					_ctrl = _display displayCtrl 1030;
					_ctrl ctrlAddEventHandler ["ButtonClick", {
						params ["_ctrl"];

						private _rType = localNamespace getVariable "_requestType";

						switch(_rType) do {
							case 0: 
							{
								//Land>Loiter Request
								_ctrl ctrlSetStructuredText parseText "Loiter";
								localNamespace setVariable ["_requestType", 1];
							};
							case 1:
							{
								//Loiter>Land Request
								_ctrl ctrlSetStructuredText parseText "Land";
								localNamespace setVariable ["_requestType", 0];

							};
						};

						//Clean up everything we could have set above
						deleteMarkerLocal "taxiMark";
						deleteMarkerLocal "circleMark";
						deleteMarkerLocal "circleArea";
						localNamespace setVariable ["_mapClicked", false];
					}];					

					//Bind resets when someone presses the Esc button
					_display displayAddEventHandler ["Unload", {
						params ["_display", "_exitCode"];

						//Clean up everything we could have set above
						removeAllMissionEventHandlers "MapSingleClick";
						deleteMarkerLocal "taxiMark";
						deleteMarkerLocal "circleMark";
						deleteMarkerLocal "circleArea";
						localNamespace setVariable ["_mapClicked", false];

					}];

					//Bind 'OK' button controls
					_ctrl = _display displayCtrl 1010;
					_ctrl ctrlAddEventHandler ["ButtonClick", {
						params ["_ctrl"];

						private _pos = localNamespace getVariable "_position";

						//Make sure a position has been provided
						if (_pos isEqualTo []) then {
							return;
						};

						//Remove previously queued waypoints
						if((count waypoints (group (driver transportVehicle))) > 0) then
						{
							for "_i" from count waypoints (group (driver transportVehicle)) -1 to 0 step -1 do
							{
								deleteWaypoint [(group (driver transportVehicle)), _i];
							};
						};

						//Switch on request type
						_rType = localNamespace getVariable "_requestType";

						switch (_rType) do {
							case 0: { //Land Request

								//Make the AI confirm the movement order in text chat
								_nearestCity = text (nearestLocations [ _pos, ["Airport", "NameLocal", "NameVillage", "NameCity", "NameCityCapital","NameMarine"],20000] select 0);
								_formattedChat = format ["Roger, setting down near %1", _nearestCity];
								vehicle player vehicleChat _formattedChat;

								//Cleanup UI state
								localNamespace setVariable ["_mapClicked", true];
								deleteMarkerLocal "taxiMark";
								deleteMarkerLocal "circleMark";
								deleteMarkerLocal "circleArea";
								removeAllMissionEventHandlers "MapSingleClick";

								//Move chopper call
								nul = [_pos] execVM "core\autoTransport\landRequest.sqf";
								
								closeDialog 1;

							};

							case 1: { //Circle Request

								//Make the AI confirm the movement order in text chat
								_nearestCity = text (nearestLocations [ _pos, ["Airport", "NameLocal", "NameVillage", "NameCity", "NameCityCapital","NameMarine"],20000] select 0);
								_formattedChat = format ["Roger, circling near %1", _nearestCity];
								vehicle player vehicleChat _formattedChat;

								//Cleanup UI state
								localNamespace setVariable ["_mapClicked", true];
								deleteMarkerLocal "taxiMark";
								deleteMarkerLocal "circleMark";
								deleteMarkerLocal "circleArea";
								removeAllMissionEventHandlers "MapSingleClick";

								//Move chopper call
								nul = [_pos] execVM "core\autoTransport\loiterRequest.sqf";
								
								closeDialog 1;

							};
						}

						
					}];


					//Bind 'Cancel' button controls
					_ctrl = _display displayCtrl 1020;
					_ctrl ctrlAddEventHandler ["ButtonClick", {
						params ["_ctrl"];
						//Clean up everything we could have set above
						removeAllMissionEventHandlers "MapSingleClick";
						deleteMarkerLocal "taxiMark";
						deleteMarkerLocal "circleMark";
						deleteMarkerLocal "circleArea";
						localNamespace setVariable ["_mapClicked", false];
						closeDialog 2;
					}];
				};
				
			}
		];

		_pMapClicked = localnamespace getVariable "_mapClicked";
		waituntil {sleep 1; _pMapClicked == true}; //Wait until the above commands have all been run - this avoids order desync
		sleep 1;
		//Clear markers now we exit the UI
		deleteMarkerLocal "taxiMark"; 
		deleteMarkerLocal "circleMark";
		deleteMarkerLocal "circleArea";
		localNamespace setVariable ["_mapClicked", false]; //reset the variable for if you want to issue a new location mid-flight

	};

};