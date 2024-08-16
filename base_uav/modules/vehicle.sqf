/**
 * Base UAV Module - Vehicle Submodule
 */

#define THIS_MODULE vehicle_uav
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([GVAR(base_uav_type_vehicle), typeOf _vehicle] call BIS_fnc_areEqual) exitWith {};
if (_vehicle distance (position GVAR(base_uav)) > 5) exitWith {};

X_JIPH setVariable [QGVAR(base_uav), _vehicle, true];