/**
 * Vehicle Service Module - Vehicle Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_1(_vehicle);

if (GVAR(vehicle_service_type_vehicles) find (typeOf _vehicle) == -1) exitWith {};

_marker = _vehicle getVariable QGVAR(id);
_marker setMarkerTypeLocal "o_maint";