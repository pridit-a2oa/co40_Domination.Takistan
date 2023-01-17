#define THIS_MODULE vehicle_flip
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {};

[_vehicle, "setVectorUp", surfaceNormal position _vehicle] call FUNC(network,mp);

[true, "say3D", [_vehicle, QGVAR(sound_flip), 20]] call FUNC(network,mp);