//-------------------------------------------------------------
// intro.sqf
//
// //Primarily for things like inro mission text, or intro cinematics
//-------------------------------------------------------------

//======= Mission Intro Text =========
["01:00PM", str(date select 2) + "/" + str(date select 1) + "/" + str(date select 0)] call BIS_fnc_infoText;
["Respawn Testing"] call BIS_fnc_infoText;                                                                       
["Begin Test..."] call BIS_fnc_infoText;