/**
 * 3D Module - Vehicle Service Submodule
 */

#define THIS_MODULE 3d
#include "x_macros.sqf"
private ["_position", "_name"];

PARAMS_2(_position, _name);

[_position, _name call FUNC(common,YellowText)] call FUNC(THIS_MODULE,create);