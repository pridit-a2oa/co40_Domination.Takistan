/**
 * Vehicle MHQ Module - Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];
PARAMS_1(_vehicle);

if (GVAR(vehicle_mhq_types) find (typeOf _vehicle) == -1) exitWith {};

_marker = createMarkerLocal [str ((position _vehicle) select 0), position _vehicle];
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"));
_marker setMarkerTypeLocal "o_uav";
_marker setMarkerAlphaLocal 0;