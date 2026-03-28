/**
 * Vehicle Lift Module - Vehicle Marker Submodule
 */

#define THIS_MODULE vehicle_lift
#include "x_macros.sqf"
private ["_vehicle", "_marker", "_attached"];

PARAMS_2(_vehicle, _marker);

if ([[GVAR(vehicle_lift_types), typeOf _vehicle] call BIS_fnc_findNestedElement, []] call BIS_fnc_areEqual) exitWith {};

_attached = _vehicle getVariable QGVAR(attached);

if (isNil "_attached" || {isNull _attached}) exitWith {};

_marker set [1, "+1"];