/**
 * Vehicle Deploy Module - Vehicle Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker"];

PARAMS_2(_vehicle, _marker);

if !(typeOf _vehicle in GVAR(vehicle_deploy_types)) exitWith {_marker};
if !((_vehicle getVariable QGVAR(deployed)) select 0) exitWith {_marker};

_marker set [1, "Deployed"];
_marker set [2, "Yellow"];

_marker