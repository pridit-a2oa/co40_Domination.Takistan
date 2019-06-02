/**
 * 3D Module - Vehicle Wreck Submodule
 */

#define THIS_MODULE 3d
#include "x_macros.sqf"
private ["_position", "_name"];

PARAMS_2(_position, _name);

[_position, _name call FUNC(common,YellowText), "vehicle_wreck"] call FUNC(THIS_MODULE,create);