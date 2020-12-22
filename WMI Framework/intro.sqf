//-------------------------------------------------------------
// intro.sqf
//
// //Primarily for things like inro mission text, or intro cinematics
//-------------------------------------------------------------

//======= Mission Intro Text =========
["01:17PM", str(date select 2) + "/" + str(date select 1) + "/" + str(date select 0)] call BIS_fnc_infoText;
["First Text Line"] call BIS_fnc_infoText;                                                                       
["Second Text Line"] call BIS_fnc_infoText;