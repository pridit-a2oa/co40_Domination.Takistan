/**
 * Marker Module - Vehicle Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_service_types) find (typeOf _vehicle) == -1) exitWith {};

_marker = str ((_vehicle getVariable QGVAR(position)) select 0);
_marker setMarkerTypeLocal "o_maint";