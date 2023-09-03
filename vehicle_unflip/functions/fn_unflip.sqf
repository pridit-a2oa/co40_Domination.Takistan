#define THIS_MODULE vehicle_unflip
#include "x_macros.sqf"
private ["_vehicle"];

PARAMS_1(_vehicle);

if !([_vehicle] call FUNC(THIS_MODULE,valid)) exitWith {};

[true, "setVectorUp", [_vehicle, surfaceNormal position _vehicle]] call FUNC(network,mp);

[true, "say3D", [_vehicle, QGVAR(sound_unflip), 20]] call FUNC(network,mp);