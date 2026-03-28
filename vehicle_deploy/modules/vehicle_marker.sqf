/**
 * Vehicle Deploy Module - Vehicle Marker Submodule
 */

#include "x_macros.sqf"
private ["_vehicle", "_marker", "_deployed"];

PARAMS_2(_vehicle, _marker);

if !(typeOf _vehicle in GVAR(vehicle_deploy_types)) exitWith {};

_deployed = _vehicle getVariable QGVAR(deployed);

if (isNil "_deployed" || {!(_deployed select 0)}) exitWith {};

_marker set [1, "Deployed"];
_marker set [2, "Yellow"];