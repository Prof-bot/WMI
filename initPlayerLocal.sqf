//-------------------------------------------------------------
// initPlayerLocal.sqf
//
// Run locally for each player on mission join
//-------------------------------------------------------------
//WMI Action Setup
_chopperPickup = true;

//-------------------------------------------------------------
// WMI Action Folder Init
//-------------------------------------------------------------
	sleep 2;//delay to allow server to generate variables
	_WMI = ["WMI","WMI","",{nil},{true}] call ace_interact_menu_fnc_createAction;  
	[Player, 1, ["ACE_SelfActions"], _WMI] call ace_interact_menu_fnc_addActionToObject;
//-------------------------------------------------------------
// WMI Actions Init
//-------------------------------------------------------------

if (_chopperPickup) then
{
	_pickupCall = {
		_callerPos = Getpos player;
		nul = [_callerPos] execVM "core\pickupTransport\chopperPickup.sqf";
	};

	_pickup = ["Pickup","Request Pickup","",_pickupCall,{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","WMI"], _pickup] call ace_interact_menu_fnc_addActionToObject;
};




