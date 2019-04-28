/**
 * Marker Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];
PARAMS_1(_vehicle);

if (GVAR(service_vehicles) find (typeOf _vehicle) == -1) exitWith {};

_marker = createMarkerLocal [str ((position _vehicle) select 0), position _vehicle];
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTextLocal (getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"));
_marker setMarkerTypeLocal "o_maint";
_marker setMarkerAlphaLocal 0;