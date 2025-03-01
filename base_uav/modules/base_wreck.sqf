/**
 * Base UAV Module - Base Wreck Submodule
 */

#define THIS_MODULE base_uav
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

_vehicle setDir (direction GVAR(base_uav));
_vehicle setPosATL (GVAR(base_uav) modelToWorld ([typeOf _vehicle] call FUNC(THIS_MODULE,offset)));