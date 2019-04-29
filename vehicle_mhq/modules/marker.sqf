/**
 * Vehicle MHQ Module - Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_mhq_types) find (typeOf _vehicle) == -1) exitWith {};

_marker = str ((_vehicle getVariable QGVAR(position)) select 0);
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTypeLocal "o_uav";