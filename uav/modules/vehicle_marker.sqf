/**
 * UAV Module - Vehicle Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (GVAR(uav_type_aircraft) find (typeOf _vehicle) == -1) exitWith {};

_marker = _vehicle getVariable QGVAR(id);
_marker setMarkerColorLocal "ColorBlue";