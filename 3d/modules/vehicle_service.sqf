/**
 * 3D Module - Vehicle Service Submodule
 */

#define THIS_MODULE 3d
#include "x_macros.sqf"
private ["_object", "_name"];

PARAMS_2(_object, _name);

[_object, _name call FUNC(common,YellowText)] call FUNC(THIS_MODULE,create);